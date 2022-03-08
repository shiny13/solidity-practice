pragma solidity 0.5.1;

contract MyContract {
    mapping (uint => Person) public people;
    uint256 public peopleCount;

    uint256 openingTime = 1646743178;
    address owner;

    modifier onlyOwner() {
        // check if the sender is the owner
        require(msg.sender == owner);  
        // check a time for the transaction to proceed
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        uint256 _id;
        string _firstname;
        string _lastname;
    }

    constructor() public {
        owner = msg.sender;
    }

    function addPerson(string memory _firstname, string memory _lastname) public onlyOwner {
        increamentCount();
        people[peopleCount] = Person(peopleCount, _firstname, _lastname);
    }

    function increamentCount() internal {
        peopleCount += 1;
    }
}
