//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./HexColorHelper.sol";


abstract contract DiamondNFTSvg is HexColorHelper {

    string constant baseSvg = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 747 747"><defs>';
    string constant gradientSvg1 = '<linearGradient id="gradient-fill" y1="373.5" x2="747" y2="373.5" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="';
    string constant gradientSvg2 = '"/><stop offset="1" stop-color="';
    string constant gradientSvg3 = '"/></linearGradient>';
    string constant closingSvg = '<style>.facet{opacity:.9}.edges{fill:#fff}.dark{fill:#aaa}.medium{fill:#ccc}</style></defs><g class="facet"><g class="facet"><path class="dark" d="M189.8 185.5 373.5 1.8l183.7 183.7H189.8z"/><path class="edges" d="m373.5 3.5 180.7 180.7H192.8L373.5 3.5m0-3.5L186.8 186.7h373.4L373.5 0Z"/></g><g class="facet"><path class="dark" d="M562.3 185.5 653.6 2.8 745 185.5H562.3z"/><path class="edges" d="M653.6 5.6 743 184.2H564.3L653.6 5.6m0-5.6-93.4 186.7H747L653.6 0Z"/></g><g class="facet"><path class="dark" d="M2 185.5 93.4 2.8l91.3 182.7H2z"/><path class="edges" d="m93.4 5.6 89.3 178.6H4L93.4 5.6m0-5.6L0 186.7h186.8L93.4 0Z"/></g><g class="facet"><path class="medium" d="M95.4 1.3h275.1L187.1 184.6 95.4 1.3z"/><path class="edges" d="m367.5 2.5-180.1 180-90-180h270.1m6-2.5H93.4l93.4 186.7L373.5 0Z"/></g><g class="facet"><path class="medium" d="M376.5 1.3h275.1l-91.7 183.3L376.5 1.3z"/><path class="edges" d="m649.6 2.5-90 180-180.1-180h270.1m4-2.5H373.5l186.7 186.7L653.6 0Z"/></g><g class="facet"><path class="medium" d="M2.3 188h183.5l183.6 550.5L2.3 188z"/><path class="edges" d="m184.9 189.2 180.3 540.9L4.7 189.2h180.2m1.9-2.5H0L373.5 747 186.8 186.7Z"/></g><g class="facet"><path class="medium" d="M561.2 188h183.5L377.6 738.5 561.2 188z"/><path class="edges" d="M742.3 189.2 381.8 730.1l180.3-540.9h180.2m4.7-2.5H560.2L373.5 747 747 186.7Z"/></g><g class="facet"><path style="fill:#eee" d="M188.5 188h370l-185 555-185-555z"/><path class="edges" d="M556.8 189.3 373.5 739.1 190.2 189.3h366.6m3.5-2.5H186.8L373.5 747l186.8-560.2Z"/></g></g><path style="opacity:.6;fill:url(#gradient-fill)" d="M93.4 0 0 186.8 373.5 747 747 186.8 653.6 0H93.4"/></svg>';
    
    function buildFinalSvg(uint256 id) internal view returns (bytes memory) {
        return 
            abi.encodePacked(baseSvg, gradientSvg1,
            randHexColor(id, "start color"), gradientSvg2,
            randHexColor(id, "end color"), gradientSvg3,
            closingSvg);
    }
}