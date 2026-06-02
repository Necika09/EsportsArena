<?php
include "db.php";
$id = (int)$_GET['id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nickname = trim($_POST['nickname']);
    $rang = trim($_POST['rang']);
    $stmt = $conn->prepare("UPDATE igraci SET nickname = ?, rang = ? WHERE ID_igrac = ?");
    $stmt->bind_param("ssi", $nickname, $rang, $id);
    $stmt->execute();
    header("Location: index.php");
    exit;
}

$stmt = $conn->prepare("SELECT * FROM igraci WHERE ID_igrac = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$igrac = $stmt->get_result()->fetch_assoc();
if (!$igrac) die("Ne postoji.");
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <title>Uredi</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" type="image/x-icon" href="images/logoNew.png">
</head>
<body>
    <?php include "header.php"; ?>

    <h1>Uredi igrača #<?= $id ?></h1>
    <form method="POST">
        Nickname: <input type="text" name="nickname"
                    value="<?= htmlspecialchars($igrac['nickname']) ?>" required><br><br>
        Rang: <input type="text" name="rang"
                    value="<?= htmlspecialchars($igrac['rang']) ?>" required><br><br>
        <button type="submit">Spremi</button>
        <a href="index.php">Odustani</a>
    </form>
</body>
</html>