pragma solidity 0.5.1;

contract BuyTokenContract{
    mapping(address=>uint256)public balances;
    address payable wallet;
        
    constructor(address payable _wallet)public{
        wallet=_wallet;
        
    }
    
    function() external payable{
        buyToken();
    }
    
    function buyToken() public payable{
        //buy a buToken and send ether to a wallet
        //msg.sender is the account that is calling this function
        
        balances[msg.sender]+=1;
        
        //msg.value will provide the amount of ether sent
        wallet.transfer(msg.value);
    }
    
    
    
}