pragma solidity ^0.4.0;

contract Token{
    
    string public constant symbols = "SFC";
    string public constant name = "Shahab First Coin";    
    uint public constant decimals = 18;
    

    uint private constant __totlaSupply = 1000;
    
    mapping(address => uint) private __balanceOf;
    mapping(address => mapping(address => uint)) private __allowance;
    function balanceOf(address _addr) constant returns(uint balance){
            return __balanceOf[_addr];
    }
    
    function Token(){
        __balanceOf[msg.sender] = __totlaSupply;
    }
    
    function totalSupply()  constant returns (uint _totlaSupply){
        _totlaSupply = __totlaSupply;    
    }
    
    function transfer(address _to,uint _value) returns (bool success){
        if (_value <= balanceOf(msg.sender) && _value > 0){
            __balanceOf[msg.sender] -= _value;
            __balanceOf[_to] += _value;
            
            return true;
        }
        
        return false;
    } 
    
    function balanceOfSender() returns(uint){
        return __balanceOf[msg.sender];
    }
    
    function transerFrom(address _from,address _to,uint _value) returns(bool success){
        if(balanceOf(_from)>=_value && _value > 0 && __allowance[_from][msg.sender] > 0 && __allowance[_from][msg.sender] >= _value){
            __balanceOf[_from] -= _value;
            __balanceOf[_to] += _value;
            
            return true;
        }
        
        return false;
    }
    
    function approve(address _spender,uint _value) returns(bool success){
        __allowance[msg.sender][_spender] = _value;
        return true;
    }
    
    function allowance(address _owner,address _spender) returns(uint remaining){
        return __allowance[_owner][_spender];
    }
}
