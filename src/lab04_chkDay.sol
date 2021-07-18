// SPDX-License-Identifier: UNLICENSED
// lab04_chkDay.sol
pragma solidity ^0.8.4;

contract MyContract {
    uint8 public shipDay;  // day of week (0..6); 0 is Monday

    constructor() {
        //shipDay = 6; // 當然也可以直接用這個方式
        setShipDay(6);
    }

    function setShipDay(uint8 shday) public {
        if (shday >=0 && shday <= 6) {
            shipDay = shday;
        }
    }

    function isSunday() public view returns(bool) {
        return (shipDay == 6);
    }
}

/* Test:
 * try run setShipDay(255) and check the gas
 */
