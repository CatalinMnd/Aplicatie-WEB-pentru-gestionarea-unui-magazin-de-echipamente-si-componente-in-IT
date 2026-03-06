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

<header class="header">
    <section class="flex">
        <a href="dashboard.php" class="logo">Panoul<span> administratorului</span></a>
        <nav class="navbar">
            <a href="dashboard.php">Bordul administratorului</a>
            <a href="products.php">Produse</a>
            <a href="placed_orders.php">Comenzi</a>
            <a href="admin_accounts.php">Conturile administratorilor</a>
            <a href="users_accounts.php">Conturile clienților</a>
            <a href="messages.php">Mesaje</a>
        </nav>
        <div class="icons">
        <div id="menu-btn" class="fas fa-bars"></div>
        <div id="user-btn" class="fas fa-user"></div>
        </div>
        <div class="profile">
        <?php
        $select_profile=$conn->prepare("SELECT * FROM `admins` where id=?");
        $select_profile->execute([$admin_id]);
        $fetch_profile=$select_profile->fetch(PDO::FETCH_ASSOC);
        ?>
        <p><?=$fetch_profile['name'];?></p>
        <a href="update_profile.php" class="btn">Actualizează profilul</a>
        <a href="../components/admin_logout.php" onclick="return confirm('Sunteți sigur ca doriți să vă deconectați?')" class="delete-btn">Deconectează-te</a>
        </div>
    </section>
</header>
