//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KuicToken is ERC20 {
    uint256 constant _initial_supply = 1000000 * (10**18);

    constructor() ERC20("Kuic", "KUI") {
        _mint(msg.sender, _initial_supply);
    }

    function buyToken() external {}
}
