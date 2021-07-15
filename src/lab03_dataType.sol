// SPDX-License-Identifier: UNLICENSED

// lab03_myContract.sol
pragma solidity ^0.8.4;

contract MyContract {
    string public constant MY_STR = "TzuTung";
    bool public constant MY_BOOL = true;
    int public constant MY_PLUS_INT = 57896044618658097711785492504343953926634992332820282019728792003956564819967;  // int256
    int public constant MY_MINUS_INT = -57896044618658097711785492504343953926634992332820282019728792003956564819968;// int256
    uint public constant MY_UINT = 115792089237316195423570985008687907853269984665640564039457584007913129639935;   // uint256
    
    int8 constant MY_INT8 = 0;       // -128 ~ 127
    uint8 constant MY_UINT8 = 255;   // 0~255
}