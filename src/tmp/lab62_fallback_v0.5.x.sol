// SPDX-License-Identifier: UNLICENSED
// lab62_fallback_v0.5.x.sol

pragma solidity >=0.5.0 <0.6.0;

contract TestContract {
    event payableFallbackTrigged(address, bytes, uint256);

    modifier receiveOnly() {
        require(msg.data.length == 0, "Error: receive ether only!");
        _;
    }

    function() external payable receiveOnly { // works on solidity >=0.5.0 <0.6.0;
        emit payableFallbackTrigged(msg.sender, msg.data, msg.value);
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
