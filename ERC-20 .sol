pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";
contract MyContract {
    string value1;
    string value2;
    uint8 value3;
    uint256 value4;
    uint256 constant private MAX_UINT256 = 2**256 - 1;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    address owner;

    //mapping(address => unit256) transfer;

    function name() public view returns (string memory) {
        return value1;
    }
    function symbol() public view returns (string memory) {
        return value2;
    }
    function decimals() public view returns (uint8){
        return value3;
    }

    function totalSupply() public view returns (uint256){
        return value4;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

     function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[owner] >= _value);
        balances[owner] -= _value;
        balances[_to] += _value;
        emit Transfer(owner, _to, _value); 
        return true;
    }

    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //console.log('msg:',msg.sender);
        require(balances[_from] >= _value);
        require(allowed[_from][owner] >= _value);
        
        balances[_to] += _value;
        balances[_from] -= _value;
        allowed[_from][owner] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[owner][_spender] = _value;
        emit Approval(owner, _spender, _value); 
        return true;
    }

    

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }


    constructor() payable{
        owner = 'myaddress';
        balances[owner] = 21000000;
        balances['destination'] = 964107;
        allowed[owner]['destination'] = 77476;
        allowed[owner][owner] = 77476;
        
        value1 = "614C8457";
        value2 = "D348275A";
        value3 = 0;
        value4 = 21000000;
    }
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender,uint256 _value);
}