// SPDX-License-Identifier: UNLICENSED
// lab34_Mapping.sol

pragma solidity ^0.8.7;

contract MappingTestContract {

    // struct Buyer {
    //     address account;
    //     uint price;
    // }
    // Buyer[] public buyer;

    mapping(address => uint) public buyer;
    

    // function getBidCount() public view returns (uint) {
    //     return buyer.length; // 無法使用於 mapping
    // }
    
    // C.R.U.D
    
    // C: Create
    function addBid(uint _price) public {
        buyer[msg.sender] = _price;
    }
    
    // R: Read
    function getMyBid() public view returns (uint) {
        return buyer[msg.sender];
    }
    
    // U: Update
    function modMyBid(uint _price) public {
        buyer[msg.sender] = _price; // 跟 add 時完全一樣
    }
    
    // D: Delete
    function delMyBid() public {
        delete buyer[msg.sender];
    }

    //  use to remove an element from the end of the array
    // function popTest() public {
    //     buyer.pop(); // mapping 並沒有這種操作
    // }
}
