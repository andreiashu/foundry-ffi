// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SimpleMath {

    function increment(uint256 _number) public pure returns (uint256) {
      require(_number < type(uint256).max, "cannot increment max uint256");
      return _number+ 1;
    }
}
