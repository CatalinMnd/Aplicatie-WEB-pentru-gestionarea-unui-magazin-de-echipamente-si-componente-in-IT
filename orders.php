<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
    header('location:home.php');
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Comenzi</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="show-orders">
    <h1 class="heading">Comenzile dumneavoastră</h1>
    <div class="box-container">
        <?php
            $select_orders = $conn->prepare("SELECT * FROM `orders` WHERE user_id = ?");
            $select_orders->execute([$user_id]);
            if($select_orders->rowCount() > 0){
               while($fetch_orders = $select_orders->fetch(PDO::FETCH_ASSOC)){
        ?>
        <div class="box">
            <p>Comanda a fost plasată în: <span><?= $fetch_orders['placed_on']; ?></span> </p>
            <p>Nume: <span><?= $fetch_orders['name']; ?></span> </p>
            <p>Email: <span><?= $fetch_orders['email']; ?></span> </p>
            <p>Număr de telefon: <span><?= $fetch_orders['number']; ?></span> </p>
            <p>Adresa: <span><?= $fetch_orders['adress']; ?></span> </p>
            <p>Comenzile dumneavoastră: <span><?= $fetch_orders['total_products']; ?></span> </p>
            <p>Preț total: <span><?= $fetch_orders['total_price']; ?> lei</span> </p>
            <p>Metoda plății: <span><?= $fetch_orders['method']; ?></span> </p>
            <p>Starea comenzii: <span style="color:<?php if($fetch_orders['payment_status']=='În desfașurare'){echo 'orange';}else if($fetch_orders['payment_status']=='În așteptare'){echo 'red';}else{echo 'green';} ?>"><?= $fetch_orders['payment_status']; ?></span> </p>
        </div>
        <?php
                }
            }else{
                echo '<p class="empty">Nu este nicio comandă plasată momentan!</p>';
            }
        ?>
    </div>
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>