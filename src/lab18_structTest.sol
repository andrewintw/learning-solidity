// SPDX-License-Identifier: UNLICENSED
// lab18_structTest.sol

pragma solidity ^0.8.4;

contract TestContract {

    struct BidInfo {
        string buyerName;
        uint bidPrice;
    }

    BidInfo buyer1; // 你可以將 state-variable public 出來`，以便於 debug
    BidInfo buyer2;
    BidInfo buyer3;
    
    constructor() {
        buyer1 = BidInfo("tzutung", 1000);
        buyer2.buyerName = "tzutung";   // same as buyer2 = BidInfo("tzutung", 1000);
        buyer2.bidPrice  = 1000;
        buyer3.buyerName = "andrew";    // same as buyer3 = BidInfo("andrew", 2000);
        buyer3.bidPrice  = 2000;
    }

    /* ---------- get 示範 ---------- */

    // 其實這個 function 不需要 public 出來。可以改為 private
    function getBuyerInfo(BidInfo memory _buyer) private pure returns(string memory, uint) {
        return (_buyer.buyerName, _buyer.bidPrice);
    }

    function getBuyer1InfoTest() public view returns(string memory, uint) {
        // return (buyer1.buyerName, buyer1.bidPrice);
        return getBuyerInfo(buyer1);
    }

    function getBuyer2InfoTest() public view returns(string memory, uint) {
        // return (buyer2.buyerName, buyer2.bidPrice);
        return getBuyerInfo(buyer2);
    }
    
    function getBuyer3InfoTest() public view returns(string memory, uint) {
        // return (buyer3.buyerName, buyer3.bidPrice);
        return getBuyerInfo(buyer3);
    }

    /* ---------- set 示範 ---------- */

    // set 方式1: 傳入每一個參數
    function setBuyer1Info(string memory _name, uint _price) public {
        buyer1.buyerName = _name;
        buyer1.bidPrice = _price;
    }

    // set 方式2: 傳入一個 instance (object)
    // 在 deploy 上測試時，使用 [ "tzutung", 12345 ] 的方式輸入測試 (包含中括號)
    function setBuyer2Info(BidInfo memory _buyer) public {
        buyer2.buyerName = _buyer.buyerName;
        buyer2.bidPrice = _buyer.bidPrice;
    }
    
    // 這個示範其實跟方法 2 完全一樣，差別在於透過程式做，還是 UI 介面輸入
    function copyBuyer3InfoToBuyer2() public {
        setBuyer2Info(buyer3);
    }
}
