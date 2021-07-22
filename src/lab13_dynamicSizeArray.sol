// SPDX-License-Identifier: UNLICENSED
// lab13_dynamicSizeArray.sol
pragma solidity ^0.8.4;

contract TinyverseBidContract {
    uint constant MIN_BID_PRICE = 1000;
    uint[] bidPrice; // 只有透過 getBidPrice() 還來存取才能做到防禦，因為 function 裡面可以寫規則。

    // uint bidCount = 0;   // 這個變數不再需要了，因為在這個例子中它 = bidPrice.length
                            // 而 bidPrice.length 會在每次 push(value) 之後自動更新

    function getBidPriceLength() public view returns(uint) {
        return bidPrice.length;
    }

    function getBidPrice(uint _bid) public view returns(int) {
        if (_bid < bidPrice.length) {
            return int(bidPrice[_bid]);
        } else {
            return -1;
        }
    }

    function addBidPrice(uint _price) public {
        if (_price > MIN_BID_PRICE) {
            bidPrice.push(_price);
        }
    }

    function editBidPrice(uint _bid, uint _price) public {
        if ((_bid < bidPrice.length) && (_price >= MIN_BID_PRICE)) {
            bidPrice[_bid] = _price;
        }
    }
}