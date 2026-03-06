<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
}
if(isset($_POST['name'])){
    $name=$_POST['name'];
    $name=filter_var($name,FILTER_SANITIZE_STRING);
    $email=$_POST['email'];
    $email=filter_var($email,FILTER_SANITIZE_STRING);
    $number=$_POST['number'];
    $number=filter_var($number,FILTER_SANITIZE_STRING);
    $msg=$_POST['msg'];
    $msg=filter_var($msg,FILTER_SANITIZE_STRING);

    $select_message=$conn->prepare("SELECT * FROM `messages` WHERE name = ? AND email = ? AND number = ? AND message = ?");
    $select_message->execute([$name,$email,$number,$msg]);

    if($select_message->rowCount()>0){
        $message[]='Mesajul dumneavoastră a fost trimis deja!';
    }else{
        $send_message=$conn->prepare("INSERT INTO `messages` (name,email,number,message) VALUES (?,?,?,?)");
        $send_message->execute([$name,$email,$number,$msg]);
        $message[]='Mesajul dumneavoastră a fost trimis cu succes!';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Contactați-ne</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="form-container">
    <form method="post" action="" class="box">
        <h3>Contactați-ne</h3>
        <input type="text" name="name" required placeholder="Introduceți numele dumneavoastră" maxlength="40" class="box">
        <input type="number" name="number" required placeholder="Introduceți numărul dumneavoastră de telefon" max="9999999999" min="0" class="box" onkeypress="if(this.value.length==10) return false;">
        <input type="email" name="email" required placeholder="Introduceți adresa dumneavoastră de e-mail" maxlength="50" class="box">
        <textarea name="msg" required placeholder="Introduceți mesajul" class="box" cols="30" rows="10"></textarea>
        <input type="submit" value="Trimite-ți mesajul!" class="btn" name="send">
    </form>
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>