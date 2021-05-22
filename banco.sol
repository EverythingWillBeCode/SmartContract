
pragma solidity ^0.4.17;

contract Banco {
    
    function Banco() payable public {
        
    }
    
    function incrementBalance(uint256 amount) payable public {
        require(msg.value == amount);
    }
    
    function getBalance() public {
        msg.sender.transfer(address(this).balance);
    }
    
    function() payable public {
        
    }


}