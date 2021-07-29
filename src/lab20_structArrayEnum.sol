// SPDX-License-Identifier: UNLICENSED
// lab20_structArrayEnum.sol

pragma solidity ^0.8.4;

contract TestContract {

    enum Career { Artist, Musician, Engineer }

    struct BidInfo {
        string buyerName;
        uint bidPrice;
        Career career; // <= struct 新增第三個成員
    }

    BidInfo[] buyer;

    constructor() {
        addBuyerInfo("tzutung", 12345, Career.Artist); // <= parameter 新增第三個參數
        addBuyerInfo("milkW", 66666, Career.Musician);
    }

    // deploy 測試輸入: "milkW", 2000, 1
    function addBuyerInfo(string memory _name, uint _price, Career _career) public {
        buyer.push(BidInfo(_name, _price, _career));
    }

    function getBuyerInfo(uint _index) public view returns(string memory, uint, Career) { // <= returns 新增第三個參數
        return (buyer[_index].buyerName, 
                buyer[_index].bidPrice, 
                buyer[_index].career); // <= return 新增第三個參數
    }
    
    function isBuyerMusician(uint _index) public view returns(bool) {
        return (buyer[_index].career == Career.Musician);
    }
}
