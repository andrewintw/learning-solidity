// SPDX-License-Identifier: UNLICENSED
// lab17_structTest.sol

pragma solidity ^0.8.4;

contract TestContract {

    struct BidInfo {
        string buyerName;
        uint bidPrice;
    }

    BidInfo buyer1;
    BidInfo buyer2;
    BidInfo buyer3;
    
    constructor() {
        // buyer1 = BidInfo("tzutung", 1000);
        buyer1.buyerName = "tzutung";
        buyer1.bidPrice  = 1000;

        // buyer2 = BidInfo("tzutung", 1000);
        buyer2.buyerName = "tzutung";
        buyer2.bidPrice  = 1000;

        // buyer3 = BidInfo("andrew", 2000);        
        buyer3.buyerName = "andrew";
        buyer3.bidPrice  = 2000;
    }
}
