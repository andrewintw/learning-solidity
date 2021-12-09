// SPDX-License-Identifier: Tinyverse (tinyverse.art)
// lab82_CalleeCaller_WeakBank.sol

pragma solidity >=0.7.0 <0.9.0;

contract WeakBank {

    function recvEthr() external payable {
    }
    
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
    
    function withdraw(address _account, uint _amount) external payable {
        payable(_account).transfer(_amount);
    }
}

/* Q: 就你目前所學的知識，這個程式碼哪裡不夠完整（安全）
   A: * withdraw() 沒有檢查餘額是否足夠提取
      * withdraw() 沒有限制誰可以提取
 */
