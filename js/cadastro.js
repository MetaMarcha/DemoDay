const formulario = document.querySelector("form");
const botao = document.querySelector("#proximo");
//inputs do formulário
const input_nome = document.querySelector(".nome");
const input_documento = document.querySelector(".documento");
const input_empresa = document.querySelector(".empresa");
const input_email = document.querySelector(".email");
const input_tel = document.querySelector(".tel");
const input_senha = document.querySelector('input[name=senha]');
const input_confirma = document.querySelector('input[name=confirma]');
//escolha do tipo da empresa
const input_escolha = document.querySelector(".escolha");

const input_voltar = document.querySelector("#back")

function confirasenha() {
    if (input_confirma.value === input_senha.value) {
        input_confirma.setCustomValidity('');
    } else {
        input_confirma.setCustomValidity('As senhas não conferem')
    }
}

function cadastrar() {

    fetch("http://localhost:8080/usuarios", {

            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            method: "POST",
            body: JSON.stringify({
                nome: input_nome.value,
                documento: input_documento.value,
                empresa: input_empresa.value,
                email: input_email.value,
                telefone: input_tel.value,
                senha: input_senha.value,
                confirma: input_confirma.value
            })
        })

        .then(function (res) {
            console.log(res)
        })
        .catch(function (res) {
            console.log(res)
        })

};

function limpar() {
    input_nome.value = "";
    input_documento.value = "";
    input_empresa.value = "";
    input_email.value = "";
    input_tel.value = "";
    input_senha.value = "";
    input_confirma.value = "";
};

formulario.addEventListener('submit', function (event) {
    event.preventDefault();
    cadastrar();
   
    leitura();
});

function leitura() {
    if (formulario !== true){
        window.location="http://127.0.0.1:5501/html/cadastro2.html";
    }else{
        alert("Algo deu errado. Verifique suas informações.")
        // limpar();
    }
}

//selecionar tipo de empresa