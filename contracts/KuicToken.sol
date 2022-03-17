//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KuicToken is ERC20 {
    uint256 constant _initial_supply = 1000000 * (10**18);
    uint256 public unitsPerEth = 1000;
    address public tokenOwner;

    constructor() ERC20("Kuic", "KUI") {
        tokenOwner = msg.sender; // address of token owner
        _mint(msg.sender, _initial_supply);
    }

    // Buy tokens with ETh
    function buyToken() external payable {
        uint256 amount = msg.value * unitsPerEth;
        require(balanceOf(tokenOwner) >= amount, "Not enough tokens");
        // transfer token to buyer
        _transfer(tokenOwner, msg.sender, amount);
        // emit event to inform of the transfer
        emit Transfer(tokenOwner, msg.sender, amount);
        // send the ether aerned to the token owner
        payable (tokenOwner).transfer(msg.value);
    }
}
