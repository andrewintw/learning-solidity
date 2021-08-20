// SPDX-License-Identifier: UNLICENSED
// lab36_improveMapping.sol

pragma solidity ^0.8.7;

contract MappingTestContract {

    struct Buyer {
        uint price;
        bool isBid;
    }

    mapping(address => Buyer) public buyer;
    
    // C.R.U.D
    
    // C: Create
    function addBid(uint _price) public {
        buyer[msg.sender].price = _price;
        buyer[msg.sender].isBid = true;
    }
    
    // R: Read
    function getMyBid() public view returns (int) {
        if (buyer[msg.sender].isBid) {
            return int(buyer[msg.sender].price);
        } else {
            return -1;
        }
    }

    // U: Update
    function modMyBid(uint _price) public {
        if (buyer[msg.sender].isBid) {
            buyer[msg.sender].price = _price;
        }
    }
    
    // D: Delete
    function delMyBid() public returns (uint, bool) {
        delete buyer[msg.sender];
        return (buyer[msg.sender].price, buyer[msg.sender].isBid);
    }
}
