// SPDX-License-Identifier: UNLICENSED
// lab46_atomicTest.sol

pragma solidity ^0.8.7;

contract BuyMeACoffeeContract {
    uint constant MIN_AMOUNT = 50;
    uint public balance;
    address owner; // The owner is who deployed the contract.

    constructor(uint _amount) {
        owner = msg.sender;
        balance = _amount;
    }

    function donate(uint _amount) public returns (address, uint) {
        require(_amount >= MIN_AMOUNT, ":( not enough to buy a coffee!");
        balance += _amount;
        return (msg.sender, _amount);
    }

    function withdraw(uint _amount) public returns (address, uint) {
        balance -= _amount; // 實際上它還是會先做，但是如果讓 uint <0 會丟出系統的 exception!
        
        // require(owner == msg.sender, "Don't steal my coffee!");
        // require(_amount <= balance, "Error: balance is not enough");
        // require((_amount <= balance && owner == msg.sender), "Error> withdrawals are not permitted!");
        
        if ((owner != msg.sender) || (_amount > balance)) { // 故意示範適合 revert 的狀況
            revert("Error: withdrawals are not permitted!");
        }

        assert(owner == msg.sender);
        return (msg.sender, _amount);
    }
}
