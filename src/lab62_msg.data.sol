// SPDX-License-Identifier: UNLICENSED
// lab62_msg.data.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {

    function pub() public pure returns (bytes memory) {
        return msg.data;
    }

    function callPri() public pure returns (bytes memory) {
        return _pri();
    }

    function _pri() private pure returns (bytes memory) {
        return msg.data;
    }
    
    // try: 0x747a7574756e67
    function pubParm(bytes memory _name) public pure returns (bytes memory, string memory) {
        return (msg.data, string(_name));
    }
    
    function testKeccak256(string memory _str) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_str));
    }
    // "pub()"          => 0x7defb410 0bd473ee613cd53a8e67a8432740d6314b10bca32c88045b71f58cbe
    // "callPri()"      => 0x815eb902 0d0eb58b4f6833739451eb6e45952fb163cfd759ea8b5ee18c7868cb
    // "_pri()"         => 0x8cde148f b47025ef2ba74130c9cd2084ef933f169d48830c0551bb42dd392c35
    // "pubParm(bytes)" => 0x17161e7e 71e37d3a4ca242079761441c3a813cb692c65815d7a0edd734b1999a
}
