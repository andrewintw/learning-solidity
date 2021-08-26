// SPDX-License-Identifier: UNLICENSED
// lab40_errorHandling.sol

pragma solidity ^0.8.7;

contract TestContract {
    event withdrawEvent(address _account, uint _amount, string _result);
    
    mapping(address => uint) public balance;
    
    function deposit(uint _amount) public returns (uint) {
        balance[msg.sender] += _amount;
        return balance[msg.sender];
    }
    
    function withdraw(uint _amount) public returns (int) {
        if (_amount <= balance[msg.sender]) {
            balance[msg.sender] -= _amount;
            return int(balance[msg.sender]);
        } else {
            emit withdrawEvent(msg.sender, _amount, "balance is not enough");
            return -1;
        }
    }
}
