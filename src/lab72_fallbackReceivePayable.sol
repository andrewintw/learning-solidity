// SPDX-License-Identifier: UNLICENSED
// lab72_fallbackReceivePayable.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {
    event receiveFallback(address, uint256);
    event receivePayable(address, uint256);

    receive() external payable {
        emit receiveFallback(msg.sender, msg.value);
    }

    function receive() external payable {
        emit receiveFallback(msg.sender, msg.value);
    }
    
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
