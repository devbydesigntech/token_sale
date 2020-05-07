pragma solidity >=0.4.21 <0.7.0;

contract CrypsndipToken {
    string public name = "Toilet Paper Token";
    string public symbol = "TPT";
    string public standard = "Toilet Paper Token v1.0";
    uint256 public totalSupply;

    event Transfer (
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    // approve
    event Approval (
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor (uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        // allocate the initial supply
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {

        require(balanceOf[msg.sender] >= _value, 'Insufficient sender balance');

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from], 'Amount should not exceed balance');
        require(_value <= allowance[_from][msg.sender], 'Amount should not exceed allowance');

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }


}
