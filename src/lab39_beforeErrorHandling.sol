// SPDX-License-Identifier: UNLICENSED
// lab39_beforeErrorHandling.sol

pragma solidity ^0.8.7;

contract TestContract {
    mapping(address => uint) public balance;
    
    function deposit(uint _amount) public returns (uint) {
        balance[msg.sender] += _amount;
        return balance[msg.sender];
    }
    
    function withdraw(uint _amount) public returns (uint) {
        balance[msg.sender] -= _amount;
        return balance[msg.sender];
    }
}
