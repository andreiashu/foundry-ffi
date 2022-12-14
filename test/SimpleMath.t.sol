// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../src/SimpleMath.sol";
import {Strings} from "openzeppelin-contracts/utils/Strings.sol";

/**
 * https://book.getfoundry.sh/forge/differential-ffi-testing
 * https://book.getfoundry.sh/cheatcodes/ffi
 * https://book.getfoundry.sh/reference/config/testing#ffi
 */
contract SimpleMathTest is Test {
    SimpleMath public simpleMath;
    using Strings for uint256;

    function setUp() public {
        simpleMath = new SimpleMath();
    }

    function testIncrement(uint256 _a) public {
        vm.assume(_a < type(uint256).max);
        assertEq(simpleMath.increment(_a), scriptIncrement(_a));
    }

    function scriptIncrement(uint256 _a) private returns(uint256) {
        string[] memory inputs = new string[](5);
        inputs[0] = "python3";
        inputs[1] = "script/simple_math.py";
        inputs[2] = "increment";
        inputs[3] = "--number";
        inputs[4] = _a.toString();
        bytes memory res = vm.ffi(inputs);
        uint256 result = abi.decode(res, (uint256)); 

        console.log(result);
        return result;
    }
}
