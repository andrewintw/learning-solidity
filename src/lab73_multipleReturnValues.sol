// SPDX-License-Identifier: UNLICENSED
// lab73_multipleReturnValues.sol

pragma solidity >=0.8.0 <0.9.0;

contract TestContract {
    function sum(uint _n1, uint  _n2) external pure returns (uint) {
        return (_n1 + _n2);
    }
    
    function product(uint _n1, uint  _n2) external pure returns (uint _product) {
        _product = (_n1 * _n2);
    }

    function arithmetic(uint _n1, uint  _n2) external pure returns (uint, uint) {
        return (_n1 + _n2, _n1 * _n2);
    }
}
