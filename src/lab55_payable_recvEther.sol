// SPDX-License-Identifier: UNLICENSED
// lab55_payable_recvEther.sol

pragma solidity >=0.8.0 <0.9.0;

contract PayableTestContract {

    function deposit() external payable {
    }
    
    function nonPayable() external {
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
