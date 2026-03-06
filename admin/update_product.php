<?php
session_start();
include "../components/connect.php";
$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
   header('location:admin_login.php');
};
if(isset($_POST['update'])){
    $pid=$_POST['pid'];
    $name=$_POST['name'];
    $name=filter_var($name,FILTER_SANITIZE_STRING);
    $price=$_POST['price'];
    $price=filter_var($price,FILTER_SANITIZE_STRING);
    $details=$_POST['details'];
    $details=filter_var($details,FILTER_SANITIZE_STRING);
    $category=$_POST['category'];
    $category=filter_var($category,FILTER_SANITIZE_STRING);

    $update_product=$conn->prepare("UPDATE `products` SET name=?, details=?, price=?, category=? WHERE id=?");
    $update_product->execute([$name,$details,$price,$category,$pid]);

    $message[]='Produsul a fost actualizat cu succes';

    $old_image_01=$_POST['old_image_01'];
    $image_01=$_FILES['image_01']['name'];
    $image_01=filter_var($image_01,FILTER_SANITIZE_STRING);
    $image_01_size=$_FILES['image_01']['size'];
    $image_01_tmp_name=$_FILES['image_01']['tmp_name'];
    $image_01_folder='../uploaded_img/'.$image_01;

    if(!empty($image_01)){
        if($image_01_size>2000000){
            $message[]='Dimensiunea imaginei 1 este prea mare';
        }else{
            $update_image_01=$conn->prepare("UPDATE `products` SET image_01=? where id=?");
            $update_image_01->execute([$image_01,$pid]);
            move_uploaded_file($image_01_tmp_name,$image_01_folder);
            unlink('../uploaded_img/'.$old_image_01);
            $message[]='Imaginea 1 a fost actualizata cu succes!';
        }
    }

    $old_image_02=$_POST['old_image_02'];
    $image_02=$_FILES['image_02']['name'];
    $image_02=filter_var($image_02,FILTER_SANITIZE_STRING);
    $image_02_size=$_FILES['image_02']['size'];
    $image_02_tmp_name=$_FILES['image_02']['tmp_name'];
    $image_02_folder='../uploaded_img/'.$image_02;

    if(!empty($image_02)){
        if($image_02_size>2000000){
            $message[]='Dimensiunea imaginei 2 este prea mare';
        }else{
            $update_image_02=$conn->prepare("UPDATE `products` SET image_02=? where id=?");
            $update_image_02->execute([$image_02,$pid]);
            move_uploaded_file($image_02_tmp_name,$image_02_folder);
            unlink('../uploaded_img/'.$old_image_02);
            $message[]='Imaginea 2 a fost actualizata cu succes!';
        }
    }

    $old_image_03=$_POST['old_image_03'];
    $image_03=$_FILES['image_03']['name'];
    $image_03=filter_var($image_03,FILTER_SANITIZE_STRING);
    $image_03_size=$_FILES['image_03']['size'];
    $image_03_tmp_name=$_FILES['image_03']['tmp_name'];
    $image_03_folder='../uploaded_img/'.$image_03;
    
    if(!empty($image_03)){
        if($image_03_size>2000000){
            $message[]='Dimensiunea imaginei 3 este prea mare';
        }else{
            $update_image_03=$conn->prepare("UPDATE `products` SET image_03=? where id=?");
            $update_image_03->execute([$image_03,$pid]);
            move_uploaded_file($image_03_tmp_name,$image_03_folder);
            unlink('../uploaded_img/'.$old_image_03);
            $message[]='Imaginea 3 a fost actualizata cu succes!';
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
        <title>Actualizează produsul</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="../css/admin_style.css">
    </head>
<body>

<?php include '../components/admin_header.php'?>
<section class="update-product">
    <h1 class="heading">Actualizează produsul</h1>
    <?php
        $update_id=$_GET['update'];
        $show_products=$conn->prepare("SELECT * FROM `products` WHERE id=?");
        $show_products->execute([$update_id]);
        if($show_products->rowCount()>0){
            while($fetch_products=$show_products->fetch(PDO::FETCH_ASSOC)){
    ?>
    <form action="" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="pid" value="<?=$fetch_products['id']; ?>">
        <input type="hidden" name="old_image_01" value="<?=$fetch_products['image_01']; ?>">
        <input type="hidden" name="old_image_02" value="<?=$fetch_products['image_02']; ?>">
        <input type="hidden" name="old_image_03" value="<?=$fetch_products['image_03']; ?>">
        <div class="image-container">
         <div class="main-image">
            <img src="../uploaded_img/<?= $fetch_products['image_01']; ?>" alt="">
         </div>
         <div class="sub-image">
            <img src="../uploaded_img/<?= $fetch_products['image_01']; ?>" alt="">
            <img src="../uploaded_img/<?= $fetch_products['image_02']; ?>" alt="">
            <img src="../uploaded_img/<?= $fetch_products['image_03']; ?>" alt="">
         </div>
      </div>
            <span>Actualizează numele</span>
            <input type="text" required placeholder="Introduceți numele" name="name" maxlength="100" class="box" value="<?=$fetch_products['name'];?>">
            <span>Actualizează prețul</span>
            <input type="number" min="0" max="9999999" required placeholder="Introduceți prețul" name="price" onkeypress="if(this.value.length == 7) return false" class="box" value="<?=$fetch_products['price'];?>">
            <span>Actualizează descrierea</span>
            <textarea name="details" class="box" placeholder="Introduceți detaliile" required maxlength="500" cols="30" rows="10" ><?=$fetch_products['details'];?></textarea>
            <span>Actualizează categoria</span>
            <select name="category" class="drop-down">
                <option><?=$fetch_products['category'];?></option>
                <?php
			        $sql="SELECT category FROM `categories` ORDER BY category";
			        $result=$conn->query($sql);
			        if($result->rowCount() > 0){
				        while($row=$result->fetch(PDO::FETCH_ASSOC)){
					        echo "<option value=\"".$row["category"]."\">".$row["category"]."</option>";
                        }
                        
                ?>
            </select>
            <span>Actualizează imaginea 1</span>
            <input type="file" name="image_01" class="box" accept="image/jpg, image/jpeg, image/png, image/webp">
            <span>Actualizează imaginea 2</span>
            <input type="file" name="image_02" class="box" accept="image/jpg, image/jpeg, image/png, image/webp">
            <span>Actualizează imaginea 3</span>
            <input type="file" name="image_03" class="box" accept="image/jpg, image/jpeg, image/png, image/webp">
            <div class="flex-btn">
                <input type="submit" value="Actualizează produsul" class="btn" name="update">
                <a href="products.php" class="option-btn">Înapoi</a>
            </div>
            <?php
                    }else{
                        echo "<option>Trebuie să adaugi cel puțin o categorie prima data!</option>";
                    }?>
   </form>
    <?php
            }
        }else{
            echo '<p class="empty">Nu a fost adaugat niciun produs pana acum!';
        }
    ?>
</section>
<script src="../js/admin_script.js"></script>
</body>
</html>