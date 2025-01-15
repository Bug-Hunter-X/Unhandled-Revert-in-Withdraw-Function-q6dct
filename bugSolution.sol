```solidity
function withdraw() public {
    uint balance = balanceOf[msg.sender];
    require(balance > 0, "Insufficient balance");
    (bool success, bytes memory returnData) = msg.sender.call{value: balance}(new bytes(0));
    if (!success) {
        // Handle revert.  ReturnData may contain reason.
        if (returnData.length > 0) {
            assembly {
                let returnData_size := mload(returnData)
                revert(add(32, returnData), returnData_size)
            }
        } else {
            revert("Transfer failed.");
        }
    }
    balanceOf[msg.sender] = 0;
}
```