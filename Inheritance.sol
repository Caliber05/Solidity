pragma solidity ^0.4.0;

interface Regulator
{
    function checkValue(uint amount) external returns (bool);
    function loan() external returns (bool);
}
contract Bank  is Regulator
{
    uint private value;
    
    constructor(uint amount) public
    {
        value = amount;
    }
    
    function deposit(uint amount) public
    {
        value += amount;
    }
    
    function withdraw(uint amount) public
    {
        if (checkValue(amount))
        {
            value -=amount;
        }
    
    }
    function balance() public view returns(uint)
    {
        return value;
    }
    
    function checkValue(uint amount) public returns (bool)
    {
        return value >=amount;
    }
    
    function loan() public returns (bool)
    {
        return value > 0;
    }
}
contract MyFirstContract is Bank(10)
{
    
    string private name;
    uint private age;
    
    function setName(string newName)
    {
        name = newName;
    }
    
    function getName() returns(string)
    {
        return name;
    }
    
    function setAge(uint newAge)
    {
        age = newAge;
    }
    
    function getAge() returns(uint)
    {
        return age;
    }
}
