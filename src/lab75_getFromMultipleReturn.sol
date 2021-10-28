// SPDX-License-Identifier: UNLICENSED
// lab75_getFromMultipleReturn.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {
    function multipleReturns() internal pure returns(uint a, uint b, uint c) {
        return (1, 2, 3);
    }

    function processMultipleReturns() pure external returns (uint, uint, uint) {
        uint a;
        uint b;
        uint c;
        // This is how you do multiple assignment:
        (a, b, c) = multipleReturns();
        return (a, b, c);
    }

    // Or if we only cared about one of the values:
    function getLastReturnValue() pure external returns (uint) {
        uint c;
        // We can just leave the other fields blank:
        (,,c) = multipleReturns();
        return c;
    }
}
