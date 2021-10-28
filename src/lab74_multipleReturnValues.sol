// SPDX-License-Identifier: UNLICENSED
// lab74_multipleReturnValues.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {
    uint public n_sum = 0;
    uint public n_product = 0;

    // function arithmetic(uint _n1, uint  _n2) internal pure returns (uint, uint) {
    //     return (_n1 + _n2, _n1 * _n2);
    // }

    function arithmetic(uint _n1, uint  _n2) internal pure returns (uint o_sum, uint o_product) {
        // return (_n1 + _n2, _n1 * _n2);
        o_sum = _n1 + _n2;
        o_product = _n1 * _n2;
    }

    function doCalc(uint _n1, uint _n2) external {
        (n_sum, n_product) = arithmetic(_n1, _n2);
    }
}
