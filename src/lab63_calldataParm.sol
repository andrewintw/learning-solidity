// SPDX-License-Identifier: UNLICENSED
// lab63_calldataParm.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {

    // try: 0x747a7574756e67
    function pubParm(bytes memory _name) public pure returns (bytes memory, string memory) {
        return (msg.data, string(_name));
    }

    function pubCallData(bytes calldata _name) public pure returns (bytes memory, string memory) {
        return (msg.data, string(_name));
    }
}
