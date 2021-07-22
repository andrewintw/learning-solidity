// SPDX-License-Identifier: UNLICENSED
// lab10_fixedSizeArray.sol
pragma solidity ^0.8.4;

contract TestContract {
    uint constant MIN_BID_PRICE = 1000;
    uint constant MAX_BID_NUM = 100;
    
    uint[MAX_BID_NUM] public bidPrice = [ 0 ]; // 把 "所有成員" 初始值設定為 0
    uint public bidCount = 0;

    constructor() {
        // bidCount = 98; // ONLY for Boundary Test
    }

    function getBidPriceLength() public view returns(uint) {
        return bidPrice.length;
    }

    function getBidPrice(uint _bid) public view returns(int) {
        if (_bid < bidPrice.length) {
            return int(bidPrice[_bid]); // 因為 returns 是 (int)，所以需要透過 int(原本的數值) 強制轉型
        } else {
            return -1; /* error handle: -1 是 returns(int) 允許的數值
                        * 這樣做的原因是呼叫端只要判斷　getBidPrice() 結果 <0 表示有問題發生
                        */
        }
    }

    function addBidPrice(uint _price) public {
        if ((_price >= MIN_BID_PRICE) && (bidCount < MAX_BID_NUM)) {
            bidPrice[bidCount] = _price;
            bidCount += 1;
        }
    }
}