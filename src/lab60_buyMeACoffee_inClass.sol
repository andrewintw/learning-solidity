// SPDX-License-Identifier: UNLICENSED

/*  lab60_buyMeACoffee(inClass).sol
    based-on lab58_payable_msgValue.sol, live coding in class
 */

pragma solidity >=0.8.0 <0.9.0;

contract BuyMeACoffeeContract {
    uint256 constant MIN_DONATE = 1 ether; // = 1e18 wei
    
    event depositTriggered(address addr, uint256 amount);
    event withdrawTriggered(address, uint256);

    mapping(address => uint256) public donations;
    // address ownerAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address ownerAddr;
    
    constructor () payable {
        ownerAddr = msg.sender;
        donations[ownerAddr] += msg.value;
        emit depositTriggered(ownerAddr, msg.value);
    }
    
    modifier minDonateReq() {
        require(msg.value >= MIN_DONATE, "Error: amount is not enough!");
        _;
    }
    
    modifier onlyForOwner() {
        require(msg.sender == ownerAddr, "Error: only for owner");
        _;
    }
    
    modifier chkBalance(uint256 _Amount) {
        require(_Amount <= getBalance(), "Error: balance is not enough!");
        _;
    }

    function deposit() external payable minDonateReq {
        donations[msg.sender] += msg.value;
        emit depositTriggered(msg.sender, msg.value);
    }


    // owner check --> only for owner
    function getDonateInfo(address _addr) public view onlyForOwner returns(uint256) {
        return donations[_addr];
    }

    function getDonateInfo2() public view returns(uint256) {
        return donations[msg.sender];
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(address payable _addr, uint256 _amount) external onlyForOwner chkBalance(_amount) {
        //require(_amount <= getBalance(), "Error: balance is not enough!");
        _addr.transfer(_amount);
        emit withdrawTriggered(_addr , _amount);
    }

    function withdrawToOwner(uint256 _amount) external onlyForOwner chkBalance(_amount) {
        payable(ownerAddr).transfer(_amount);
        // payable(msg.sender).transfer(_amount);
        emit withdrawTriggered(ownerAddr , _amount);
        assert(ownerAddr == msg.sender);
    }


}
