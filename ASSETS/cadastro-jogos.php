<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Jogo</title>
    <style></style>
</head>

<body>
    <h1> Cadastro Jogo</h1>
    <form action="cadastro-jogos.php" method="post" enctype="multipart/form-data">
        <br> <label for="titulo">Titulo :</label>
        <input type="text" name="GAME_TITULO" placeholder="Digite o título do Jogo" required><br>

        <br> <label for="descricao">Descrição :</label>
        <textarea name="GAME_DESCRICAO" rows="5" id="descricao" placeholder="descricao" required></textarea><br>

        <br> <label for="capa">Capa:</label>
        <input type="file" id="capa" name="GAME_CAPA_URL" accept="" required><br>

        <br> <label for="game-dev">Game Dev :</label>
        <input type="text" name="GAME_DEV" placeholder="Digite os desenvolvedores do Jogo" required><br>

        <label for="categoria">Categorias:</label><br>

        <input type="checkbox" name="CATEGORIA_ID[]" value="1"> Ação<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="2"> Casual<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="3"> Estratégia<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="4"> Esporte<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="5"> Ficção Científica<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="6"> FPS<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="7"> Hack and Slash<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="8"> Luta<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="9"> Mistério<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="10"> Mundo Aberto<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="11"> Quebra-cabeça<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="12"> RPG<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="13"> Simulador<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="14"> Sobrevivência<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="15"> Terror<br>
        <input type="checkbox" name="CATEGORIA_ID[]" value="16"> Tiro<br>

        <br> <label for="publicadora">Publicadora :</label>
        <input type="text" name="GAME_PUBLICADORA" placeholder="Digite a publicadora do Jogo" required><br>

        <br> <label for="preco">Preço :</label>
        <input type="number" name="GAME_PRECO" placeholder="Digite o preco do Jogo" required><br>

        <label for="tamanho_arquivo">Tamanho do jogo:</label>
        <input type="number" id="tamanho_arquivo" name="GAME_TAMANHO_ARQUIVO" step="0.1" min="0" placeholder="Ex: 45.5" required> GB

        <br> <label for="s-o">SO Suportados :</label>
        <input type="text" name="GAME_SO_SUPORTADOS" placeholder="Ex: Windows, Linux, MacOS" required><br>

        <br> <label for="idiomas">Idiomas Suportados :</label>
        <input type="text" name="GAME_IDIOMAS_SUPORTADOS" placeholder="Ex: Português, Inglês, Espanhol" required><br>

        <br> <label for="requisitos-minimos">Requisitos Mínimos :</label>
        <textarea name="GAME_REQUISITOS_MINIMOS" rows="4" placeholder="Ex: i5, 8GB RAM, GTX 1050" required></textarea><br>

        <br> <label for="requisitos-recomendados">Requisitos recomendados :</label>
        <textarea name="GAME_REQUISITOS_RECOMENDADOS" rows="4" placeholder="Ex: i7, 16GB RAM, RTX 2060" required></textarea><br>

        <br> <label for="status">Status</label>
        <select name="GAME_STATUS" id="status" required>
            <option value="1">🟢Disponível</option>
            <option value="0">🔴Indisponível</option> 

        </select><br>

        <button type="submit" name="cadastrar" class="botao">Cadastrar</button>


    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        error_reporting(E_ALL ^ E_DEPRECATED);

        $id = mysql_connect("localhost", "root", "") or die("Erro na conexão");
        $con = mysql_select_db("banco_gamezone", $id) or die("Erro ao selecionar DB");

        $G_titulo = $_POST['GAME_TITULO'];
        $G_descricao = $_POST['GAME_DESCRICAO'];
        $G_dev = $_POST['GAME_DEV'];
        $G_categoria = $_POST['CATEGORIA_ID'];
        $G_publicadora = $_POST['GAME_PUBLICADORA'];
        $G_preco = $_POST['GAME_PRECO'];
        $G_tamanho = $_POST['GAME_TAMANHO_ARQUIVO'];
        $G_SO = $_POST['GAME_SO_SUPORTADOS'];
        $G_idiomas = $_POST['GAME_IDIOMAS_SUPORTADOS'];
        $G_RM = $_POST['GAME_REQUISITOS_MINIMOS'];
        $G_RR = $_POST['GAME_REQUISITOS_RECOMENDADOS'];
        $G_status = $_POST['GAME_STATUS'];
        

        $capa_nome = $_FILES['GAME_CAPA_URL']['name'];
        $capa_tmp  = $_FILES['GAME_CAPA_URL']['tmp_name'];
        $destino   = "upload/" . basename($capa_nome);
        move_uploaded_file($capa_tmp, $destino);


        $sql = "INSERT INTO jogos (
        GAME_TITULO, GAME_DESCRICAO, GAME_CAPA_URL, GAME_DEV, GAME_PUBLICADORA, GAME_PRECO, GAME_TAMANHO_ARQUIVO, GAME_SO_SUPORTADOS, 
        GAME_IDIOMAS_SUPORTADOS, GAME_REQUISITOS_MINIMOS, GAME_REQUISITOS_RECOMENDADOS, GAME_STATUS)
        VALUES ('$G_titulo', '$G_descricao','$destino', '$G_dev', '$G_publicadora', '$G_preco', '$G_tamanho', '$G_SO',
        '$G_idiomas','$G_RM','$G_RR','$G_status')";

        mysql_query($sql);

        $id_jogo = mysql_insert_id(); // pega o ID do jogo recém-inserido
        if (!empty($G_categoria)) {
            foreach ($G_categoria as $categoria_id) {
            $sql_categoria = "INSERT INTO jogo_categorias (GAME_ID, CATEGORIA_ID)
            VALUES ('$id_jogo', '$categoria_id')";
            mysql_query($sql_categoria);
    }
}
        
        mysql_close($id);
        header("Location: cadastro-jogos.php");
        exit;

}
    ?>
</body>

</html>