<?php
session_start();
include "../components/connect.php";
if(isset($_POST['submit'])){
    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
     } 
    $name = $_POST['name'];
    $name = validate($name);
    $pass = $_POST['pass'];
    $pass = validate($pass);

    $select_admin = $conn->prepare("SELECT * FROM `admins` WHERE name = ? AND password = ?");
    $select_admin->execute([$name, $pass]);
    $row = $select_admin->fetch(PDO::FETCH_ASSOC);

    if($select_admin->rowCount() > 0){
        $_SESSION['admin_id'] = $row['id'];
        header('location:dashboard.php');
    }else{
        $message[]='Nume de utilizator sau parolă incorectă';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content ="IE=edge">
        <meta name="viewport" content="width=device-width",initial-scale=1.0>
        <title>Logare</title>
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="../css/admin_style.css">
    </head>
<body>

<?php
   if(isset($message)){
    foreach($message as $message){
       echo '
       <div class="message">
          <span>'.$message.'</span>
          <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
       </div>
       ';
    }
 }
?>

<!-- ADMIN LOGIN -->

<section class="form-container">
    <form action="" method="POST">
        <h3>Conectează-te</h3>
        <input type="text" name="name" id="name" maxlength="20" required placeholder="Numele de utilizator" class="box">
        <input type="password" name="pass" id="pass" maxlength="20" required placeholder="Parola" class="box">
        <input type="submit" value="Conectează-te acum" name="submit" class="btn">
    </form>
</section>
</body>
</html>