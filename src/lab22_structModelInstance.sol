// SPDX-License-Identifier: UNLICENSED
// lab21_structModelInstance.sol

pragma solidity ^0.8.6; // <== 又更新囉 XD

contract TestContract {
    enum Career { Artist, Musician, Engineer, Director }

    struct BidInfo { // BidInfo is customized data type (int, bool, string...)
        string buyerName;
        uint bidPrice;
        Career career;
    }

    BidInfo[] buyer; /* 宣告 buyer 即將是個 array，
                        array 裡面只能放根據 BidInfo 這個 "model" 所規範的 instance.
                        所以任何 push 到 buyer[] 的東西都要是個 instance
                      */

    constructor() {
        // 一般常用寫法
        buyer.push(BidInfo("andrew", 11111, Career.Engineer));
        
        // 錯誤寫法
        // 因為 buyer 並不是一個 data-type，而是根據 data-type 宣告出來的變數
        // buyer.push(buyer("andrew", 11111, Career.Engineer));

        // 會成功，但多此一舉的寫法1        
        BidInfo memory newBuyer1 = BidInfo("milkW", 22222, Career.Musician);
        buyer.push(newBuyer1);


        // 會成功，但多此一舉的寫法2
        BidInfo memory newBuyer2;
        newBuyer2.buyerName = "tzutung";
        newBuyer2.bidPrice = 9999;
        newBuyer2.career = Career.Artist;
        buyer.push(newBuyer2);


        // 錯誤寫法
        // 因為 BidInfo 並不是一個 instance(物件)，只有 instance 才能用 . "dot" 來存取成員
        // BidInfo.buyerName = "tzutung";
        // BidInfo.bidPrice = 9999;
        // BidInfo.career = Career.Artist;
        // buyer.push(BidInfo);
    }

    function showAllBidInfo() public view returns(BidInfo memory, BidInfo memory, BidInfo memory) {
        return (buyer[0], buyer[1], buyer[2]);
    }

    // 測試時輸入 1, "tzutung", 6666, 3
    function changeBidInfo1(uint _index, string memory _name, uint _price, Career _career) public {
        buyer[_index].buyerName = _name;
        buyer[_index].bidPrice = _price;
        buyer[_index].career = _career;
    }

    // 測試時輸入 0, ["tzutung", 7777, 2]
    function changeBidInfo2(uint _index, BidInfo memory _buyer) public {
        buyer[_index] = _buyer;
    }
}
