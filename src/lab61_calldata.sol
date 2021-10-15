// SPDX-License-Identifier: UNLICENSED
// lab61_calldata.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {

    // function compare(uint32 _in, bool _def) public pure returns (bool) {
    //     return (_in > 131 || _def);
    // }

    function compare(uint32 _in, bool _def) public pure returns (bool ret) {
        ret = (_in > 131 || _def);
        // ret = (_in > 131 && _def);
    }
    // check the "input" field in console log
    // (76,  false) false => 0x8c84f3db000000000000000000000000000000000000000000000000000000000000004c0000000000000000000000000000000000000000000000000000000000000000
    // (76,  true)  true  => 0x8c84f3db000000000000000000000000000000000000000000000000000000000000004c0000000000000000000000000000000000000000000000000000000000000001
    // (177, false) true  => 0x8c84f3db00000000000000000000000000000000000000000000000000000000000000b10000000000000000000000000000000000000000000000000000000000000000
    // (177, true)  true  => 0x8c84f3db00000000000000000000000000000000000000000000000000000000000000b10000000000000000000000000000000000000000000000000000000000000001

    // 0x4c => 76, 0xb1 => 177
    // 0 => false, 1 => true
    // also check the "decoded input"

    function testKeccak256(string memory _str) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_str));
    }
    // "compare(uint32,bool)" => 0x8c84f3dba457642519a903a6e34095bcdf9b6944665d544872adb8c5fbe7c822
    //                           ^^^^^^^^^^
    //                           0x8c84f3db
}
