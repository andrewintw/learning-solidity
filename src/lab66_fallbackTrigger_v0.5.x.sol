// SPDX-License-Identifier: UNLICENSED
// lab66_fallbackTrigger_v0.5.x.sol

pragma solidity >=0.5.0 <0.6.0;

contract TestContract {
    uint public num = 131;

    function () external {
        num++;
    }
    
    function test(uint _num) external {
        num = num * _num;
    }
}
