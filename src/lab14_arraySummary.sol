// SPDX-License-Identifier: UNLICENSED
// lab14_arraySummary.sol

pragma solidity ^0.8.4;

contract TestContract {
    uint constant MAX_BID_COUNT = 200;

    uint bidCount = 0;
    uint[MAX_BID_COUNT] bidPriceStatic;
    uint[] bidPriceDynamic;

    constructor() {
        // bidPriceStatic[0] = 1111;   // static: add members
        // bidPriceStatic[1] = 3333;
        // bidPriceStatic[2] = 5555;
        /* 注意：如果你加了 bidPriceStatic 測試值，應該要設定 bidCount 初始值 = 3，否則後面的 addBidPrice() 程式會錯 */
        
        // bidPriceDynamic.push(2222); // dynamic: add members
        // bidPriceDynamic.push(4444);
        // bidPriceDynamic.push(6666);
    }

    function addBidPrice(uint _price) public returns(uint, uint) {
        bidPriceStatic[bidCount] = _price;
        bidCount++;
        
        bidPriceDynamic.push(_price);
        //return (bidPriceStatic.length, bidPriceDynamic.length);   // 小心 bidPriceStatic.length 是固定的！
        return (bidCount, bidPriceDynamic.length);                  // 所以我們才需要 bidCount，這樣才對。
    }

    function getBidPrices(uint _index) public view returns(uint, uint) {
        uint tmp_static = bidPriceStatic[_index];   // static: get members
        uint tmp_dynamic = bidPriceDynamic[_index]; // dynamic: get members
        return (tmp_static, tmp_dynamic);
    }

    function editBidPrices(uint _index, uint _price) public {
        bidPriceStatic[_index] = _price;  // 一旦資料產生，兩者使用相同的方法修改
        bidPriceDynamic[_index] = _price;
    }
}
