# Unhandled Revert in Solidity Withdraw Function

This repository demonstrates a common error in Solidity smart contracts: unhandled reverts during external calls.  The `withdraw` function in `bug.sol` attempts to send Ether to the caller but doesn't handle potential reverts from the recipient's fallback function, leading to potential loss of funds and unexpected behavior.

The solution, found in `bugSolution.sol`, implements robust error handling to catch and report these reverts, enhancing the contract's reliability.