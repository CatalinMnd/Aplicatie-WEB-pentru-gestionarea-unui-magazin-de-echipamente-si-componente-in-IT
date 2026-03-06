<?php
$category=$_POST['category'];
$category=filter_var($category,FILTER_SANITIZE_STRING);
session_start();
include '../components/connect.php';
$admin_id = $_SESSION['admin_id'];
if(!isset($admin_id)){
   header('location:admin_login.php');
};
$delete_category=$conn->prepare("DELETE FROM `categories` WHERE category = ?");
$delete_category->execute([$category]);
$update_category=$conn->prepare("UPDATE `products` SET `category`='Nedefinită' WHERE category=?");
$update_category->execute([$category]);
header('location:categories.php');
?>