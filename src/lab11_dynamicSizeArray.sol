// SPDX-License-Identifier: UNLICENSED
// lab11_dynamicSizeArray.sol
pragma solidity ^0.8.4;

contract TestContract {
    uint constant MIN_BID_PRICE = 1000;
    uint[] public bidPrice;

    constructor() {
        bidPrice.push(130);  // 增加(第一個)成員的方法，使用 push
        bidPrice.push(1220);
        bidPrice.push(37);
    }

    function getBidPriceLength() public view returns(uint) {
        return bidPrice.length;
    }

    function getBidPrice(uint _bid) public view returns(int) {
        return int(bidPrice[_bid]); // 取值的方法不變
    }

    function addBidPrice(uint _price) private {
        // 暫時先用 constructor() 測試，所以定義 private
    }
}