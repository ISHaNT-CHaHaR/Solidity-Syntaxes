pragma solidity >=0.4.24;

import "./MainContract.sol";


// We have an ContractInterface, that has a function
// sendmoney...but there is no function body
interface ContractInterface {
    function sendMoney(uint256 amount, address _address)
        external
        returns (bool);
}


// This is a BaseContract, that has its constructor, and deposit and withdraw functions...
contract BaseContract {
    uint256 public value;

    // Anytime base contract has a constructor, we will need to initialize this using
    // the derived contracts constructor function

    constructor(uint256 amount) public {
        value = amount;
    }

    function deposit(uint256 amount) public {
        value += amount;
    }

    function withdraw(uint256 amount) public {
        value -= amount;
    }
}


// This shows multiple inheritance

// This will give an error...since baseContract has a constructor that we need to initialize
// contract myContract is baseContract, interfaceContract {

contract InheritanceContract is
    BaseContract(100),
    ContractInterface,
    MainContract(100)
{
    string public contractName;

    constructor(string memory _n) public {
        contractName = _n;
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    // Function that allows you to convert an address into a payable address
    function _make_payable(address x) internal pure returns (address payable) {
        return address(uint160(x));
    }

    // This function has to be implemented, since it is unimplemented in the interfaceContract
    function sendMoney(uint256 amount, address _address) public returns (bool) {
        _make_payable(_address).transfer(amount);
    }
}


contract ArraysContract {

    // Elementary type array in storage
    // Static Array with size 3 of type int
    int[3]     staticIntArray = [1,2];    // Last element set to 0
    // Dynamic array of type int8
    int8[]     dynamicIntArray;
    // Dynamic array of type bool
    bool[]     dynamicBoolArray;

    function testArray() public {
        // Allocate memory for 8 elements to the dynamic bool storage array
        dynamicBoolArray = new bool[](8);
        // Allocate memory and initialize elements in the int array
        // Explicit conversion is needed from uint8 to int8
        dynamicIntArray = [int8(1),2,3];
        // This will work fine, since we are inside a function
        uint8[] memory memoryArray; // A Dynamic memory array
        // Allocation with assignment not allowed for dynamic memory arrays
        // memoryArray = [1,2,3];
        uint8[] memory dynamicMemoryArray;  // A Dynamic memory array
        // Assignment of dynamic NOT allowed
        //dynamicMemoryArray = [uint8(1),2];
        memoryArray = new uint8[](8);
        // push() not allowed for memory array
        // memoryArray.push(1);
        // memoryArray.length=6;

        /** Examples of array initialization with assignment below */

        // Static storage array assignment is OK
        // Compile time size check is carried out
        // so assignment to [1,2,3,4] will fail below
        staticIntArray = [1,2,3];


        // Static memory array
        uint[2] memory  staticMemoryArray;

        // This is  allowed - make sure the type is matching
        // staticMemoryArray is of type uint
        staticMemoryArray = [uint(1),2];

        // This is allowed
        staticMemoryArray[0] = 0;
        staticMemoryArray[1] = 1;

        dynamicMemoryArray[0] = 1;
        dynamicMemoryArray[1] = 2;
    }
}
