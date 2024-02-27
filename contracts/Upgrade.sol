pragma solidity ^0.8.20;

contract Upgrade {
    mapping(address => uint) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        // update balance
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;

        // send back ether
        bool success = payable(msg.sender).send(amount);
        require(success, "Transfer of eth failed.");
    }
}
