pragma solidity >=0.4.24;


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
}
