// SPDX-License-Identifier: UNLICENSED
// lab25_string_bytes.sol

pragma solidity ^0.8.6;

contract TestContract {
    
    bytes bytesStr = "tzutung";
    string strLeeTzuTung  = unicode"李紫彤";
    string strIAmHome     = unicode"ただいま��";
    string writingTimeLag = unicode"時\t差\t書\t寫";

    function debugPrint() public view returns  (
        bytes memory, string memory, string memory,string memory
    ) {
        return (bytesStr, 
                strLeeTzuTung, 
                strIAmHome, 
                writingTimeLag);
    }
}
