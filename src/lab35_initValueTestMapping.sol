// SPDX-License-Identifier: UNLICENSED
// lab35_initValueTestMapping.sol

pragma solidity ^0.8.7;

contract MappingTestContract {

    struct Buyer {
        address addr;
        string name;
        bytes nickname;
        uint price;
        bool isBided;
    }

    mapping(address => Buyer) public buyer;
}
