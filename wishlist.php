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
    $wishlist_id=$_POST['wishlist_id'];
    $delete_wishlist=$conn->prepare("DELETE FROM `wishlist` WHERE id = ?");
    $delete_wishlist->execute([$wishlist_id]);
    $message[]='Produs scos din lista de dorințe!';
}

if(isset($_GET['delete_all'])){
    $delete_all=$_GET['delete_all'];
    $delete_all_wishlist=$conn->prepare("DELETE FROM `wishlist` WHERE user_id = ?");
    $delete_all_wishlist->execute([$user_id]);
    header('location:wishlist.php');
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Lista de dorințe</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="products">
    <h1 class="heading">Lista de dorințe</h1>
    <div class="box-container">
        <?php
            $grand_total=0;
            $select_wishlist=$conn->prepare("SELECT * FROM `wishlist` WHERE user_id = ?");
            $select_wishlist->execute([$user_id]);
            if($select_wishlist->rowCount()>0){
                while($fetch_wishlist=$select_wishlist->fetch(PDO::FETCH_ASSOC)){
                    $grand_total += $fetch_wishlist['price'];
        ?>
        <form action="" method="post" class="box">
            <input type="hidden" name="pid" value="<?= $fetch_wishlist['pid'] ?>">
            <input type="hidden" name="namme" value="<?= $fetch_wishlist['name'] ?>">
            <input type="hidden" name="price" value="<?= $fetch_wishlist['price'] ?>">
            <input type="hidden" name="image" value="<?= $fetch_wishlist['image'] ?>">
            <input type="hidden" name="wishlist_id" value="<?= $fetch_wishlist['id'] ?>">
            <a href="quick_view.php?pid=<?=$fetch_wishlist['pid']; ?>" class="fas fa-eye"></a>
            <img src="uploaded_img/<?= $fetch_wishlist['image']; ?>" class="image" alt="">
            <div class="name"><?= $fetch_wishlist['name']; ?></div>
            <div class="flex">
                <div class="price"><span><?= $fetch_wishlist['price']; ?> lei</span></div>
                <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
            </div>
            <input type="submit" value="Adaugă în coșul de cumpărături" name="add_to_cart" class="btn">
            <input type="submit" value="Scoate din lista de dorințe" onclick="return confirm('Sunteți sigur ca doriți să scoateți produsul din lista de dorințe?')" name="delete" class="delete-btn">
        </form>
        <?php
                            }
            }else{
                echo '<p class="empty">Lista dumneavoastră de dorințe este goală</p>';
            }
        ?>
    </div>
    <div class="grand-total">
        <p>Preț total: <span><?= $grand_total; ?> lei</span></p>
        <a href="shop.php" class="option-btn">Continuați cumpărăturile</a>
        <a href="wishlist.php?delete_all" onclick="return confirm('Sunteți sigur ca doriți să scoateți toate produsul din lista de dorințe?')" class="delete-btn <?= ($grand_total>1)?'':'disabled';?>">Scoateți toate produsele din listă</a>
    </div>
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>