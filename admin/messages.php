<?php
session_start();
include "../components/connect.php";
$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
   header('location:admin_login.php');
}
if(isset($_GET['delete'])){
    $delete_id=$_GET['delete'];
    $delete_message=$conn->prepare("DELETE FROM `messages` WHERE id=?");
    $delete_message->execute([$delete_id]);
    header('location:messages.php');
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content ="IE=edge">
        <meta name="viewport" content="width=device-width",initial-scale=1.0>
        <title>Mesaje</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="../css/admin_style.css">
    </head>
<body>
<?php include '../components/admin_header.php'?>
<section class="contacts">
    <h1 class="heading">Mesaje noi</h1>
    <div class="box-container">
    <?php
    $select_messages=$conn->prepare("SELECT * FROM `messages`");
    $select_messages->execute();
    if($select_messages->rowCount()>0){
        while($fetch_messages=$select_messages->fetch(PDO::FETCH_ASSOC)){

    ?>
    <div class="box">
        <p>ID-ul utilizatorului: <span><?=$fetch_messages['user_id']; ?></span></p>
        <p>Numele: <span><?=$fetch_messages['name']; ?></span></p>
        <p>Numarul de telefon: <span><?=$fetch_messages['number']; ?></span></p>
        <p>E-mail: <span><?=$fetch_messages['email']; ?></span></p>
        <p>Mesajul: <span><?=$fetch_messages['message']; ?></span></p>
        <a href="messages.php?delete=<?= $fetch_message['id']; ?>" onclick="return confirm('Cu siguranță doriți să ștergeți acest mesaj?');" class="delete-btn">Șterge</a>
    </div>
    </div>
    <?php
       }
    }else{
        echo '<p class="empty">Nu ai niciun mesaj</p>';
    } 
    ?>
</section>
<script src="../js/admin_script.js"></script>
</body>
</html>