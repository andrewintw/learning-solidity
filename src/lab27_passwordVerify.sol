// SPDX-License-Identifier: UNLICENSED
// lab27_passwordVerify.sol

pragma solidity ^0.8.6;

contract TestContract {
    bytes32 constant myPasswd = 0x719accc61a9cc126830e5906f9d672d06eab6f8597287095a2c55a8b775e7016;


    function verifyPasswd(string memory _passwd) public pure returns (bool) {
        return (keccak256(bytes(_passwd)) == myPasswd);
    }


    /* 產生密碼用：將結果指定給 myPasswd 後就可以變成 private 或是移除
       keccak256 只接受 bytes 的輸入，但是 deploy UI 只能輸入 string
       因此先用 bytes() 將 string 轉型為 bytes 再傳入 keccak256()
     */
    function genPasswd(string memory _passwd) private pure returns (bytes32) {
        return keccak256(bytes(_passwd));
        // "abc123" => 0x719accc61a9cc126830e5906f9d672d06eab6f8597287095a2c55a8b775e7016
    }
}
