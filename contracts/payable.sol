pragma solidity >=0.6.0;


// payable functions are used to send ether to a smart contract from an address.

// Function must nit have mutablity as view for this
contract MyCOntract {
    mapping(address => uint256) balances;

    function invest() external payable {
        if (msg.value < 1 ether) {
            revert("value exceeded!");
        }
        balances[msg.sender] += msg.value;
    }

    function balance() external view returns (uint256) {
        return address(this).balance;
    }
}
