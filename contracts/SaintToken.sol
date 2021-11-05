
// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SaintToken is ERC20 {

    uint256 private constant INITIAL_TOTAL_SUPPLY = 100_000_000_000e18;

    function initialize() public initializer {
        Ownable.__Ownable_init();
        ERC20.__ERC20_init("Saint Token", "SAT");
        _setupDecimals(18);
        _totalSupply = 0;
        _mint(msg.sender, INITIAL_TOTAL_SUPPLY);
    }

}
