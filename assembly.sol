pragma solidity >=0.6.0;


contract assemble {
    // Ok, assembly manipulates directly memory. so use it when u have no choice at all
    // assembly directly manipulates opcode  of EVM(Ethereum virtual machine)

    // always write assembly inside a function and wrap in an assembly block;
    /// In EVM everything is stored in 3 SLOTS
    function yeah() external {
        uint256 c;
        uint256 a;
        uint256 b;

        // assembly {
        //     let a := mload(0x40) // this address will return next available slot in the memory
        //     mstore(a, 2)
        //     sstore(a,10);
        // }
        // detect if an address is a smart contract or not.
        uint256 size;
        address addr = msg.sender;
        assembly {
            size := extcodesize(addr) //  it will return a boolean.
        }
        if (size > 0) {
            return true;
        } else {
            return false;
        }

        // casting bytes into bytes32;

        // bytes memory data = new bytes(10);
        // assembly {
        //     dataB32 := mload(add(data, 32))
        // }
    }
}
