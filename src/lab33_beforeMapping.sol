// SPDX-License-Identifier: UNLICENSED
// lab33_beforeMapping.sol

pragma solidity ^0.8.7;

contract BeforeMappingContract {

    struct Buyer {
        address account;
        uint price;
    }
    
    Buyer[] public buyer;
    
    function getBidCount() public view returns (uint) {
        return buyer.length;
    }
    
    // C.R.U.D
    
    // C: Create
    function addBid(uint _price) public returns (uint) {
        buyer.push(Buyer(msg.sender, _price));
        return buyer.length;
    }
    
    // R: Read
    function getMyBid() public view returns (int) {
        int _price = -1;
        
        for (uint i = 0; i < buyer.length; i++) {
            if (msg.sender == buyer[i].account) {
                _price = int(buyer[i].price);
            }
        }
        return _price;
    }
    
    // U: Update
    function modMyBid(uint _price) public {
        for (uint i = 0; i < buyer.length; i++) {
            if (msg.sender == buyer[i].account) {
                buyer[i].price = _price;
            }
        }
    }
    
    // D: Delete
    function delMyBid() public {
        for (uint i = 0; i < buyer.length; i++) {
            if (msg.sender == buyer[i].account) {
                delete buyer[i];
            }
        }
    }

    //  use to remove an element from the end of the array
    function popTest() public {
        buyer.pop();
    }
}
