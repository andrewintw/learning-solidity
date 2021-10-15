// SPDX-License-Identifier: UNLICENSED
// lab63_fallback_v0.6.x.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {
    event fallbackTrigged(address, bytes);
    event receiveTrigged(address, uint256);

    fallback() external { // works on solidity >=0.6.0
        emit fallbackTrigged(msg.sender, msg.data);
    }

    receive() external payable {
        emit receiveTrigged(msg.sender, msg.value); // "msg.data" cannot be used inside of "receive" function.
    }
    
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
