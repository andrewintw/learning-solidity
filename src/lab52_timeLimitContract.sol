// SPDX-License-Identifier: UNLICENSED
// lab52_timeLimitContract.sol

pragma solidity ^0.8.7;

contract BuyMeACoffeeContract {
    uint constant ONE_DAY    = 86400;
    uint constant ONE_WEEK   = 604800; // ONE_DAY x 7
    uint constant MIN_AMOUNT = 50;
    uint public balance      = 0;
    address owner;      // The owner is who deployed the contract.
    uint256 closeTime;  // Ref: https://www.epochconverter.com/

    constructor() {
        owner = msg.sender;
        closeTime = block.timestamp; // 為了 deploy 後立即失效
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
    
    modifier chkTime() {
        require(block.timestamp < closeTime, "Info: closed already");
        _;
    }

    // 從資料的角度看，需要做判斷，計算 _epochTime。不太好用
    function setCloseTime(uint256 _epochTime) external onlyOwner {
        if (_epochTime > closeTime) {
            closeTime = _epochTime;
        }
    }

    // 像是快速設定按鍵的概念
    function activateOneDay() external onlyOwner {
        // closeTime = block.timestamp + (24 * 60 * 60); // 雖然可讀性好，，但耗費運算資源
        // closeTime = block.timestamp + 86400; // 24 x 60 x 60
        closeTime = block.timestamp + ONE_DAY; // 可讀性好又省去運算時間
    }
    
    // 比較有彈性，甚至可以立即停用 donate，_secs=0
    function activateFor(uint _secs) external onlyOwner {
        closeTime = block.timestamp + _secs;
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
