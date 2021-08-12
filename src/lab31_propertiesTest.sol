// SPDX-License-Identifier: UNLICENSED
// lab31_propertiesTest.sol

pragma solidity ^0.8.7;

contract TestContract {
    uint myValue = 0;
    
    function getInfo() public returns (
        uint, address, uint, uint, uint, uint, uint256, bytes memory, address, bytes4, uint, address
    ) {
        myValue++;
        return (block.chainid,
                block.coinbase,
                block.difficulty,
                block.gaslimit,
                block.number,
                block.timestamp,
                gasleft(),
                msg.data,
                msg.sender,
                msg.sig,
                tx.gasprice,
                tx.origin);
    }
}
