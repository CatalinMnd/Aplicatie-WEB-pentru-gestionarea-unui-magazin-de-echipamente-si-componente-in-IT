<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
}
if(isset($_POST['cauta'])){
    $ord=$_POST['order'];
    $cat=$_POST['category'];
    header('location:category.php?category='.$cat.'&order='.$ord);
}
include 'components/wishlist_cart.php';
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Cumpărături</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="products">
    <h1 class="heading">Produse recente</h1>
    <span>Categorii:</span>
    <form action="" method="post" class="box">
    <select name="category" class="drop-down">
                    <?php
			        $sql="SELECT category FROM `categories` ORDER BY category";
			        $result=$conn->query($sql);
			        if($result->rowCount() > 0){
				        while($row=$result->fetch(PDO::FETCH_ASSOC)){
					        echo "<option value=\"".$row["category"]."\">".$row["category"]."</option>";
                        }

                    
                    ?>
                   <?php
                        
                    }else{
                        echo '<p class="empty">Nu a fost adaugată nicio categorie pana acum!';
                    }?> 
    </select>
    <input type="submit" value="Caută" name="cauta" class="btn">
    </form>
    <br><br>
    <div class="box-container">
        <?php
        $select_products = $conn->prepare("SELECT * FROM `products`"); 
            $select_products->execute();
            if($select_products->rowCount()>0){
                while($fetch_product=$select_products->fetch(PDO::FETCH_ASSOC)){
        ?>
        <form action="" method="post" class="box">
                <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
                <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
                <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
                <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
            <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
            <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
            <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" class="image" alt="">
            <div class="name"><?= $fetch_product['name']; ?></div>
            <div class="flex">
                <div class="price"><span></span><?= $fetch_product['price']; ?><span> lei</span></div>
                <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
            </div>
            <input type="submit" value="Adaugă în coș" class="btn" name="add_to_cart">
        </form>
        <?php
                }
            }else{
                echo '<p class="empty">Nu a fost niciun produs adăugat!</p>';
            }
        ?>
    </div>
    
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>