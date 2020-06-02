pragma solidity >=0.4.24;


contract ArraysContract {
    // Elementary type array in storage
    // Static Array with size 3 of type int
    int256[3] staticIntArray = [1, 2]; // Last element set to 0
    // Dynamic array of type int8
    int8[] dynamicIntArray;
    // Dynamic array of type bool
    bool[] dynamicBoolArray;

    function testArray() public {
        // Allocate memory for 8 elements to the dynamic bool storage array
        dynamicBoolArray = new bool[](8);
        // Allocate memory and initialize elements in the int array
        // Explicit conversion is needed from uint8 to int8
        dynamicIntArray = [int8(1), 2, 3];
        // This will work fine, since we are inside a function
        uint8[] memory memoryArray; // A Dynamic memory array
        // Allocation with assignment not allowed for dynamic memory arrays
        // memoryArray = [1,2,3];
        uint8[] memory dynamicMemoryArray; // A Dynamic memory array
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
        staticIntArray = [1, 2, 3];

        // Static memory array
        uint256[2] memory staticMemoryArray;

        // This is  allowed - make sure the type is matching
        // staticMemoryArray is of type uint
        staticMemoryArray = [uint256(1), 2];

        // This is allowed
        staticMemoryArray[0] = 0;
        staticMemoryArray[1] = 1;

        dynamicMemoryArray[0] = 1;
        dynamicMemoryArray[1] = 2;
    }

    //1. storage arrays
    //2. memory arrays
    //3. array arguments and return arrays from function
    //1.
    uint256[] myArray; //  we can do crud.

    function arr() external {
        myArray.push(2);
        myArray.push(3); // update

        myArray[1]; //  read

        myArray[0] = 20; // update

        delete myArray[1]; // delete will not change  the length of array it will assign the element to 0

        for (uint256 i = 0; i < myArray.length; i++) {
            myArray[i];
        }
        // storage array cvan be divided into two categories
        // above one is dynamic sized array

        // if I declare fixed length array

        //uint256[2] storage Array = [1, 3]; // i will loose access to .push method
    }

    //2. memory arrays
    // these arrays are not stored inside the blockchain.
    function bar() external {
        uint256[] memory newArray = new uint256[](10);'

        newArray[0] = 10;
        newArray[1] = 20;

        newArray[0];

        delete newArray[5];
    }


    //3. arrays in fucntion
    function yeah(uint[] calldata mtArg ) internal returns(uint[] memory){
         
     }
}
