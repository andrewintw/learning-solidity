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

// 故意寫個與 Callee ABI 一樣的 FakeCallee。內含同名的 setNum()，差別在 setNum() 內將 _num x2 回傳
contract FakeCallee {
    uint public value;
    
    function setNum(uint _val) external returns (uint) {
        value = _val * 2;
        return value;
    }
}


contract Caller {
    // 這個練習的重點在於: 了解指向不同的合約 address，可能會呼叫到不同的 setNum()
    function setCalleeNum(address _addr, uint _num) external returns (uint) {
        Callee cee = Callee(_addr);
        return cee.setNum(_num);
    }
}
