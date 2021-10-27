// SPDX-License-Identifier: UNLICENSED
// lab65_fallback_v0.5.x.sol

// pragma solidity >=0.8.0 <0.9.0;
pragma solidity >=0.5.0 <0.6.0;

contract TestContract {
    uint public num = 0;

    function () external { num++; }
    /* if pragma solidity >=0.8.0 <0.9.0;
        ParserError: Expected a state variable declaration. 
        If you intended this as a fallback function or a function to handle plain ether transactions, 
                                ^^^^^^^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        use the "fallback" keyword or the "receive" keyword instead.
                 ^^^^^^^^                  ^^^^^^^
    */
}
