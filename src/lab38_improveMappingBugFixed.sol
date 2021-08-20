// SPDX-License-Identifier: UNLICENSED
// lab38_improveMappingBugFixed.sol

pragma solidity ^0.8.7;

contract MappingTestContract {

    struct Buyer {
        uint price;
        bool isBid;
    }
    
    uint public bidCount = 0;

    mapping(address => Buyer) public buyer;
    
    // C.R.U.D
    
    // C: Create + U: Update
    function updateMyBid(uint _price) public returns(uint) {
        if (buyer[msg.sender].isBid) {  // <== Update
            buyer[msg.sender].price = _price;
        } else {                        // <== Create
            buyer[msg.sender].price = _price;
            buyer[msg.sender].isBid = true;
            bidCount++; // 只有新增時才需要更新
        }
        return bidCount;
    }
    
    // R: Read
    function getMyBid() public view returns (int) {
        if (buyer[msg.sender].isBid) {
            return int(buyer[msg.sender].price);
        } else {
            return -1;
        }
    }

    // D: Delete
    function delMyBid() public returns (uint, bool) {
        delete buyer[msg.sender];
        bidCount--;
        return (buyer[msg.sender].price, buyer[msg.sender].isBid);
    }
}
