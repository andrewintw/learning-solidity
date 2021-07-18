// SPDX-License-Identifier: UNLICENSED
// lab05_chkDay.sol
pragma solidity ^0.8.4;

contract MyContract {
    uint8 constant MON = 1;
    uint8 constant TUE = 2;
    uint8 constant WED = 3;
    uint8 constant THU = 4;
    uint8 constant FRI = 5;
    uint8 constant SAT = 6;
    uint8 constant SUN = 7;

    uint8 public shipDay;

    constructor() {
        setShipDay(SUN);
        // setShipDay(0); // 你還是無法阻止有人寫出這樣的程式。compile 也會過！
    }

    function setShipDay(uint8 shday) public {
        if (shday >= MON && shday <= SUN) {
            shipDay = shday;
        }
    }

    function isSunday() public view returns(bool) {
        return (shipDay == SUN);
    }
}
