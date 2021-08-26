// SPDX-License-Identifier: UNLICENSED
// lab48_modifierTest.sol

pragma solidity ^0.8.7;

contract BuyMeACoffeeContract {
    uint constant MIN_AMOUNT = 50;
    uint public balance;
    address owner; // The owner is who deployed the contract.

    modifier onlyOwner() {
        require(owner == msg.sender, "Don't steal my coffee!");
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

    constructor(uint _amount) {
        owner = msg.sender;
        balance = _amount;
    }

    function donate(uint _amount) public chkMinAmount(_amount) returns (address, uint) {
        balance += _amount;
        return (msg.sender, _amount);
    }

    function withdraw(uint _amount) public onlyOwner chkBalance(_amount) returns (address, uint) {
        balance -= _amount;
        return (msg.sender, _amount);
    }
    
    function checkOwner() public view onlyOwner {
    }
}
