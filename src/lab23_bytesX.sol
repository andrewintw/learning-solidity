// SPDX-License-Identifier: UNLICENSED
// lab23_bytesX.sol

pragma solidity ^0.8.6;

contract TestContract {
    
    // ***** bytesX *****
    bytes1 char_a = "a";
    bytes1 char_b = 'b';
    bytes1 char_c = 'c';
    // bytes1 char_de = "de"; // error, Literal is larger than the type 


    // ***** ASCII *****
    // ASCII: http://kevin.hwai.edu.tw/~kevin/material/CLanguage/ascii-full.gif
    bytes1 char_A = 'A'; // "A" 也可以。但其他程式語言的習慣是在單一字元時使用單引號
    bytes1 hex_A = 0x41;
    bytes1 char_space = ' ';


    // ***** size *****
    bytes2 char_de = "de";
    bytes3 char_fgh = "fgh";

    bytes32 char32test = "12345678901234567890123456789012";

    bytes32 char9test = "tinyverse";
    bytes16 char7test  = "tzutung";


    function debugPrint() public view returns (bytes1, bytes1, bytes1, bytes1) {
        return (char_a, char_b, char_c, char_space);
    }

    function compareTest() public view returns (bool) {
        return (char_A == hex_A);
    }

    function showLengths() public view returns (uint, uint, uint) {
        return (char32test.length, 
                char9test.length, 
                char7test.length);
    }

    function getChar(uint _index) public view returns (bytes1) {
        return (char7test[_index]);
    }
}
