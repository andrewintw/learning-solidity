// SPDX-License-Identifier: UNLICENSED
// lab54_mutexDemo.sol

pragma solidity ^0.8.7;

contract BuyMeACoffeeContract {
    uint constant MIN_AMOUNT = 50;
    uint public balance      = 0;
    address owner;      // The owner is who deployed the contract.
    string public callLog = "";
    
    bool mutexLock = false;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Error: only for owner!");
        _;
    }

    modifier chkMinAmount(uint _donate) {
        require(_donate >= MIN_AMOUNT, ":( not enough to buy a coffee!");
        _;
    }

    modifier chkBalance(uint _inAmount) {
        require(_inAmount <= balance, "Error: balance is not enough");
        _;
    }

    modifier noReentrancy() {
        // require(mutexLock == false, "WARN: No Reentrancy!");
        require(!mutexLock, "WARN: No Reentrancy!");

        mutexLock = true;
        _;
        mutexLock = false;
    }

    function _appendLog(string memory _str) internal {
        callLog = string(abi.encodePacked(callLog, _str)); // a way to concatenate string
    }

    function donate(uint _amount) public chkMinAmount(_amount) returns (address, uint) {
        balance += _amount;
        return (msg.sender, _amount);
    }

    function withdraw(uint _amount) public noReentrancy onlyOwner chkBalance(_amount) returns (address, uint) {
        balance -= _amount;

        if (balance >= _amount) {
            withdraw(_amount);
        }

        _appendLog("* ");
        return (msg.sender, _amount);
    }
}
