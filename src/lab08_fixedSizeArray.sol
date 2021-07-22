// SPDX-License-Identifier: UNLICENSED
// lab08_fixedSizeArray.sol
pragma solidity ^0.8.4;

contract TestContract {
    uint[100] public bidPrice = [ 0 ]; // 用這個方法可以把 "所有成員" 初始值設定為 0

    constructor() {
        bidPrice[66] = 666666; // 看起來很怪，但只是想示範你可以針對某一個值做初始化
    }

    // 寫個 function 來取值
    function getBidPriceLength() public view returns(uint) {
        return bidPrice.length;
    }

    // 輸入 index 取得出價
    function getBidPrice(uint _bid) public view returns(int) {
        if (_bid < bidPrice.length) {
            return int(bidPrice[_bid]); // 因為 returns 是 (int)，所以需要透過 int(原本的數值) 強制轉型
        } else {
            return -1; /* error handle: -1 是 returns(int) 允許的數值
                        * 這樣做的原因是呼叫端只要判斷　getBidPrice() 結果 <0 表示有問題發生
                        */
        }
    }

    // 輸入 index, 和出價，加入　bidPrice［］中
    function addBidPrice(uint _bid, uint _price) public {
        if (_bid < bidPrice.length) {
            bidPrice[_bid] = _price;
        }
    }
}