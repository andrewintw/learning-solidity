// SPDX-License-Identifier: UNLICENSED
// lab51_timeLimitContract.sol

pragma solidity ^0.8.7;

contract BuyMeACoffeeContract {
    uint constant MIN_AMOUNT = 50;
    uint public balance = 0;
    address owner; // The owner is who deployed the contract.

    uint256 openTime; // Ref: https://www.epochconverter.com/
    uint256 closeTime;

    constructor() {
        owner = msg.sender;
        openTime = block.timestamp + 10;
        closeTime = openTime + 20;
    }

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
    
    modifier chkTime() {
        require(block.timestamp >= openTime, "Info: Not yet open");
        require(block.timestamp < closeTime, "Info: closed already");
        _;
    }

    function donate(uint _amount) public chkTime chkMinAmount(_amount) returns (address, uint) {
        balance += _amount;
        return (msg.sender, _amount);
    }

    function withdraw(uint _amount) public onlyOwner chkBalance(_amount) returns (address, uint) {
        balance -= _amount;
        return (msg.sender, _amount);
    }
}
