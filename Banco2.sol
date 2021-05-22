pragma solidity ^0.4.17;

contract Banco {
    
    address owner;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    function newOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }
    
    function getOwner() view public returns(address) {
        return owner;
    }
    
    function getBalance() view public returns(uint256){
        return address(this).balance;
    }
    
    function Banco() payable public {
        owner = msg.sender;
    }
    
    function incrementBalance(uint256 amount) payable public {
        require(msg.value == amount);
    }
    
    function withdrawBalance() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
    
}