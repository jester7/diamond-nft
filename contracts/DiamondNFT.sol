//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./DiamondNFTSvg.sol";
import { Base64 } from "./libraries/Base64.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


// import "hardhat/console.sol";


contract DiamondNFT is DiamondNFTSvg, ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    uint256 public constant MAX_SUPPLY = 1000;

    event NewDiamond(address sender, uint256 tokenId);


    constructor() ERC721 ("DiamondNFTTest", "TESTDIAMOND") {
        //console.log("constructor called...");
    }

    function mint() public {
        require(_tokenIds.current() < MAX_SUPPLY, "all NFTs are gone! sorry, ngmi");
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        bytes memory svg = buildFinalSvg(newItemId);
        _setTokenURI(newItemId, string(abi.encodePacked("data:application/json;base64,", Base64.encode(
                abi.encodePacked(
                    '{"name": "A shiny diamond NFT","description": "This diamond was generated on the blockchain.", "image": "data:image/svg+xml;base64,',
                    Base64.encode(svg),
                    '"}'
                )))));
        _tokenIds.increment();
        emit NewDiamond(msg.sender, newItemId);
        // console.log("here is your svg:");
        // console.log(string(svg));
    }
}
