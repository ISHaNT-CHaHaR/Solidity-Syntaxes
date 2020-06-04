pragma solidity >=0.6.0;


// payable functions are used to send and receive ether.

// sending ether from a smart contract address to an address

// Function must not have mutablity as view for this
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


contract SmartContractToOther {
    //1. Transfer
    address payable[] recipient;

    function sendEther(address payable reci) external {
        reci.transfer(1 ether); // or 100 ./that is automatically wei
        //If I want to use address in transfer and send. I need to use payable type

 // Address payable FUNCTION allows you to send ether from an address. and it will only work when function is called.
 // but mr. payable allows to send ether from a smart contract.

        //2. address vs address payable
        //3. address payable casting(address and uint160)
        address a;
        a = reci;
        //a.transfer(100);
        //4. msg.sender
        // msg.sender is a payable address byt default so we can use it.
        msg.sender.transfer(100);
        //5. send vs transfer.
        //reci.send(1 ether);
        // but we consider using transfer instead because .send in case of error will return a boolean false but .transfer simply just revert the transaction.

    }
}
