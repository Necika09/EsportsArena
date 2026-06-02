<?php
include "db.php";

// Provjera ID-a
if (!isset($_GET['id'])) {
    die("Nije zadan ID za uređivanje.");
}
$id = (int)$_GET['id'];

// AŽURIRANJE (UPDATE)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $conn->prepare("UPDATE statistika_igraca SET mec_ID = ?, igrac_ID = ?, kills = ?, deaths = ?, assists = ?, damage = ? WHERE ID_stat = ?");
    $stmt->bind_param("iiiiiii", $_POST['mec_ID'], $_POST['igrac_ID'], $_POST['kills'], $_POST['deaths'], $_POST['assists'], $_POST['damage'], $id);
    $stmt->execute();
    header("Location: statistika.php");
    exit;
}

// DOHVAĆANJE PODATAKA
$result = $conn->query("SELECT * FROM statistika_igraca WHERE ID_stat = $id");
$stat = $result->fetch_assoc();
if (!$stat) die("Zapis ne postoji.");
?>

<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Uredi Statistiku</title>
    <link rel="icon" type="image/x-icon" href="images/logoNew.png">

</head>
<body>
    <?php include "header.php"; ?>

    <h1>Uredi statistiku #<?= $id ?></h1>
    
    <form method="POST">
        <label>Igrač:</label><br>
        <select name="igrac_ID">
            <?php
            $igraci = $conn->query("SELECT * FROM igraci");
            while($i = $igraci->fetch_assoc()) {
                $sel = ($i['ID_igrac'] == $stat['igrac_ID']) ? "selected" : "";
                echo "<option value='".$i['ID_igrac']."' $sel>".$i['nickname']."</option>";
            }
            ?>
        </select><br><br>

        <label>Meč (Turnir: Tim 1 vs Tim 2):</label><br>
        <select name="mec_ID">
            <?php
            // Isti upit kao u statistika.php za preglednost
            $mecevi = $conn->query("SELECT m.ID_mec, t.naziv AS turnir, tim1.naziv AS tim1, tim2.naziv AS tim2 
                                    FROM mecevi m 
                                    JOIN turniri t ON m.turnir_ID = t.ID_turnir 
                                    JOIN timovi tim1 ON m.tim1_ID = tim1.ID_tim 
                                    JOIN timovi tim2 ON m.tim2_ID = tim2.ID_tim");
            while($m = $mecevi->fetch_assoc()) {
                $sel = ($m['ID_mec'] == $stat['mec_ID']) ? "selected" : "";
                echo "<option value='".$m['ID_mec']."' $sel>".$m['turnir'].": ".$m['tim1']." vs ".$m['tim2']."</option>";
            }
            ?>
        </select><br><br>

        <label>Kills:</label><br>
        <input type="number" name="kills" value="<?= $stat['kills'] ?>" required><br><br>

        <label>Deaths:</label><br>
        <input type="number" name="deaths" value="<?= $stat['deaths'] ?>" required><br><br>

        <label>Assists:</label><br>
        <input type="number" name="assists" value="<?= $stat['assists'] ?>" required><br><br>

        <label>Damage:</label><br>
        <input type="number" name="damage" value="<?= $stat['damage'] ?>" required><br><br>

        <button type="submit">Spremi izmjene</button>
        <a href="statistika.php">Odustani</a>
    </form>
</body>
</html>