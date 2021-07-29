// SPDX-License-Identifier: UNLICENSED
// lab15_beforeStruct.sol

pragma solidity ^0.8.4;

contract TestContract {
    string[] buyerName;
    uint[] bidPrice;
    
    constructor() {
        makeBid("tzutung", 1000);
        makeBid("renyu", 2000);
        makeBid("ding", 3000);
    }

    function addBuyerName(string memory _buyer) private {
        buyerName.push(_buyer);
    }

    function addBidPrice(uint _price) private {
        bidPrice.push(_price);
    }

    function makeBid(string memory _buyer, uint _price) public returns(uint) {
        addBuyerName(_buyer);
        addBidPrice(_price);
        return bidPrice.length;
    }
    
    function getBidInfo(uint _index) public view returns(string memory, uint) {
        return (buyerName[_index], bidPrice[_index]);
    }
}
