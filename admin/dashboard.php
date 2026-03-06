<?php
session_start();
include "../components/connect.php";
$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
   header('location:admin_login.php');
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content ="IE=edge">
        <meta name="viewport" content="width=device-width",initial-scale=1.0>
        <title>Bordul administratorului</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="../css/admin_style.css">
    </head>
<body>

<?php include '../components/admin_header.php'?>
<section class="dashboard">
<h1 class="heading">Bordul administratorului</h1>
<div class="box1">
<h3>Bine ai venit, <p1><?= $fetch_profile['name']; ?></p1>!</h3>
</div>
<div class="box-container">
    <div class="box">
        <?php
           $total_pendings=0;
           $select_pendings=$conn->prepare("SELECT * FROM `orders` where payment_status=?");
           $select_pendings->execute(['În desfașurare']);
           while($fetch_pendings=$select_pendings->fetch(PDO::FETCH_ASSOC)){
            $total_pendings+=$fetch_pendings['total_price'];
           }
        ?>
        <h3><?=$total_pendings; ?><span> lei/-</span></h3>
        <p>Comenzi în așteptare</p>
        <a href="placed_orders.php" class="btn">Afișează comenzile</a>
    </div>
    <div class="box">
        <?php
           $total_completes=0;
           $select_completes=$conn->prepare("SELECT * FROM `orders` where payment_status=?");
           $select_completes->execute(['Finalizată']);
           while($fetch_completes=$select_completes->fetch(PDO::FETCH_ASSOC)){
            $total_completes+=$fetch_completes['total_price'];
           }
        ?>
        <h3><?=$total_completes; ?><span> lei/-</span></h3>
        <p>Comenzi finalizate</p>
        <a href="placed_orders.php" class="btn">Afișează comenzile</a>
    </div>
    <div class="box">
        <?php
            $select_orders=$conn->prepare("SELECT * FROM `orders`");
            $select_orders->execute();
            $numbers_of_orders=$select_orders->rowCount();
        ?>
        <h3><?=$numbers_of_orders; ?></h3>
        <p>Totalul comenzilor</p>
        <a href="placed_orders.php" class="btn">Afișează comenzile</a>
    </div>
    <div class="box">
        <?php
            $select_products=$conn->prepare("SELECT * FROM `products`");
            $select_products->execute();
            $numbers_of_products=$select_products->rowCount();
        ?>
        <h3><?=$numbers_of_products; ?></h3>
        <p>Produse adaugate</p>
        <a href="products.php" class="btn">Afișează produsele</a>
    </div>
    <div class="box">
        <?php
            $select_categories=$conn->prepare("SELECT * FROM `categories`");
            $select_categories->execute();
            $numbers_of_categories=$select_categories->rowCount();
        ?>
        <h3><?=$numbers_of_categories; ?></h3>
        <p>Totalul categoriilor</p>
        <a href="categories.php" class="btn">Afișează cateogriile</a>
    </div>
    <div class="box">
        <?php
            $select_users=$conn->prepare("SELECT * FROM `users`");
            $select_users->execute();
            $numbers_of_users=$select_users->rowCount();
        ?>
        <h3><?=$numbers_of_users; ?></h3>
        <p>Conturile clienților</p>
        <a href="users_accounts.php" class="btn">Afișează conturile</a>
    </div>
    <div class="box">
        <?php
            $select_admins=$conn->prepare("SELECT * FROM `admins`");
            $select_admins->execute();
            $numbers_of_admins=$select_admins->rowCount();
        ?>
        <h3><?=$numbers_of_admins; ?></h3>
        <p>Conturile administratorilor</p>
        <a href="admin_accounts.php" class="btn">Afișează conturile</a>
    </div>
    <div class="box">
        <?php
            $select_messages=$conn->prepare("SELECT * FROM `messages`");
            $select_messages->execute();
            $numbers_of_messages=$select_messages->rowCount();
        ?>
        <h3><?=$numbers_of_messages; ?></h3>
        <p>Mesaje noi</p>
        <a href="messages.php" class="btn">Afișează mesajele</a>
    </div>
</div>
</section>

<script src="../js/admin_script.js"></script>
</body>
</html>