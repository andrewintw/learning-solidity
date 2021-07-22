// SPDX-License-Identifier: UNLICENSED
// lab12_dynamicSizeArray.sol
pragma solidity ^0.8.4;

contract TestContract {
    uint constant MIN_BID_PRICE = 1000;
    uint[] public bidPrice;

    function getBidPriceLength() public view returns(uint) {
        return bidPrice.length;
    }

    function getBidPrice(uint _bid) public view returns(int) {
        return int(bidPrice[_bid]); // 取值的方法不變
    }

    function addBidPrice(uint _price) public {
        bidPrice.push(_price);
    }

    function editBidPrice(uint _bid, uint _price) public {
        bidPrice[_bid] = _price; // 修改的方法也不變
    }

    // // pragma solidity ^0.6.0; 以後 push(value) 將不再回傳 array length
    // function addBidPrice(uint _price) public returns(uint) {
    //     // uint array_length = bidPrice.push(_price);
    //     // return array_length;
    //     return bidPrice.push(_price); // 這一行可以取代上面兩行的寫法，省去一個 local variable 的宣告`
    //     /* return 值可以從交易 log 窗格中觀察 decoded output 欄位得知 */
    // }
}