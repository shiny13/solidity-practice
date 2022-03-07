pragma solidity 0.5.1;

contract MyContract {
    string public value;
    string public value2 = "myValue2";
    string public constant value3 = "constantValue";
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint = 1;
    uint public myUnit8 = 8;
    uint256 public myUint256 = 88888;

    enum State { Waiting, Ready, Active } 
    State public state;

    //Person[] public people;
    mapping (uint => Person) public people;
    uint256 public peopleCount;

    struct Person {
        uint256 _id;
        string _firstname;
        string _lastname;
    }

    constructor() public {
        value = "myValue";
        state = State.Waiting;
    }

    function get() public view returns(string memory) {
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns(bool) {
        return state == State.Active;
    }

    function addPerson(string memory _firstname, string memory _lastname) public {
        //people.push(Person(_firstname, _lastname));
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstname, _lastname);
    }
}
