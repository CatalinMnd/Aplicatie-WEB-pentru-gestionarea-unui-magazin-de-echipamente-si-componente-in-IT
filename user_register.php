<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
};
if(isset($_POST['submit'])){
    $name=$_POST['name'];
    $name=filter_var($name,FILTER_SANITIZE_STRING);
    $email=$_POST['email'];
    $email=filter_var($email,FILTER_SANITIZE_STRING);
    $pass=$_POST['pass'];
    $pass=filter_var($pass,FILTER_SANITIZE_STRING);
    $cpass=$_POST['cpass'];
    $cpass=filter_Var($cpass,FILTER_SANITIZE_STRING);

    $select_user=$conn->prepare("SELECT * FROM `users` WHERE email = ?");
    $select_user->execute([$email]);
    $row=$select_user->fetch(PDO::FETCH_ASSOC);

    if($select_user->rowCount()>0){
        $message[]='E-mail-ul este deja folosit!';
    }else{
        if($pass != $cpass){
            $message[]='Parolele nu sunt identice!';
        }elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $message[] ="E-mail-ul este invalid!";
        }elseif(strlen($pass)<=7){
            $message[]='Parola trebuie să fie alcatuita din 8 sau mai multe caractere';
        }elseif(strlen($name)<=5){
            $message[]='Numele de utilizator trebuie să fie alcatuita din 8 sau mai multe caractere';
        }elseif(!preg_match("#[0-9]+#",$pass)){
            $message[]='Parola trebuie să conțină macar o cifra!';
        }elseif((strpos($name,' ')==true||(strpos($pass,' ')==true))){
            $message[]='Numele de utilizator și parola nu trebuie să conțina spații!';
        }else{
        $insert_user=$conn->prepare("INSERT INTO `users` (name,email,password) VALUES (?,?,?);");
        $insert_user->execute([$name,$email,$cpass]);
        $message[]='Cont înregistrat cu succes! Vă rugăm să vă conectați!';
    }
}
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Înregistrare utilizator</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="form-container">
    <form action="" method="POST">
        <h3>Înregistrați-vă acum</h3>
        <input type="text" required maxlength="50" name="name" placeholder="Nume de utilizator" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="email" required maxlength="50" name="email" placeholder="Adresa de e-mail" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="password" required maxlength="20" name="pass" placeholder="Parolă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="password" required maxlength="20" name="cpass" placeholder="Confirmare parolă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="submit" value="Înregistreză-te acum" class="btn" name="submit">
        <p>Deja aveți un cont?</p>
        <a href="user_login.php" class="option-btn">Conectați-va acum!</a>
    </form>
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>