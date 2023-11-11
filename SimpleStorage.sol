// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    // favoriteNumber gets initialized to 0 if no value is provided
    // Default visibility is 'internal'
    uint256 myFavoriteNumber; // 0

    // uint256[] favoriteNumbersList;

    struct Person{
        string name;
        uint256 favoriteNumber;
    }
    
    // dynamic array
    Person[] public peopleList;

    // static array
    // Person[3] public peopleList;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
        // this call will cost gas, even if retrieve() is a view function
        // getFavoriteNumber();
    }
    // view -> read state from blockchain
    // pure -> doesn't change state of blockchain
    function getFavoriteNumber() public view returns(uint256) {
        return myFavoriteNumber;
    }
    
    // by default, func params are memory vars
    // calldata -> temp param, CANNOT BE MODIFIED
    // memory -> temp param, CAN BE MODIFIED
    // storage -> permanent var, CAN BE MOFIDIED
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        peopleList.push( Person(_name, _favoriteNumber) );
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}