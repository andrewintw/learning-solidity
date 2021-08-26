// SPDX-License-Identifier: UNLICENSED
// lab47_modifierTest.sol

pragma solidity ^0.8.7;

contract BuyMeACoffeeContract {
    uint constant MIN_AMOUNT = 50;
    uint public balance;
    address owner; // The owner is who deployed the contract.

    modifier onlyOwner() {
        require(owner == msg.sender, "Don't steal my coffee!");
        _;
    }

    constructor(uint _amount) {
        owner = msg.sender;
        balance = _amount;
    }

    function donate(uint _amount) public returns (address, uint) {
        require(_amount >= MIN_AMOUNT, ":( not enough to buy a coffee!");
        balance += _amount;
        return (msg.sender, _amount);
    }

    function withdraw(uint _amount) public onlyOwner returns (address, uint) {
        require(_amount <= balance, "Error: balance is not enough");
        balance -= _amount;
        return (msg.sender, _amount);
    }
    
    function checkOwner() public view onlyOwner {
    }
}
