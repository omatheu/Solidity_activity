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

    //Função para atualizar a idade. A função espera um valor do tipo uint que será a nova idade.
    function setIdade(uint _valor) public {
        //Atribuindo o novo valor para a variável idade
        idade = _valor;
    }

    //Função para retornar a idade. A função é do tipo view, ou seja, não altera o estado do contrato.
    function getIdade() public view returns (uint) {
        //Aqui estamos verificando se o endereço que está chamando a função é o dono do contrato.
        require(msg.sender == dono, "Somente o dono pode ver a idade");
        //Retornando o valor da variável idade.
        return idade;
    }
}