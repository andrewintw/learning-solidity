// SPDX-License-Identifier: UNLICENSED
// lab24_string_bytes.sol

pragma solidity ^0.8.6;

contract TestContract {
    
    bytes16 char7fixed   = "tzutung";
    bytes   char7dynamic = "tzutung";
    string  char7string  = "tzutung";


    function debugPrint() public view returns (bytes16, bytes memory, string memory) {
        return (char7fixed, char7dynamic, char7string);
    }

    function showLengths() public view returns (uint, uint) {
        return (char7fixed.length, 
                char7dynamic.length);
                
                // Error: char7string.length <= string 無法用這種方式取得 length
    }

    function getChar(uint _index) public view returns (bytes1, bytes1) {
        return (char7fixed[_index],
                char7dynamic[_index]);

                // Errlr: char7string[_index] <= Index access for string is not possible
                // string 也不能用 index 取值
    }


    /* string 要能夠 indexing, 需要強制轉型為 bytes -- 使用 bytes()
       強制轉型後，也可以使用 .length 回傳 string 長度了
     */
    function getIndexOfString(uint _index) public view returns (uint, bytes1) {
        bytes memory tmp = bytes(char7string);
        return (tmp.length, tmp[_index]);
    }
}
