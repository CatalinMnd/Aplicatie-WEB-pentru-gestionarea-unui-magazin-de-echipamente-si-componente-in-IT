<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
    $user_id=$_SESSION['user_id'];
}else{
    $user_id='';
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=devide-width, initial-scale=0.1">
        <title>Despre noi</title>
        <!--SWIPER-->
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
        <!--FONT AWESOME CDN LINK PENTRU ICONITE-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
        <!--STIL CSS-->
        <link rel ="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="about">
    <div class="row">
        <div class="image">
            <img src="images/about-img.svg" alt="">
        </div>
        <div class="content">
            <h3>De ce să ne alegi pe noi?</h3>
            <p>Magazinul IT este o locație specializată în vânzarea de echipamente și componente din domeniul IT, care poate oferi o gamă largă de produse, inclusiv componente de calculator, laptop-uri, imprimante, periferice, software și servicii IT. Oferind produse de calitate superioară de la producători reputați din industria IT, precum și consultanță și suport tehnic din partea personalului specializat, magazinul IT poate fi o opțiune convenabilă și avantajoasă pentru cei care au nevoie de echipamente și componente IT. De asemenea, magazinul IT poate oferi garanție și prețuri competitive pentru produsele comercializate, făcându-l o alegere populară printre cei care caută să-și procure echipamente și componente IT.
</p>
            <a href="contact.php" class="btn">Contactează-ne</a>
        </div>
    </div>
</section>
<section class="reviews">
    <h1 class="heading">
        <div class="swiper reviews-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide slide">
                    <img src="images/pic-1.png" alt="">
                    <p>Am fost impresionat de varietatea de produse pe care le oferă Magazinul IT. Personalul a fost foarte amabil și mi-a oferit sfaturi utile în alegerea unui laptop potrivit nevoilor mele. În cele din urmă, am cumpărat un laptop de calitate superioară la un preț competitiv.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>Alex Chiriță</h3>
                </div>
                <div class="swiper-slide slide">
                    <img src="images/pic-2.png" alt="">
                    <p>Am avut o experiență excelentă la Magazinul IT. Personalul a fost foarte informat și mi-a oferit consultanță de încredere în alegerea componentelor de calculator potrivite nevoilor mele. Produsele pe care le-am cumpărat sunt de calitate superioară și au funcționat excelent de la prima pornire.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>Maria Preda</h3>
                </div>
                <div class="swiper-slide slide">
                    <img src="images/pic-3.png" alt="">
                    <p>Am avut nevoie de o imprimantă pentru biroul meu de acasă și am găsit exact ce căutam la Magazinul IT. Am primit sfaturi utile din partea personalului despre opțiunile disponibile și am ales o imprimantă de calitate superioară la un preț accesibil. Am fost impresionat de promptitudinea livrării și de serviciul clienți excelent.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>Andrei Daniș</h3>
                </div>
                <div class="swiper-slide slide">
                    <img src="images/pic-4.png" alt="">
                    <p>Am cumpărat un laptop de la Magazinul IT și am fost foarte mulțumită de calitatea produsului și de serviciul oferit de personal. În plus, am primit garanție și suport tehnic, care mi-au dat încredere în achiziția pe care am făcut-o. Recomand cu încredere Magazinul IT tuturor celor care caută produse de calitate și servicii excelente.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>Elena Lazăr</h3>
                </div>
                <div class="swiper-slide slide">
                    <img src="images/pic-5.png" alt="">
                    <p>Am avut o experiență fantastică la Magazinul IT. Personalul a fost foarte amabil și mi-a oferit sfaturi utile în alegerea unui router potrivit pentru nevoile mele. Am fost impresionat de varietatea de produse și de prețurile competitive. În cele din urmă, am cumpărat un router excelent la un preț accesibil.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>Ion Brailescu</h3>
                </div>
                <div class="swiper-slide slide">
                    <img src="images/pic-6.png" alt="">
                    <p>Am cumpărat un software de la Magazinul IT și am fost foarte mulțumită de serviciul clienți excelent. Personalul a fost foarte informat și mi-a oferit sfaturi utile în alegerea software-ului potrivit nevoilor mele. În plus, am primit o licență legitimă și suport tehnic gratuit. Voi continua să cumpăr de la Magazinul IT în viitor.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <h3>Ana Necula</h3>
                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </h1>
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script>
var swiper = new Swiper(".reviews-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      550: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
   },
});
</script>
</body>
</html>