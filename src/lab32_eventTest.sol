// SPDX-License-Identifier: UNLICENSED
// lab32_eventTest.sol

pragma solidity ^0.8.7;

contract EventTest {

    event NewBidInfo(uint _timestamp, address _sender, string _name, uint _price, uint _bidCount);

    struct BidInfo {
        string buyerName;
        uint bidPrice;
    }

    BidInfo[] buyer;

    function addBuyerInfo(string memory _name, uint _price) public returns (uint) {
        buyer.push(BidInfo(_name, _price));

        return buyer.length;
    }


    function addBuyerInfo(string memory _name, uint _price, bool _isEmit) public returns (uint) {
        buyer.push(BidInfo(_name, _price));

        if (_isEmit) {
            emit NewBidInfo(block.timestamp, msg.sender, _name, _price, buyer.length);
        }
        return buyer.length;
    }

/* logs example:

    [
    	{
    		"from": "0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B",
    		"topic": "0x3fb6dd3d1038e9c05babdbf0cf69dc2d26ae090a47801c4fa416fb4057dd58a2",
    		"event": "NewBidInfo",
    		"args": {
    			"0": "1628756990",
    			"1": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
    			"2": "tzutung",
    			"3": "666666",
    			"4": "5",
    			"_timestamp": "1628756990",
    			"_sender": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
    			"_name": "tzutung",
    			"_price": "666666",
    			"_bidCount": "5"
    		}
    	}
    ]
*/
}
