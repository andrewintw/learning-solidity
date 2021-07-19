// SPDX-License-Identifier: UNLICENSED
// lab06_chkDay_enum.sol
pragma solidity ^0.8.4;

contract MyContract {
    
    enum DaysOfWeek { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

    DaysOfWeek public shipDay; // 宣告方式

    constructor() {
        setShipDay(DaysOfWeek.Sun);
        // setShipDay(6); // compiler 不准你這樣寫！
    }

    function setShipDay(DaysOfWeek shday) public {                // 注意 parameter 的宣告方式
        if (shday >= DaysOfWeek.Mon && shday <= DaysOfWeek.Sun) { // 注意 enum 表示成員的方式
            shipDay = shday;
        }
    }

    function isSunday() public view returns(bool) {
        return (shipDay == DaysOfWeek.Sun); // 注意 enum 表示成員的方式
    }
}


/* Try: 1. remove if in setShipDay()
        2. run setShipDay(255)

    transact to MyContract.setShipDay errored: VM error: revert.
    
    revert
    	The transaction has been reverted to the initial state.
    Note: The called function should be payable if you send value and the value you send should be less than your current balance.
    Debug the transaction to get more information. 
*/
