<?php
function OpenCon()
 {
 $dbhost = "localhost";
 $dbuser = "id18008427_hams1";
 $dbpass = "p3/xS*m)S[Pl^a=s";
 $db = "id18008427_hams";
 $conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n". $conn -> error);
 return $conn;
 }
 
function CloseCon($conn)
 {
 $conn -> close();
 }
   
?>