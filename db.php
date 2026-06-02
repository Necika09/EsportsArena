<?php
$conn = new mysqli("localhost", "root", "", "esportsarena");
if ($conn->connect_error) die("Greška: " . $conn->connect_error);
$conn->set_charset("utf8mb4");
?>