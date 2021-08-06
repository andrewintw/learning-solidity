// SPDX-License-Identifier: UNLICENSED
// lab26_hash_keccak256.sol

pragma solidity ^0.8.6;

contract TestContract {
    
    function printHash() public pure returns (bytes32, bytes32, bytes32, bytes32, bytes32) {
        return (keccak256(""),
                keccak256("abc"),
                keccak256("12345678901234567890123456789012345678901234567890123456789012345678901234567890"),
                keccak256("writing the time lag"),
                keccak256("writing the Time lag")
                );
    }
}
