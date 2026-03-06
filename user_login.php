<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
};
if(isset($_POST['submit'])){
    $email=$_POST['email'];
    $email=filter_var($email,FILTER_SANITIZE_STRING);
    $pass=$_POST['pass'];
    $pass=filter_var($pass,FILTER_SANITIZE_STRING);

    $select_user=$conn->prepare("SELECT * FROM `users` WHERE email = ? AND password = ?");
    $select_user->execute([$email,$pass]);
    $row=$select_user->fetch(PDO::FETCH_ASSOC);

    if($select_user->rowCount()>0){
        $_SESSION['user_id']=$row['id'];
        header('location:home.php');
    }else{
        $message[]='E-mail sau parolă greșită!';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Conectare utilizator</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>

<section class="form-container">
    <form action="" method="POST">
        <h3>Conectați-vă acum</h3>
        <input type="email" required maxlength="50" name="email" placeholder="Adresă de e-mail" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="password" required maxlength="20" name="pass" placeholder="Parolă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="submit" value="Conectează-te acum" class="btn" name="submit">
        <p>Nu aveți un cont?</p>
        <a href="user_register.php" class="option-btn">Înregistrați-va acum!</a>
    </form>
</section>

<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>