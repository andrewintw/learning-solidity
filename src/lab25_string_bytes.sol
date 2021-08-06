// SPDX-License-Identifier: UNLICENSED
// lab25_string_bytes.sol

pragma solidity ^0.8.6;

contract TestContract {
    
    bytes bytesStr = "tzutung";
    string strLeeTzuTung  = unicode"æç´«å½¤";
    string strIAmHome     = unicode"ãŸã ã„ã¾í ½í¸ƒ";
    string writingTimeLag = unicode"æ™‚\tå·®\tæ›¸\tå¯«";

    function debugPrint() public view returns  (
        bytes memory, string memory, string memory,string memory
    ) {
        return (bytesStr, 
                strLeeTzuTung, 
                strIAmHome, 
                writingTimeLag);
    }
}
