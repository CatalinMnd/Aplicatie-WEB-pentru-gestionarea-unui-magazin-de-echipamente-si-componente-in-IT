<?php
session_start();
include "../components/connect.php";
$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
   header('location:admin_login.php');
}
if(isset($_POST['utilizator_nou'])){
    $name=$_POST['name'];
    $name=filter_var($name, FILTER_SANITIZE_STRING);
    $prev_name = $_POST['prev_name'];
    $prev_name=filter_var($prev_name, FILTER_SANITIZE_STRING);
    $password=$_POST['password'];
    $password=filter_var($password, FILTER_SANITIZE_STRING);
    $pass = $_POST['pass'];
    $pass = filter_var($pass, FILTER_SANITIZE_STRING);
    $cpass = $_POST['confirm_pass'];
    $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);
    if(strlen($name)<=5){
        $message[]='Numele de utilizator trebuie să fie alcatuita din 8 sau mai multe caractere';
    }elseif($prev_name==$name){
        $message[]='Numele de utilizator este neschimbat!';
    }elseif(strpos($name,' ')==true){
        $message[]='Numele de utilizator nu trebuie să conțina spații!';
    }elseif($password!=$pass){
        $message[]='Parola este incorectă';
    }elseif($pass == $cpass){
        $update_name=$conn->prepare("UPDATE `admins` SET name = ? where id = ?");
        $update_name->execute([$name,$admin_id]);
        $message[]='Datele au fost actualizate cu succes';
    }else{
        $message[]='Parolele nu sunt identice';
    }
}
if(isset($_POST['parola_noua'])){
    $prev_pass = $_POST['prev_pass'];
    $prev_pass = filter_var($prev_pass, FILTER_SANITIZE_STRING);
    $old_pass = $_POST['old_pass'];
    $old_pass = filter_var($old_pass, FILTER_SANITIZE_STRING);
    $new_pass = $_POST['new_pass'];
    $new_pass = filter_var($new_pass, FILTER_SANITIZE_STRING);
    $confirm_pass = $_POST['confirm_pass'];
    $confirm_pass = filter_var($confirm_pass, FILTER_SANITIZE_STRING);
    if($old_pass!=$prev_pass){
        $message[]='Parola veche este incorectă';
    }else if($new_pass!=$confirm_pass){
        $message[]='Parolele noi nu sunt identice';
    }elseif(strlen($new_pass)<=7){
        $message[]='Parola trebuie să fie alcatuita din 8 sau mai multe caractere';
    }elseif(!preg_match("#[0-9]+#",$new_pass)){
        $message[]='Parola trebuie să conțină macar o cifra!';
    }elseif(strpos($new_pass,' ')==true){
        $message[]='Numele de utilizator și parola nu trebuie să conțina spații!';
    }else{
        if($new_pass != $prev_pass){
            $update_pass=$conn->prepare("UPDATE `admins` SET password = ? WHERE id=?");
            $update_pass->execute([$confirm_pass,$admin_id]);
            $message[]='Datele au fost actualizate cu succes';
        }else{
            $message[]='Parola nouă este identică cu cea veche';
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
        <title>Actualizează profilul</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="../css/admin_style.css">
    </head>
<body>
    <?php include '../components/admin_header.php'?>
<!--ACTUALIZAREA PROFILULUI INCEPE-->
<section class="form-container">
    <form action="" method="POST">
        <h3>Actualizați numele de utilizator</h3>
        <input type="hidden" name="password" value="<?= $fetch_profile ['password']; ?>">
        <input type="hidden" name="prev_name" value="<?= $fetch_profile ['name']; ?>">
        <input type="text" name="name" maxlength="20" required placeholder="Numele de utilizator" class="box" oninput="this.value=this.value.replace(/\s/g,'')" value="<?=$fetch_profile['name']; ?>">
        <input type="password" name="pass" maxlength="20" required placeholder="Parola" class="box">
        <input type="password" name="confirm_pass" maxlength="20" required placeholder="Confirmați parola" class="box">
        <input type="submit" value="Actualizați acum" name="utilizator_nou" class="btn">
    </form>
    <form action="" method="POST">
        <h3>Actualizați parola</h3>
        <input type="hidden" name="prev_pass" value="<?= $fetch_profile ['password']; ?>">
        <input type="password" name="old_pass" maxlength="20" required placeholder="Parola veche" class="box">
        <input type="password" name="new_pass" maxlength="20" required placeholder="Parola nouă" class="box">
        <input type="password" name="confirm_pass" maxlength="20" required placeholder="Confirmați parola nouă" class="box">
        <input type="submit" value="Actualizați acum" name="parola_noua" class="btn">
    </form>
</section>
<!--ACTUALIZAREA PROFILULUI SE INCHEIE-->
<script src="../js/admin_script.js"></script>
</body>
</html>