// SPDX-License-Identifier: UNLICENSED
// lab28_VerifyEncodePacked.sol

pragma solidity ^0.8.6;

contract TestContract {
    bytes32 constant verifyHash = 0x48ee49a58436526e78a000847f84609981e4d6da2aa7e1a56c60ecfd5f667e25;

    string constant myPasswd = "tinyverse";
    string constant myEmail  = "yenchang.lin@gmail.com";
    int constant myMagicNum  = -12345;


    function verifyPasswd(string memory _passwd, string memory _email, int _num) public pure returns (bool) {
        return (keccak256(abi.encodePacked(bytes(_passwd), _email, _num)) == verifyHash);
    }


    /* 產生密碼用：將結果指定給 verifyHash 後就可以變成 private 或是移除 */
    function genHashValue() public pure returns (bytes32) {
        return keccak256(abi.encodePacked(myPasswd, myEmail, myMagicNum));
        // result: 0x48ee49a58436526e78a000847f84609981e4d6da2aa7e1a56c60ecfd5f667e25
    }
}
