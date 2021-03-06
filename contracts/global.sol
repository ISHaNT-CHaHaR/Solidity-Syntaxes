pragma solidity >=0.4.24;


contract GlobalVariables {
    string public lastCaller = "not-set";

    // Demonstrates the use of the ether subdenominations
    function etherUnitsTest() public pure returns (bool) {
        // True
        bool value = (1 ether == 1000 finney);
        return value;
    }

    // Demonstrates the use of the time units
    function timeUnits() public view returns (uint256) {
        uint256 timeNow = now;  //storing current time using now
        //returns block time in seconds since 1970
        if (timeNow == 1000 hours) {
            // converting 1000 literal to days, using the suffix days
            return timeNow;
        }
    }

    // Demonstrates the use of block object
    function getBlockInformation()
        public
        view
        returns (
            uint256 number,
            bytes32 hash,
            address coinbase,
            uint256 difficulty
        )
    {
        number = block.number; // Previous block
        hash = blockhash(number - 1); // -1 because excluding current...same as block.blockhash()
        // Current block
        coinbase = block.coinbase;
        difficulty = block.difficulty;
    }

    // Demonstrates the use of the msg object
    function getMsgInformation()
        public
        view
        returns (
            bytes memory data,
            bytes4 sig,
            address sender
        )
    {
        data = msg.data;
        sig = msg.sig;
        sender = msg.sender;
    }

    //Global variables for ethereum environment
    //tx
        //tx.origin;  // the ethereum address that sends the transaction 
    //msg
        msg.value // amount of ether send to address  1wei = 10^(-18) ether
        msg.sender ;// these are addresses for every sender withi9n smart contract. and 
        // tx.origin is just the origin address if inheritance is there

    //block
        block.timestamp;// the time when block is created or we can use now keywork


}
