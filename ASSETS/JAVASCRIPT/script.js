// Aguarda o carregamento completo do DOM
document.addEventListener('DOMContentLoaded', function() {
    // Código JavaScript para funcionalidades futuras
    
    // Exemplo: Adicionar evento de clique aos botões de compra
    const buyButtons = document.querySelectorAll('.buy-button');
    buyButtons.forEach(button => {
        button.addEventListener('click', function() {
            alert('Produto adicionado ao carrinho!');
        });
    });
    
    // Exemplo: Pesquisa em tempo real
    const searchInput = document.querySelector('#search-form input');
    if (searchInput) {
        searchInput.addEventListener('input', function() {
            console.log('Pesquisando por:', this.value);
            // Aqui você pode implementar a lógica de filtragem
        });
    }
    
    console.log('GameZone carregado com sucesso!');
});
