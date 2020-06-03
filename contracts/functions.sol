pragma solidity >=0.6.8;


contract FunctionsContract {
    string ownerName;
    uint8 ownerAge;

    // Constructor
    constructor(string memory name, uint8 age) public {
        ownerName = name;
        ownerAge = age;
    }

    // We are changing the owner name and age
    function setOwnerInfo(string memory name, uint8 age) public {
        ownerName = name;
        ownerAge = age;
    }

    function secretFunction() private pure {
        // Not available outside this contract
    }

    // Get owner name and age
    function getOwnerInfo()
        public
        view
        returns (string memory name, uint8 age)
    {
        name = ownerName;
        age = ownerAge;
    }

    // Get the name
    // 2 ways to return values from a function
    function getOwnerName() public view returns (string memory) {
        return ownerName;
    }

    // Get the age
    function getOwnerAge() external view returns (uint8 age) {
        age = ownerAge; // can only be called outside the smart contract
    }

    function getSECRET() private view returns (uint256 code) {
        return ownerAge; // can only be used inside contract;
        //getOwnerAge(); // error: not visible at this point.
    }

    function getCode() internal view returns (uint256 _code) {
        _code = ownerAge; // similar to private but can only be used in inherited contact too.
    }
}
