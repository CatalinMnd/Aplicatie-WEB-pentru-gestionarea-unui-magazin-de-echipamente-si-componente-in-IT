<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
    header('location:home.php');
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
        $update_name=$conn->prepare("UPDATE `users` SET name = ? where id = ?");
        $update_name->execute([$name,$user_id]);
        $message[]='Datele au fost actualizate cu succes';
    }else{
        $message[]='Parolele nu sunt identice';
    }
}
if(isset($_POST['email_nou'])){
    $email=$_POST['email'];
    $email=filter_var($email, FILTER_SANITIZE_STRING);
    $prev_email = $_POST['prev_email'];
    $prev_email=filter_var($prev_email, FILTER_SANITIZE_STRING);
    $password=$_POST['password'];
    $password=filter_var($password, FILTER_SANITIZE_STRING);
    $pass = $_POST['pass'];
    $pass = filter_var($pass, FILTER_SANITIZE_STRING);
    $cpass = $_POST['confirm_pass'];
    $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);
    if(strlen($email)<=5){
        $message[]='Email-ul trebuie să fie alcatuita din 8 sau mai multe caractere';
    }elseif($prev_email==$email){
        $message[]='Email-ul este neschimbat!';
    }elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $message[] ="E-mail-ul este invalid!";
    }elseif($password!=$pass){
        $message[]='Parola este incorectă';
    }elseif($pass == $cpass){
        $update_email=$conn->prepare("UPDATE `users` SET email = ? where id = ?");
        $update_email->execute([$email,$user_id]);
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
            $update_pass=$conn->prepare("UPDATE `users` SET password = ? WHERE id=?");
            $update_pass->execute([$confirm_pass,$user_id]);
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
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Actualizare date</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="form-container">
    <form action="" method="POST">
        <h3>Actualizați-vă numele de utilizator</h3>
        <input type="hidden" name="prev_name" value="<?= $fetch_profile ['name']; ?>">
        <input type="hidden" name="password" value="<?= $fetch_profile ['password']; ?>">
        <input type="text" required maxlength="50" name="name" placeholder="Nume de utilizator" class="box" oninput="this.value=this.value.replace(/\s/g, '')" value="<?= $fetch_profile['name']; ?>">
        <input type="password" maxlength="20" name="pass" placeholder="Parolă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="password" maxlength="20" name="confirm_pass" placeholder="Confirmare parolă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="submit" value="Actualizați acum" class="btn" name="utilizator_nou">
    </form>
</section>
<section class="form-container">
    <form action="" method="POST">
        <h3>Actualizați-vă email-ul</h3>
        <input type="hidden" name="prev_email" value="<?= $fetch_profile ['email']; ?>">
        <input type="hidden" name="password" value="<?= $fetch_profile ['password']; ?>">
        <input type="email" required maxlength="50" name="email" placeholder="Adresa de e-mail" class="box" oninput="this.value=this.value.replace(/\s/g, '')" value="<?= $fetch_profile['email']; ?>">
        <input type="password" maxlength="20" name="pass" placeholder="Parolă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="password" maxlength="20" name="confirm_pass" placeholder="Confirmare parolă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="submit" value="Actualizați acum" class="btn" name="email_nou">
    </form>
</section>
<section class="form-container">
    <form action="" method="POST">
        <h3>Actualizați-vă parola</h3>
        <input type="hidden" name="prev_pass" value="<?= $fetch_profile ['password']; ?>">
        <input type="password" maxlength="20" name="old_pass" placeholder="Parolă veche" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="password" maxlength="20" name="new_pass" placeholder="Parolă nouă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="password" maxlength="20" name="confirm_pass" placeholder="Confirmare parolă nouă" class="box" oninput="this.value=this.value.replace(/\s/g, '')">
        <input type="submit" value="Actualizați acum" class="btn" name="parola_noua">
    </form>
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>