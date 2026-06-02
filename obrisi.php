<?php
include "db.php";
$id = (int)$_GET['id'];

$stmt = $conn->prepare("DELETE FROM igraci WHERE ID_igrac = ?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: index.php");
exit;
?>