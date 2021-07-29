// SPDX-License-Identifier: UNLICENSED
// lab16_structTest.sol

pragma solidity ^0.8.4;

contract TestContract {

    struct BidInfo {
        string buyerName;
        uint bidPrice;
    }

    BidInfo buyer1;
    BidInfo buyer2 = BidInfo("tzutung", 1000); // 可以再這裡初始化
    BidInfo buyer3;
    uint value;
    
    constructor() {
        buyer1 = BidInfo("tzutung", 1000);
        // buyer2 = BidInfo("tzutung", 1000); // 以也可以在這裡初始化
        buyer3 = BidInfo("andrew", 2000);
        value = 131;
    }
}
