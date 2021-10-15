// SPDX-License-Identifier: UNLICENSED
// lab61_fallback_v0.5.x.sol

pragma solidity >=0.5.0 <0.6.0;

contract TestContract {
    event fallbackTrigged(address, bytes);
    event payableFallbackTrigged(address, bytes, uint256);

    // function() external { // works on solidity >=0.5.0 <0.6.0;
    //     emit fallbackTrigged(msg.sender, msg.data);
    // }

    function() external payable { // works on solidity >=0.5.0 <0.6.0;
        emit payableFallbackTrigged(msg.sender, msg.data, msg.value);
    }

    // function(bytes _data) external { // Error: Fallback function cannot have arguments.
    // }

    // function() external returns(bool) { // Error: Fallback function cannot return values.
    //     return true;
    // }

    // function() public { // Error: Fallback function must be defined as "external" visibility.
    // }
    
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
