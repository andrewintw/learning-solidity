// SPDX-License-Identifier: UNLICENSED
// lab09_fixedSizeArray.sol
pragma solidity ^0.8.4;

contract TestContract {
    uint[100] public bidPrice = [ 0 ]; // 用這個方法可以把 "所有成員" 初始值設定為 0
    uint public bidCount = 0;

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
        bidPrice[bidCount] = _price;
        bidCount++; // bidCount 的值每次 +1，等同於下面這兩種寫法。(這種寫法只能 +1)
        // bidCount = bidCount + 1;
        // bidCount += 1; // 常用，因為 += 後面不一定要是 1
    }
}