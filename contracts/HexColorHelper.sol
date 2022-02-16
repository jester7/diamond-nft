// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// [MIT License]
/// @title HexColorHelper
/// @notice Provides a function to generate a random hex color string with leading #
/// @author F. Jovan Jester <jovan@jester.cafe>
abstract contract HexColorHelper {

    // got idea from openzeppelin/contracts/utils/Strings.sol;
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";
    uint256 private position = 0;

    // inspired by toHexString in openzeppelin/contracts/utils/Strings.sol;
    // probably better to use something like Chainlink
    // TODO needs to be optimized
    function randHexColor(uint256 tokenId, string memory seed) internal view returns (bytes memory) {
        // generate a hash of block timestamp and tokenId as a source of pseudo-random numbers
        bytes32 randHash = keccak256(abi.encodePacked(block.timestamp, tokenId, seed));
        // total 6 hexadecimal digits in one 24 bit RGB value, plus 1 extra for the # char
        bytes memory hexColor = new bytes(7);
        uint8 val;
        uint16 sum = 0;
        hexColor[0] = "#";
        for (uint256 i = 0; i < 6; i++) {
            val = uint8(randHash[i]) & 0xf;
            if (i % 2 == 0) {
                sum += val;
            }
            // since index 0 is the #, use i+1 index for hexColor, i for randHash
            hexColor[i + 1] = _HEX_SYMBOLS[uint8(randHash[i]) & 0xf];
        }

        return hexColor;
    } 

}