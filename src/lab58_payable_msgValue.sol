// SPDX-License-Identifier: UNLICENSED

/*  lab58_payable_msgValue.sol
    based-on lab57_payable_sendEther_fromContract.sol
 */

pragma solidity >=0.8.0 <0.9.0;

contract BuyMeACoffeeContract {

    event depositTriggered(address addr, uint256 amount);

    constructor () payable {
        emit depositTriggered(msg.sender, msg.value);
    }

    function deposit() external payable {
        emit depositTriggered(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(address payable _addr, uint256 _amount) external {
        _addr.transfer(_amount);
    }
}
