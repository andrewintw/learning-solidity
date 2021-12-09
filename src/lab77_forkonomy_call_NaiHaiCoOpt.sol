// SPDX-License-Identifier: UNLICENSED
// lab77_forkonomy_call_NaiHaiCoOpt.sol

pragma solidity >=0.8.0 <0.9.0;

/* 這個 Contract 在這個練習中不會被真的部署，
   只是為了讓 compile 在 line 25,26 可以過
   => 讓 ForkonomyTest 知道合約有什麼 "介面" 可以用 */
contract NaiHai {
    function oceanTransInfo(uint _oceanId) external view 
        returns (uint _oceanid, address _owner, uint _volume, uint _price, uint _time) {}
    // {} 裡面不需要有程式碼，因為我們只關心介面的名稱、輸入、輸出。
}

contract ForkonomyTest {
    address naihai_addr;

    // try: 0xEA49Ce4977B9c8f181f67cf1436f019e98E40DB1
    function setExtContractAddr(address _addr) external {
        naihai_addr = _addr;
    }
    
    function getOceanTransInfo(uint _id) external view 
        returns (uint _oceanid, address _owner, uint _volume, uint _price, uint _time) {
        NaiHai nh = NaiHai(naihai_addr);
        (_oceanid, _owner, _volume, _price, _time) = nh.oceanTransInfo(_id);
        /* 事實上 nh.oceanTransInfo() 不是呼叫這份 .sol 文件中 NaiHai 合約的 oceanTransInfo()
           而是呼叫 naihai_addr 所在合約的 oceanTransInfo()
           而 naihai_addr 合約已經被佈署在鏈上了
        */
    }
}
