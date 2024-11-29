// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenSpender {
    function spendTokens(
        address tokenAddress,
        address to,
        uint256 amount
    ) external {
        require(amount > 0, "Amount must be greater than zero");

        IERC20 token = IERC20(tokenAddress);

        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= amount, "Allowance is not sufficient");

        bool success = token.transferFrom(msg.sender, to, amount);
        require(success, "Token transfer failed");
    }

    function withdrawTokens(address tokenAddress, uint256 amount) external {
        IERC20 token = IERC20(tokenAddress);

        uint256 balance = token.balanceOf(address(this));
        require(balance >= amount, "Insufficient balance in contract");

        bool success = token.transfer(msg.sender, amount);
        require(success, "Withdraw failed");
    }
}
