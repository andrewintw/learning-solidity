// SPDX-License-Identifier: UNLICENSED
// lab19_structArray.sol

pragma solidity ^0.8.4;

contract TestContract {

    struct BidInfo {
        string buyerName;
        uint bidPrice;
    }

    BidInfo[] buyer;

    constructor() {
        addBuyerInfo("tzutung", 12345); // 非必要，故意在初始化的當下就新增一筆
    }

    function addBuyerInfo(string memory _name, uint _price) public {
        buyer.push(BidInfo(_name, _price));
    }

    function getBuyerInfo(uint _index) public view returns(string memory, uint) {
        return (buyer[_index].buyerName, buyer[_index].bidPrice);
    }
}
