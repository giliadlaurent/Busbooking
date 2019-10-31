<?php 
$currentuser=getLoggedMemberID();
if ($currentuser=="guest") {
  # code...redirect unauthenticated users to login
  redirect("index.php?signIn=1");
}

 ?>