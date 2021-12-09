// SPDX-License-Identifier: UNLICENSED
// lab78_Callee_and_Caller.sol

pragma solidity >=0.7.0 <0.9.0;

contract Callee {
    uint public num;
    
    function setNum(uint _num) external {
        num = _num;
    }
    
    // 可以收錢錢的 function
    function revCoin(uint _num) external payable {
        num = _num;
    }
    
    // 查詢目前合約有多少錢錢
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

contract Caller {
    // 第一種寫法: 先傳入 address
    function setCalleeNum(address _addr, uint _num) external {
        Callee cee = Callee(_addr); // 然後再用這種方式指定 address 給物件
        cee.setNum(_num);
    }

    // 第二種寫法: 直接宣告符合合約類別 (Callee) 的變數
    function setCalleeNum2(Callee _callee, uint _num) external {
        _callee.setNum(_num);
    }
    
    function rechargeCallee(Callee _callee, uint _num) external payable {
        // 這種寫法不會把錢轉過去，但是 _num 還是會傳過去。錢會留在 Caller 這個合約中 @_@ 要小心!!
        // _callee.revCoin(_num);

        // >=0.5.0 <0.7.0
        // _callee.revCoin.value(msg.value)(_num);

        // >=0.7.0 <0.9.0
        // Ref: https://docs.soliditylang.org/en/v0.7.2/using-the-compiler.html?highlight=%7Bvalue%3A%20...%7D#available-upgrade-modules
        _callee.revCoin{value: msg.value}(_num);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
