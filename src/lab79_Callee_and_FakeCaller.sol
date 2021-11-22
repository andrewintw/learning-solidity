// SPDX-License-Identifier: UNLICENSED
// lab79_Callee_and_FakeCaller.sol

pragma solidity >=0.7.0 <0.9.0;

contract Callee {
    uint public num;
    
    function setNum(uint _num) external returns (uint) {
        num = _num;
        return num;
    }
}

// 結構與 Callee 一樣，只差在 setNum 時將 _num x2
contract FakeCallee {
    uint public value;
    
    function setNum(uint _val) external returns (uint) {
        value = _val * 2;
        return value;
    }
}


contract Caller {
    function setCalleeNum(address _addr, uint _num) external returns (uint) {
        Callee cee = Callee(_addr);
        return cee.setNum(_num);
    }
}
