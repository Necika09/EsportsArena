<?php 
include "db.php"; 

// BRISANJE
if (isset($_GET['delete'])) {
    $stmt = $conn->prepare("DELETE FROM statistika_igraca WHERE ID_stat = ?");
    $stmt->bind_param("i", $_GET['delete']);
    $stmt->execute();
    header("Location: statistika.php");
    exit;
}

// DODAVANJE
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add_stat'])) {
    $stmt = $conn->prepare("INSERT INTO statistika_igraca (mec_ID, igrac_ID, kills, deaths, assists, damage) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("iiiiii", $_POST['mec_ID'], $_POST['igrac_ID'], $_POST['kills'], $_POST['deaths'], $_POST['assists'], $_POST['damage']);
    $stmt->execute();
    header("Location: statistika.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Statistika</title>
    <link rel="icon" type="image/x-icon" href="images/logoNew.png">
</head>
<body>
    <?php include "header.php"; ?>

    <h1>Statistika mečeva</h1>
    
    <form method="POST" class="admin-card">
        <select name="igrac_ID" required>
            <option value="">-- Odaberi igrača --</option>
            <?php
            $igraci = $conn->query("SELECT ID_igrac, nickname FROM igraci");
            while($i = $igraci->fetch_assoc()) echo "<option value='".$i['ID_igrac']."'>".$i['nickname']."</option>";
            ?>
        </select>
        
        <select name="mec_ID" required>
            <option value="">-- Odaberi meč (Turnir: Tim 1 vs Tim 2) --</option>
            <?php
            // Spajamo mečeve s turnirima i timovima za jasniji prikaz u dropdownu
            $mecevi = $conn->query("SELECT m.ID_mec, t.naziv AS turnir, tim1.naziv AS tim1, tim2.naziv AS tim2 
                                    FROM mecevi m 
                                    JOIN turniri t ON m.turnir_ID = t.ID_turnir 
                                    JOIN timovi tim1 ON m.tim1_ID = tim1.ID_tim 
                                    JOIN timovi tim2 ON m.tim2_ID = tim2.ID_tim");
            while($m = $mecevi->fetch_assoc()) 
                echo "<option value='".$m['ID_mec']."'>".$m['turnir'].": ".$m['tim1']." vs ".$m['tim2']."</option>";
            ?>
        </select>
        
        <input type="number" name="kills" placeholder="Kills" required>
        <input type="number" name="deaths" placeholder="Deaths" required>
        <input type="number" name="assists" placeholder="Assists" required>
        <input type="number" name="damage" placeholder="Damage" required>
        <button type="submit" name="add_stat">Spremi zapis</button>
    </form>

    <form method="GET" style="margin-top:20px;">
        <select name="filter_igrac" onchange="this.form.submit()">
            <option value="">Filtriraj po igraču: Svi</option>
            <?php
            $igraci = $conn->query("SELECT * FROM igraci");
            while($i = $igraci->fetch_assoc()) {
                $sel = (isset($_GET['filter_igrac']) && $_GET['filter_igrac'] == $i['ID_igrac']) ? "selected" : "";
                echo "<option value='".$i['ID_igrac']."' $sel>".$i['nickname']."</option>";
            }
            ?>
        </select>
    </form>

    <table border="1" cellpadding="8" style="width: 100%; margin-top:20px;">
        <tr><th>Igrač</th><th>K/D/A</th><th>Damage</th><th>Turnir</th><th>Meč (Timovi)</th><th>Akcije</th></tr>
        <?php
        $filter = (isset($_GET['filter_igrac']) && $_GET['filter_igrac'] != '') ? "WHERE i.ID_igrac = " . (int)$_GET['filter_igrac'] : "";
        $query = "SELECT s.ID_stat, i.nickname, s.kills, s.deaths, s.assists, s.damage, t.naziv AS turnir, tim1.naziv AS tim1, tim2.naziv AS tim2
                  FROM statistika_igraca s
                  JOIN igraci i ON s.igrac_ID = i.ID_igrac
                  JOIN mecevi m ON s.mec_ID = m.ID_mec
                  JOIN turniri t ON m.turnir_ID = t.ID_turnir
                  JOIN timovi tim1 ON m.tim1_ID = tim1.ID_tim
                  JOIN timovi tim2 ON m.tim2_ID = tim2.ID_tim $filter";
        $rez = $conn->query($query);
        while ($r = $rez->fetch_assoc()):
        ?>
        <tr>
            <td><?= htmlspecialchars($r['nickname']) ?></td>
            <td><?= $r['kills'] ?>/<?= $r['deaths'] ?>/<?= $r['assists'] ?></td>
            <td><?= $r['damage'] ?></td>
            <td><?= htmlspecialchars($r['turnir']) ?></td>
            <td><?= htmlspecialchars($r['tim1']) ?> vs <?= htmlspecialchars($r['tim2']) ?></td>
            <td>
                <a href="urediStat.php?id=<?= $r['ID_stat'] ?>">✏️</a>
                <a href="?delete=<?= $r['ID_stat'] ?>" onclick="return confirm('Brisati?')">🗑️</a>
            </td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>