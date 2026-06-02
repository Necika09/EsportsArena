<?php include "db.php"; ?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <title>EsportsArena</title>
    <link rel="icon" type="image/x-icon" href="images/logoNew.png">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php include "header.php"; ?>

    <h1>Popis igrača</h1>
    <a href="dodaj.php">➕ Nova stavka</a>

    <table border="1" cellpadding="8">
        <tr><th>ID</th><th>Nickname</th><th>Rang</th></tr>
    <?php
    $rez = $conn->query("SELECT * FROM igraci ORDER BY ID_igrac DESC");
    while ($r = $rez->fetch_assoc()):
    ?>
        <tr>
            <td><?= $r['ID_igrac'] ?></td>
            <td><?= htmlspecialchars($r['nickname']) ?></td>
            <td><?= htmlspecialchars($r['rang']) ?></td>
            <td>
                <a href="uredi.php?id=<?= $r['ID_igrac'] ?>">✏️</a>
                <a href="obrisi.php?id=<?= $r['ID_igrac'] ?>"
                onclick="return confirm('Obrisati?')">🗑️</a>
            </td>
        </tr>
    <?php endwhile; ?>
    </table>
</body>
</html>