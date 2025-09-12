window.addEventListener('DOMContentLoaded', () => {
    // Abrir modal de login
    if(document.querySelector('#btn-entrar')){
        document.querySelector('#btn-entrar').addEventListener('click', () => {
            $('#modal-login').modal({
                showClose: false,
                clickClose: false,
            });
        });
    }
    
    // Redirecionar para página de cadastro
    if(document.querySelector('#bt-modal-nova-cnta')){
        document.querySelector('#bt-modal-nova-cnta').addEventListener('click', () => {
            // Fechar o modal de login
            $.modal.close();
            // Aqui você pode redirecionar para a página de cadastro ou abrir um modal de cadastro
            // window.location.href = "cad.html";
            alert("Redirecionando para a página de cadastro...");
        });
    }
    
    // Processar login
    if(document.querySelector('#btn-login')){
        document.querySelector('#btn-login').addEventListener('click', () => {
            const email = document.querySelector('#email').value;
            const senha = document.querySelector('#senha').value;
            
            // Validação básica
            if(!email || !senha) {
                alert("Por favor, preencha todos os campos.");
                return;
            }
            
            // Validação de email
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if(!emailRegex.test(email)) {
                alert("Por favor, insira um e-mail válido.");
                return;
            }
            
            // Simulação de login bem-sucedido
            // Em um cenário real, você faria uma requisição para o servidor aqui
            alert("Login realizado com sucesso!");
            $.modal.close();
            
            // Atualizar interface para usuário logado
            document.querySelector('#btn-entrar').textContent = "MINHA CONTA";
        });
    }
    
    // Fechar modal com ESC
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            $.modal.close();
        }
    });
    
    // Fechar modal clicando fora dele
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('modal')) {
            $.modal.close();
        }
    });
});