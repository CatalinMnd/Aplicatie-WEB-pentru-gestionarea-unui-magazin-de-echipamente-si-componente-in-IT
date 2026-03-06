<?php
session_start();
include "../components/connect.php";
$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
   header('location:admin_login.php');
}

if(isset($_GET['delete'])){
    $delete_id=$_GET['delete'];
    if($delete_id==$admin_id){
        $message[]='Nu poți să-ți ștergi propriul cont!';
    }else{
    $delete_admin=$conn->prepare("DELETE FROM `admins` WHERE id=?");
    $delete_admin->execute([$delete_id]);
    header('location:admin_accounts.php');
    }
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content ="IE=edge">
        <meta name="viewport" content="width=device-width",initial-scale=1.0>
        <title>Conturile administratorilor</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="../css/admin_style.css">
    </head>
<body>
<?php include '../components/admin_header.php'?>
<section class="accounts">
    <h1 class="heading">Conturile administratorilor</h1>
    <div class="box-container">
        <div class="box">
            <p>Înregistrează un cont de administrator nou</p>
            <a href="register_admin.php" class="option-btn">Înregistrează</a>
        </div>
        <?php
        $select_account =$conn->prepare("SELECT * FROM `admins`");
        $select_account->execute();
        if($select_account->rowCount()>0){
            while($fetch_accounts=$select_account->fetch(PDO::FETCH_ASSOC)){
        ?>
        <div class="box">
            <p> ID-ul adminstratorului: <span><?=$fetch_accounts['id'];?></span></p>
            <p> Nume de utilizator: <span><?=$fetch_accounts['name'];?></span></p>
            <div class="flex-btn">
                <a href="admin_accounts.php?delete=<?=$fetch_accounts['id'];?>" class="delete-btn" onclick="return confirm('Cu siguranță doriți să ștergeți acest cont de administrator?');">Șterge</a>
                <?php
                if($fetch_accounts['id']==$admin_id){
                    echo '<a href="update_profile.php" class="option-btn">Actualizează</a>';
                }
                ?>
            </div>
        </div>
        <?php
            }
        }else{
            echo '<p class="empty">Nu exista niciun cont de administrator</p>';
        }
        ?>
    </div>
</section>
<script src="../js/admin_script.js"></script>
</body>
</html>