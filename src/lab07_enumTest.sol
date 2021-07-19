// SPDX-License-Identifier: UNLICENSED
// lab07_enumTest.sol
pragma solidity ^0.8.4;

contract MyContract {
    
    enum ContractState { Waiting, Ready, Actived }

    ContractState public state;

    constructor() {
        state = ContractState.Waiting;
    }

    function setReadyState() public {
        state = ContractState.Ready;
    }

    function setActiveState() public {
        state = ContractState.Actived;
    }

    function isActived() public view returns(bool) {
        return (state == ContractState.Actived);
    }
}
