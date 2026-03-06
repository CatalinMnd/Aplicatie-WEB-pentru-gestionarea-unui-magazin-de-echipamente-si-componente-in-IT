<?php
session_start();
include "../components/connect.php";
$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
   header('location:admin_login.php');
}
if(isset($_POST['submit'])){
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
     } 
    $name = $_POST['name'];
    $name = validate($name);
    $pass = $_POST['pass'];
    $pass = validate($pass);
    $cpass = $_POST['cpass'];
    $cpass = validate($cpass);

    $select_admin = $conn->prepare("SELECT * FROM `admins` WHERE name = ?");
    $select_admin->execute([$name]);
    $row = $select_admin->fetch(PDO::FETCH_ASSOC);

    if($select_admin->rowCount() > 0){
        $message[]='Numele de utilizator deja există';
    }else{
        if($pass != $cpass){
            $message[]='Parolele nu sunt identice';
        }elseif(strlen($pass)<=7){
            $message[]='Parola trebuie să fie alcatuita din 8 sau mai multe caractere';
        }elseif(strlen($name)<=5){
            $message[]='Numele de utilizator trebuie să fie alcatuita din 8 sau mai multe caractere';
        }elseif(!preg_match("#[0-9]+#",$pass)){
            $message[]='Parola trebuie să conțină macar o cifra!';
        }elseif((strpos($name,' ')==true||(strpos($pass,' ')==true))){
            $message[]='Numele de utilizator și parola nu trebuie să conțina spații!';
        }else{
            $insert_admin=$conn->prepare("INSERT INTO `admins`(name,password) VALUES(?,?)");
            $insert_admin->execute([$name,$cpass]);
            $message[]='Cont nou de administrator înregistrat cu succes';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content ="IE=edge">
        <meta name="viewport" content="width=device-width",initial-scale=1.0>
        <title>Înregistrare administrator</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="../css/admin_style.css">
    </head>
<body>
<?php include '../components/admin_header.php'?>
<!--INREGISTRAREA ADMINISTRATORULUI INCEPE-->
<section class="form-container">
    <form action="" method="POST">
        <h3>Înregistați un cont de administrator nou</h3>
        <input type="text" name="name" id="name" maxlength="20" required placeholder="Numele de utilizator" class="box">
        <input type="password" name="pass" id="pass" maxlength="20" required placeholder="Parola" class="box">
        <input type="password" name="cpass" id="cpass" maxlength="20" required placeholder="Confirmați parola" class="box">
        <input type="submit" value="Înregistrează-te acum" name="submit" class="btn">
    </form>
</section>
<!--INREGISTRAREA ADMINSTRATORULUI SE TERMINA-->
<script src="../js/admin_script.js"></script>
</body>
</html>