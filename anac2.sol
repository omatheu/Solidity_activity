// Nova versão do contrato desenvolvido em sala de aula... adicionei um modificador para verificar se o dono do contrato é quem está executando a função.

// Este é um contrato simples que armazena a idade de uma pessoa e permite que o dono do contrato atualize a idade.

// Atividade desenvolvida em sala

// SPDX-License-Identifier: GPL-3.0

//Vesão do compilador
pragma solidity >0.4.0;

//Declarando o contrato
contract Anac {
    //Declarando a variável idade
    uint public idade;
    //Declarando a variável dono
    address public dono;

    //Construtor
    constructor() {
        //Atribuindo um valor inicial para a variável idade
        idade = 18;
        //Atribuindo o endereço do dono do contrato
        dono = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == dono, "Apenas o dono do contrato pode executar essa funcao");
        _;
    }

    //Função para atualizar a idade. A função espera um valor do tipo uint que será a nova idade.
    function setIdade(uint _valor) public onlyOwner{
        //Atribuindo o novo valor para a variável idade
        idade = _valor;
    }

    //Função para retornar a idade. A função é do tipo view, ou seja, não altera o estado do contrato.
    function getIdade() public onlyOwner view returns (uint) {
        //Retornando o valor da variável idade.
        return idade;
    }
}