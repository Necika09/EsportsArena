<?php
include "db.php";
$greska = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Uzmi oba polja odjednom
    $nickname = trim($_POST['nickname']);
    $rang = trim($_POST['rang']);

    if ($nickname === '' || $rang === '') {
        $greska = "Sva polja su obavezna.";
    } else {
        // Jedan INSERT upit koji unosi oba podatka u isti redak
        $stmt = $conn->prepare("INSERT INTO Igraci (nickname, rang) VALUES (?, ?)");
        $stmt->bind_param("ss", $nickname, $rang);
        
        if ($stmt->execute()) {
            header("Location: index.php");
            exit;
        } else {
            $greska = "Greška pri unosu: " . $conn->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <title>Nova</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" type="image/x-icon" href="images/logoNew.png">
</head>
<body>

    <h1>Novi igrač</h1>
    <?php if ($greska): ?><p style="color:red"><?= $greska ?></p><?php endif; ?>

    <form method="POST">
        Nickname: <input type="text" name="nickname" required><br><br>
        Rang: <input type="text" name="rang" required><br><br>
        <button type="submit">Spremi</button>
        <a href="index.php">Odustani</a>
    </form>
</body>
</html>