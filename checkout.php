<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
    header('location:home.php');
}
if(isset($_POST['order'])){
    $name=$_POST['name'];
    $name=filter_var($name,FILTER_SANITIZE_STRING);
    $number=$_POST['number'];
    $number=filter_var($number,FILTER_SANITIZE_STRING);
    $email=$_POST['email'];
    $email=filter_var($email,FILTER_SANITIZE_STRING);
    $method=$_POST['method'];
    $method=filter_var($method,FILTER_SANITIZE_STRING);
    $adress=$_POST['flat'].', '.$_POST['city'].', '.$_POST['state'].', '.$_POST['pin_code'];
    $adress=filter_var($adress,FILTER_SANITIZE_STRING);
    $total_products=$_POST['total_products'];
    $total_products=filter_var($total_products,FILTER_SANITIZE_STRING);
    $total_price=$_POST['total_price'];
    $total_price=filter_var($total_price,FILTER_SANITIZE_STRING);

    $check_cart=$conn->prepare("SELECT * FROM `cart` WHERE user_id=?");
    $check_cart->execute([$user_id]);

    if($check_cart->rowCount()>0){
        $insert_order=$conn->prepare("INSERT INTO `orders`(user_id,name,number,email,method,adress,total_products,total_price) VALUES(?,?,?,?,?,?,?,?)");
        $insert_order->execute([$user_id,$name,$number,$email,$method,$adress,$total_products,$total_price]);
        $message[]='Comandă plasată cu succes!';
        $delete_cart=$conn->prepare("DELETE FROM `cart` WHERE user_id=?");
        $delete_cart->execute([$user_id]);
    }else{
        $message[]='Coșul dumneavoastră de cumpărături este gol!';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Plata</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>

<section class="checkout">
    <h1 class="heading">Sumar comandă<h1>
    <div class="display-orders">
        <?php
            $grand_total=0;
            $cart_items[]='';
            $select_cart=$conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
            $select_cart->execute([$user_id]);
            if($select_cart->rowCount()>0){
                while($fetch_cart=$select_cart->fetch(PDO::FETCH_ASSOC)){
                    $cart_items[] = $fetch_cart['name'].' ('.$fetch_cart['price'].' × '. $fetch_cart['quantity'].') - ';
                    $total_products = implode($cart_items);
                    $grand_total += ($fetch_cart['price'] * $fetch_cart['quantity']);
        ?>
        <p><?=$fetch_cart['name']; ?><span> <?= $fetch_cart['price'];?> lei ×<?=$fetch_cart['quantity'];?></span></p>
        <?php
                            }
            }else{
                echo '<p class="empty">Coșul dumneavoastră de cumpărături este gol</p>';
            }
        ?>
    </div>
    <p class="grand-total">Preț total: <span><?= $grand_total; ?> lei</span></p>
    <form action="" method="post">
         <h1 class="heading">Introduceți datele pentru comandă<h1>
        <input type="hidden" name="total_products" value="<?= $total_products ?>">
        <input type="hidden" name="total_price" value="<?= $grand_total ?>">
        <div class="flex">
            <div class="inputBox">
                <span>Numele dumneavoastră:</span>
                <input type="text" maxlength="40" placeholder="Introduceți numele" required class="box" name="name">
            </div>
            <div class="inputBox">
                <span>Adresa dumneavoastră de email:</span>
                <input type="text" maxlength="50" placeholder="Introduceți adresa de email" required class="box" name="email">
            </div>
            <div class="inputBox">
                <span>Numărul dumneavoastră de telefon:</span>
                <input type="number" min="0" max="9999999999" onkeypress="if(this.value.length==10) return false;" placeholder="Introduceți numărul" required class="box" name="number">
            </div>
            <div class="inputBox">
                <span>Metoda de plată:</span>
                <select name="method" class="box">
                    <option value="Plată la livrare">Plată la livrare</option>
                    <option value="Card de credit">Card de credit</option>
                    <option value="PayPal">PayPal</option>
                </select>
            </div>
            <div class="inputBox">
                <span>Orașul:</span>
                <input type="text" maxlength="40" placeholder="Introduceți orașul" required class="box" name="city">
            </div>
            <div class="inputBox">
                <span>Județul:</span>
                <input type="text" maxlength="40" placeholder="Introduceți județul" required class="box" name="state">
            </div>
            <div class="inputBox">
                <span>Adresa dumneavoastră de facturare:</span>
                <input type="text" maxlength="50" placeholder="Introduceți adresa de facturare" required class="box" name="flat">
            </div>
            <div class="inputBox">
                <span>Cod poștal:</span>
                <input type="number" min="0" max="999999" placeholder="Introduceți codul poștal" required class="box" name="pin_code" onkeypress="if(this.value.length==6) return false;">
            </div>
        </div>
        <input type="submit" value="Plasați comanda" class="btn <?= ($grand_total > 1)?'':'disabled';?>" name="order">
    </form>
</section>

<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>