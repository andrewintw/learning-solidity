// SPDX-License-Identifier: UNLICENSED
// lab56_payable_recvEther_constructor.sol

pragma solidity >=0.8.0 <0.9.0;

contract PayableTestContract {

    constructor () payable {
    }

    function deposit() external payable {
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
