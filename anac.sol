// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.4.0;

contract Anac {
    uint public idade;
    address public dono;

    constructor() public{
        idade = 18;
        dono = msg.sender;
    }

    function setIdade(uint _valor) public{
        idade = _valor;
    }

    function getIdade() public view returns (uint) {
        require(msg.sender == dono, "Somente o dono pode ver a idade");
        return idade;
    }
}