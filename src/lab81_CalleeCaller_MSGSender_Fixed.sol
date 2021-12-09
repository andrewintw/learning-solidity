// SPDX-License-Identifier: Tinyverse (tinyverse.art)
// lab81_CalleeCaller_MSGSender_Fixed.sol

pragma solidity >=0.7.0 <0.9.0;

contract BuyMeACoffee {
    mapping(address => uint) donation;

    // 多個參數 _sponsor 用來記錄 Caller 帶進來的 address
    function recvEthr(address _sponsor) external payable {
        // donation[msg.sender] += msg.value; // <= 有 Bug 的寫法, msg.sender 是 Caller address
        donation[_sponsor] += msg.value;      // <= Fixed: 解決辦法，使用參數帶進來的 address 而非 msg.sender
    }
    
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
    
    function getDonateInfo(address _account) external view returns (uint) {
        return donation[_account];
    }
}


contract Caller {
    function callRecvEthr(BuyMeACoffee _buycafe) external payable {
        // _buycafe.recvEthr{value: msg.value}();           // 有 Bug 的寫法
        _buycafe.recvEthr{value: msg.value}(msg.sender);    // Fixed: 多個參數，將 msg.sender 一併傳遞過去
    }
    
    function callGetBalance(address _addr) external view returns (uint) {
        BuyMeACoffee _buycafe = BuyMeACoffee(_addr);
        return _buycafe.getBalance();
    }

    function callGetDonateInfo(BuyMeACoffee _buycafe, address _sponsor) external view returns (uint) {
        return _buycafe.getDonateInfo(_sponsor);
    }
}
