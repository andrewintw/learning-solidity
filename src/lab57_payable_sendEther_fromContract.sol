// SPDX-License-Identifier: UNLICENSED
// lab57_payable_sendEther_fromContract.sol

pragma solidity >=0.8.0 <0.9.0;

contract PayableTestContract {

    uint8 public state = 0;

    constructor () payable {
        state++;
    }

    function deposit() external payable {
        state++;
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    function sendEtherTo(address payable _addr, uint256 _amount) public {
        _addr.send(_amount);
        state++;
    }
    
    function sendEtherToChk1(address payable _addr, uint256 _amount) public {
        if (! _addr.send(_amount)) {
            revert("failed to send ether!");
        }
        state++;
    }

    function sendEtherToChk2(address payable _addr, uint256 _amount) public {
        require(_addr.send(_amount), "FAILED to send ether!");
        state++;
    }
    
    function transferEtherTo(address payable _addr, uint256 _amount) public {
        _addr.transfer(_amount); // msg: the value you send should be less than your current balance.
        state++;
    }
}
