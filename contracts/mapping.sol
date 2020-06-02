pragma solidity >=0.6.0;


contract exampleMapping {
    mapping(string => string) capitals;

    function addCapital(string memory country, string memory capital) public {
        capitals[country] = capital;
    }

    function getCountry(string memory country)
        public
        view
        returns (string memory)
    {
        return capitals[country];
    }

    function deleteCountry(string memory country) public {
        delete (capitals[country]);
    }
}


contract MappingsContract {
    // Creates in Storage
    mapping(string => string) relations;

    // Add a relation
    function addRelation(string memory name, string memory relation) public {
        // Store the relation
        relations[name] = relation;
    }

    // Returns a Relation
    function getRelation(string memory name)
        public
        view
        returns (string memory)
    {
        return relations[name];
    }

    // Remove the key value pair from the mapping
    function removeRelation(string memory name) public {
        delete (relations[name]);
    }

    mapping(address => uint256) balances;

    mapping(address => mapping(address => bool)) approved; // exotic mapping

    //array inside mapping
    mapping(address => uint256[]) scores;

    function map(address spender) external {
        //1. adding element
        balances[msg.sender] = 100;
        //2. Read
        balances[msg.sender];
        //3. Update
        balances[msg.sender] = 200;
        //4.  Delete
        delete balances[msg.sender];

        /// default value
        //balances[someAddressnotexist]; // this will have a value 0 because uint's default value is 0
        // it depends according to mapped elements.

        approved[msg.sender][spender] = true; // exotic mapping
        approved[msg.sender][spender];
        approved[msg.sender][spender] = false;
        delete approved[msg.sender][spender];

        /// array inside mapping
        scores[msg.sender].push(1);
        scores[msg.sender].push(2);

        // read
        scores[msg.sender][0];
        scores[msg.sender][0] = 10;

        delete scores[msg.sender][0];
    }
}
