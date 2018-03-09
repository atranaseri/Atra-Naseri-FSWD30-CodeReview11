<?php
 session_start();
 if (isset($_GET['logout'])) {
  unset($_SESSION['id']);
  unset($_SESSION['email']);
  unset($_SESSION['password']);
  session_unset();
  session_destroy();
  
   header('Location: index.php');
 }
 ?>