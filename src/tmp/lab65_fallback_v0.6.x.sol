// SPDX-License-Identifier: UNLICENSED
// lab65_fallback_v0.6.x.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {
    event fallbackTrigged(address, bytes, string);
    event receiveTrigged(address, uint256);

    fallback(bytes calldata _input) external returns(bytes memory) {
        emit fallbackTrigged(msg.sender, msg.data, string(_input));
        assert(keccak256(_input) == keccak256(msg.data));
        return bytes("tzutung.com"); // 0x747a7574756e672e636f6d
    }

    receive() external payable {
        emit receiveTrigged(msg.sender, msg.value);
    }
    
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
