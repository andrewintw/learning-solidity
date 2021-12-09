// SPDX-License-Identifier: Tinyverse (tinyverse.art)
// lab80_CalleeCaller_MSGSender_Bug.sol

pragma solidity >=0.7.0 <0.9.0;

contract BuyMeACoffee {
    mapping(address => uint) donation;

    function recvEthr() external payable {
        // 為了記錄 "是誰"、轉入了 "多少錢"，所以需要維護 donation[] 這個關聯式陣列 (Associative Array)
        donation[msg.sender] += msg.value; // <= BUG: 這裡有問題
    }
    
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
    
    // 提供查詢功能: 輸入 account address，從 donation[] 中得到該 account 累積贊助金額
    function getDonateInfo(address _account) external view returns (uint) {
        return donation[_account];
    }
}


contract Caller {
    function callRecvEthr(BuyMeACoffee _buycafe) external payable {
        _buycafe.recvEthr{value: msg.value}();
        /* 這件事情發生時，對 BuyMeACoffee 合約來說，msg.sender 是誰?
           對 Caller 合約來說，msg.sender 又是誰?
           這兩個合約所取得的 msg.sender 是同一個 address 嗎?
        */
    }
    
    function callGetBalance(address _addr) external view returns (uint) {
        BuyMeACoffee _buycafe = BuyMeACoffee(_addr);
        return _buycafe.getBalance();
    }

    function callGetDonateInfo(BuyMeACoffee _buycafe, address _sponsor) external view returns (uint) {
        return _buycafe.getDonateInfo(_sponsor);
        // Tip: 試試看在測試時將 _sponsor 輸入 Caller 的部署 address
    }
}
