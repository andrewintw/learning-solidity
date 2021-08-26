// SPDX-License-Identifier: UNLICENSED
// lab49_modifierChainTest.sol

pragma solidity ^0.8.7;

contract TestContract {
    string public callLog = "";

    function _appendLog(string memory _str) internal {
        callLog = string(abi.encodePacked(callLog, _str)); // a way to concatenate string
    }

    modifier modFuncA() {
        _appendLog("modFuncA1>");
        _;
        _appendLog("modFuncA2>");
    }

    modifier modFuncB() {
        _appendLog("modFuncB1>");
        _;
        _appendLog("modFuncB2>");
    }

    modifier modFuncC() {
        _appendLog("modFuncC1>");
        _;
        _appendLog("modFuncC2>");
    }

    function doTest() public modFuncA modFuncB modFuncC {
        _appendLog("doTest>");
    }
}
