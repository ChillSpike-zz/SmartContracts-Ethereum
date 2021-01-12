pragma solidity 0.5.1;

contract MySecureKey{
 //   string public moiKey="bara-bara bere-bere";
    
 
    uint256 peopleCount=0;
    mapping(uint => Person)public people;
    address owner;
    uint256 openingTime=1610462523;
    
    /*
    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }*/
    
    modifier onlyWhileOpen(){
    require(block.timestamp<=openingTime);
    _;
        
    }
    
    struct Person{
        uint _id;
        string _firstname;
        string _secondname;
        
    }
    
    constructor() public{
        owner=msg.sender;
    }
    
    function addPerson(string memory _firstname  ,string memory _secondname)public onlyWhileOpen{
        countPeople();
        people[peopleCount] = Person(peopleCount, _firstname, _secondname);
     
    }
    
    function countPeople() internal{
           peopleCount+=1;
    }
    
    
}