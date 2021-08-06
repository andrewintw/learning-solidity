// SPDX-License-Identifier: UNLICENSED
// lab29_encodePackedTest.sol

pragma solidity ^0.8.6;

contract TestContract {

    function printHash() public pure returns (bytes32, bytes32, bytes32, bytes32, bytes32, bytes32) {
        return (keccak256(abi.encodePacked("writing the time lag")),
                keccak256(abi.encodePacked("writing", " ", "the", " ","time", " ", "lag")),
                keccak256(abi.encodePacked("writing", "the", "time", "lag")),
                keccak256(abi.encodePacked("writingthe", "timelag")),
                keccak256(abi.encodePacked("writingthetimelag")),
                keccak256(abi.encodePacked("writing", "the", "", "time", "", "lag"))
                );
    }
/*  result:   
    0: bytes32: 0x023f4677f7c83c27b019ade815485feb5e24bba0b59b9dfa8bc7d8ca587093fb (相同)
    1: bytes32: 0x023f4677f7c83c27b019ade815485feb5e24bba0b59b9dfa8bc7d8ca587093fb
    
    2: bytes32: 0xcb8bd5b76400c198046490181ae407fe6ee250da682f238c7e485d5cd4004de2 (相同)
    3: bytes32: 0xcb8bd5b76400c198046490181ae407fe6ee250da682f238c7e485d5cd4004de2
    4: bytes32: 0xcb8bd5b76400c198046490181ae407fe6ee250da682f238c7e485d5cd4004de2
    5: bytes32: 0xcb8bd5b76400c198046490181ae407fe6ee250da682f238c7e485d5cd4004de2
*/
}
