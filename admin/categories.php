<?php
session_start();
include '../components/connect.php';
$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
   header('location:admin_login.php');
};
if(isset($_POST['add_category'])){
    $category=$_POST['category'];
    $category=filter_var($category,FILTER_SANITIZE_STRING);
    $select_categories=$conn->prepare("SELECT * FROM `categories` WHERE category = ?");
    $select_categories->execute([$category]);
    if($select_categories->rowCount()>0){
        $message[]='Această categorie de produes există deja!';
    }else{
            $insert_categories = $conn->prepare("INSERT INTO `categories`(category) VALUES(?)");
            $insert_categories->execute([$category]);
            $message[]='Categorie de produse adăugată cu succes!';
    }
}
if(isset($_POST['update_category'])){
    $old_category=$_POST['old_category'];
    $old_category=filter_var($old_category,FILTER_SANITIZE_STRING);
    $new_category=$_POST['new_category'];
    $new_category=filter_var($new_category,FILTER_SANITIZE_STRING);
    $update_category=$conn->prepare("UPDATE `categories` SET category=? WHERE category=?");
    $update_category->execute([$new_category,$old_category]);
    $update_products=$conn->prepare("UPDATE `products` SET category=? WHERE category=?");
    $update_products->execute([$new_category,$old_category]);
    $message[]='Categoria de produse a fost actualizată cu succes';
}
if(isset($_GET['delete'])){
    $category=$_POST['category'];
    $category=filter_var($category,FILTER_SANITIZE_STRING);
    $delete_category=$conn->prepare("DELETE FROM `categories` WHERE category = ?");
    $delete_category->execute([$category]);
    $update_category=$conn->prepare("UPDATE `products` SET category=Nedefinită WHERE category=?");
    $update_category->execute([$category]);
    header('location:categories.php');
    //$message[]='Categoria de produse a fost ștearsă cu succes';
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content ="IE=edge">
        <meta name="viewport" content="width=device-width",initial-scale=1.0>
        <title>Categorii de produse</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="../css/admin_style.css">
    </head>
<body>
<?php include '../components/admin_header.php'?>
<h1 class="heading">Categorii de produse:</h1>
<section class="add-products">
    <form action="" method="POST" enctype="multipart/form-data">
        <div class="flex">
            <div class="inputBox">
                <span>Categorie nouă de produse</span>
                <input type="text" required placeholder="Introduceți categoria de produse" name="category" maxlength="40" class="box">
                <input type="submit" value="Adăugați categoria de produse" name="add_category" class="btn">
            </div>
        </div>
    </form>
</section>
<section class="add-products">
    <form action="" method="POST">
        <div class="flex">
            <div class="inputBox">
                <span>Actualizare categorie de produse</span>
                <select name="old_category" class="drop-down">
                    <?php
			        $sql="SELECT category FROM `categories` ORDER BY category";
			        $result=$conn->query($sql);
			        if($result->rowCount() > 0){
				        while($row=$result->fetch(PDO::FETCH_ASSOC)){
					        echo "<option value=\"".$row["category"]."\">".$row["category"]."</option>";
                        }
                    ?>
                    
                </select>
                <input type="text" required placeholder="Introduceți categoria de produse actualizată" name="new_category" maxlength="40" class="box">
                <input type="submit" value="Actualizați categoria de produse" name="update_category" class="btn">
            </div>
        </div>
    </form>
    <?php
                        
                    }else{
                        echo '<p class="empty">Nu a fost adaugată nicio categorie pana acum!';
                    }?>
</section>
<section class="add-products">
    <form action="delete_category.php" method="POST">
        <div class="flex">
            <div class="inputBox">
                <span>Ștergere categorie de produse</span>
                <select name="category" class="drop-down">
                    <?php
			        $sql="SELECT category FROM `categories` ORDER BY category";
			        $result=$conn->query($sql);
			        if($result->rowCount() > 0){
				        while($row=$result->fetch(PDO::FETCH_ASSOC)){
					        echo "<option value=\"".$row["category"]."\">".$row["category"]."</option>";
                        }
                            ?>
                </select>
                <input type="submit" value="Șterge" name="delete_category" class="btn" onclick="return confirm('Cu siguranță doriți să ștergeți această categorie de produse? Produsele cu categoria repsectivă vor avea categoria nedefinită și vor trebui actualizate.');">
            </div>
        </div>
    </form>
    <?php
                        
                    }else{
                        echo '<p class="empty">Nu a fost adaugată nicio categorie pana acum!';
                    }?>
</section>
<script src="../js/admin_script.js"></script>
</body>
</html>