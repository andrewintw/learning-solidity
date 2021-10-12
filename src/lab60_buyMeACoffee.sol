// SPDX-License-Identifier: UNLICENSED

/*  lab60_buyMeACoffee.sol
    based-on lab59_buyMeACoffee.sol
    changes:
        * Only allow withdraw() to the owner’s account
 */

pragma solidity >=0.8.0 <0.9.0;

contract BuyMeACoffeeContract {

    uint256 constant MIN_AMOUNT = 1 ether;
    mapping(address => uint256) donations;
    address owner;

    event depositTriggered(address addr, uint256 amount);
    event withdrawTriggered(address addr, uint256 amount);

    modifier onlyOwner() {
        require(owner == msg.sender, "Error: permission denied!");
        _;
    }

    modifier chkMinAmount(uint _donate) {
        require(_donate >= MIN_AMOUNT, "Error: not enough to buy a coffee!");
        _;
    }

    modifier chkBalance(uint _inAmount) {
        require(_inAmount <= getBalance(), "Error: balance is not enough");
        _;
    }

    constructor () payable {
        owner = msg.sender;
        donations[msg.sender] += msg.value;
        emit depositTriggered(msg.sender, msg.value);
    }

    function deposit() external payable chkMinAmount(msg.value) {
        donations[msg.sender] += msg.value;
        emit depositTriggered(msg.sender, msg.value);
    }

    function getBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }

    function withdraw(uint256 _amount) external onlyOwner chkBalance(_amount) {
        payable(owner).transfer(_amount);
        emit withdrawTriggered(owner, _amount);

        // payable(msg.sender).transfer(_amount);
        // emit withdrawTriggered(msg.sender, _amount);
    }

    function getDonateInfo(address _addr) public view onlyOwner returns(uint256) {
        return donations[_addr];
    }
}
