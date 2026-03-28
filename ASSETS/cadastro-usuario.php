<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <style>
        body{
            background-color: #000008;
            color:  white;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            margin-top: 100px;
        }

        .box{
            max-width: 100%;
            height: auto;
            background-color: #5949AC;
            border-radius: 20px;
            text-align: center;
        }

        .box label{
            font-size:xx-large;
        }

        .box input{
            max-width:400px;
            height: 25px;
        }

        .botao{
            background-color: #4c33c8ff;
            color: white ;
            cursor:pointer;
            border-radius:5px;
            border:none;
            max-width: 150px;
            height:25px;
            transition: background-color 0.3s;
        }

        .botao:hover{
            background-color: #7f5af0;
        }
        

    </style>
</head>
<body>
    <!-- Corrigido: action deve ser o arquivo e method o POST -->
    <form action="cadastro-usuario.php" method="POST">
        <div class="box">
            <h1>Cadastro de Usuários</h1>
       <br> <label for="nome" style="margin-left: 10px;">Nome:</label>
       <input type="text" id="nome" name="nome" placeholder="Digite seu nome de usuário" required style="border-radius: 5px; background-color:rgba(26, 26, 41, 1);; color:white;"><br>

       <br> <label for="email" style="margin-left: 10px;">E-mail:</label>
       <input type="email" id="email" name="email" placeholder="Digite seu email" required style="border-radius: 5px; background-color:rgba(26, 26, 41, 1);; color:white;"><br>

       <br> <label for="dt_nasc" style="margin-left: 10px;">Data Nascimento:</label>
       <input type="date" id="dt_nasc" name="dt_nasc" required style="border-radius: 5px; background-color:rgba(26, 26, 41, 1);; color:white;"><br>

       <br> <label for="cpf" style="margin-left: 10px;">CPF:</label>
       <input type="text" id="cpf" name="cpf" placeholder="Digite seu CPF" required style="border-radius: 5px; background-color:rgba(26, 26, 41, 1);; color:white;"><br>

       <br> <label for="senha" style="margin-left: 10px;">Senha:</label>
       <input type="password" id="senha" name="senha" placeholder="Digite sua senha" required style="border-radius: 5px; background-color:rgba(26, 26, 41, 1);; color:white;"><br><br>

       <button type="submit" name="cadastrar" class="botao">Cadastrar</button>
       </div>
    </form>

    <?php 
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        error_reporting(E_ALL ^ E_DEPRECATED);

        $id = mysql_connect("localhost", "root", "") or die("Erro na conexão");
        $con = mysql_select_db("banco_gamezone", $id) or die("Erro ao selecionar DB");

        $nome  = $_POST['nome'];
        $email = $_POST['email'];
        $dtnasc= $_POST['dt_nasc'];
        $cpf   = $_POST['cpf'];
        $senha = $_POST['senha'];
        
        $sql = "INSERT INTO usuario (USER_NAME, USER_EMAIL, USER_DTNASC, USER_CPF, USER_SENHA) 
                VALUES ('$nome','$email','$dtnasc','$cpf','$senha')";
        
        mysql_query($sql);
        mysql_close($id);

        // importante: header deve vir antes de qualquer echo
        header("Location: cadastro-usuario.php");
        exit;
    }
    ?>
</body>
</html>
