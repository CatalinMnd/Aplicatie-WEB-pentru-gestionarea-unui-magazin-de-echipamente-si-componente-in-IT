<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
    header('location:home.php');
}
include 'components/wishlist_cart.php';

if(isset($_POST['delete'])){
    $cart_id=$_POST['cart_id'];
    $delete_cart=$conn->prepare("DELETE FROM `cart` WHERE id = ?");
    $delete_cart->execute([$cart_id]);
    $message[]='Produs scos din coșul de cumpărături!';
}

if(isset($_GET['delete_all'])){
    $delete_all=$_GET['delete_all'];
    $delete_all_cart=$conn->prepare("DELETE FROM `cart` WHERE user_id = ?");
    $delete_all_cart->execute([$user_id]);
    header('location:cart.php');
}

if(isset($_POST['update_qty'])){
    $cart_id=$_POST['cart_id'];
    $qty=$_POST['qty'];
    $update_qty=$conn->prepare("UPDATE `cart` SET quantity = ? WHERE id = ?");
    $update_qty->execute([$qty,$cart_id]);
    $message[]='Coș de cumpărături modificat!';
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Coșul de cumpărături</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="products">
    <h1 class="heading">Coșul de cumpărături</h1>
    <div class="box-container">
        <?php
            $grand_total=0;
            $select_cart=$conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
            $select_cart->execute([$user_id]);
            if($select_cart->rowCount()>0){
                while($fetch_cart=$select_cart->fetch(PDO::FETCH_ASSOC)){
        ?>
        <form action="" method="post" class="box">

            <input type="hidden" name="cart_id" value="<?= $fetch_cart['id'] ?>">
            <a href="quick_view.php?pid=<?=$fetch_cart['pid']; ?>" class="fas fa-eye"></a>
            <img src="uploaded_img/<?= $fetch_cart['image']; ?>" class="image" alt="">
            <div class="name"><?= $fetch_cart['name']; ?></div>
            <div class="flex">
                <div class="price"><span><?= $fetch_cart['price']; ?> lei</span></div>
                <input type="number" name="qty" class="qty" min="1" max="99" value="<?= $fetch_cart['quantity']; ?>" onkeypress="if(this.value.length == 2) return false;">
                <button type="submit" class="fas fa-edit" name="update_qty"></button>
            </div>
            <div class="sub-total">Sub-total: <span><?= $sub_total=($fetch_cart['quantity']*$fetch_cart['price']);?> lei</span></div>
            <input type="submit" value="Scoate din coș" onclick="return confirm('Sunteți sigur ca doriți să scoateți produsul din coșul de cumpărături?')" name="delete" class="delete-btn">
        </form>
        <?php
            $grand_total += $sub_total;
                            }
            }else{
                echo '<p class="empty">Coșul dumneavoastră de cumpărături este gol</p>';
            }
        ?>
    </div>
    <div class="grand-total">
        <p>Preț total: <span><?= $grand_total; ?> lei</span></p>
        <a href="shop.php" class="option-btn">Continuați cumpărăturile</a>
        <a href="cart.php?delete_all" onclick="return confirm('Sunteți sigur ca doriți să scoateți toate produsule din coșul de cumpărături?')" class="delete-btn <?= ($grand_total>1)?'':'disabled';?>">Scoateți toate produsele din coș</a>
        <a href="checkout.php" class="btn <?= ($grand_total>1)?'':'disabled';?>">Completați comanda</a>
    </div>
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>