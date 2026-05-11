<?php include 'sidebar.php'; ?>
<div class="main-content">


<?php

$conn = mysqli_connect("localhost", "root", "", "sentiel_ai");

if(!$conn){
    die("Connection failed");
}

$workers = mysqli_query($conn, "SELECT * FROM workers");
$machines = mysqli_query($conn, "SELECT * FROM machines");
$environment = mysqli_query($conn, "SELECT * FROM environment");

$totalRisk = 0;

while($w = mysqli_fetch_assoc($workers)){

    if($w['fatigue_level'] == "HIGH"){
        $totalRisk += 3;
    }

    if($w['shift_hours'] > 12){
        $totalRisk += 2;
    }
}

while($m = mysqli_fetch_assoc($machines)){

    if($m['temperature'] > 100){
        $totalRisk += 3;
    }

    if($m['vibration_level'] > 90){
        $totalRisk += 2;
    }
}

while($e = mysqli_fetch_assoc($environment)){

    if($e['gas_level'] > 90){
        $totalRisk += 4;
    }

    if($e['dust_level'] > 80){
        $totalRisk += 2;
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>Sentinel AI Dashboard</title>

    <style>

        body{
            background:#111;
            color:white;
            font-family:Arial;
            padding:20px;
        }

        h1{
            text-align:center;
            margin-bottom:30px;
        }

        .card{
            padding:25px;
            border-radius:12px;
            font-size:28px;
            font-weight:bold;
            margin-top:20px;
            text-align:center;
        }

        .low{
            background:green;
        }

        .medium{
            background:orange;
        }

        .critical{
            background:red;
        }

        .stats{
            display:flex;
            gap:20px;
            margin-top:30px;
        }

        .box{
            flex:1;
            background:#222;
            padding:20px;
            border-radius:10px;
            text-align:center;
        }

        .number{
            font-size:40px;
            font-weight:bold;
            margin-top:10px;
        }

    </style>

</head>

<body>

<h1>🚨 Sentinel AI Central Risk Dashboard</h1>

<div class="stats">

    <div class="box">
        <h2>👷 Workers</h2>
        <div class="number">
            <?php
            $countWorkers = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM workers"));
            echo $countWorkers;
            ?>
        </div>
    </div>

    <div class="box">
        <h2>🚜 Machines</h2>
        <div class="number">
            <?php
            $countMachines = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM machines"));
            echo $countMachines;
            ?>
        </div>
    </div>

    <div class="box">
        <h2>🌍 Environment Zones</h2>
        <div class="number">
            <?php
            $countEnv = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM environment"));
            echo $countEnv;
            ?>
        </div>
    </div>

</div>

<h2 style="margin-top:40px;">Total Risk Score:
<?php echo $totalRisk; ?>
</h2>

<?php

if($totalRisk < 10){
    echo "<div class='card low'>🟢 LOW GLOBAL RISK</div>";
}
elseif($totalRisk < 20){
    echo "<div class='card medium'>🟠 MEDIUM GLOBAL RISK</div>";
}
else{
    echo "<div class='card critical'>🔴 CRITICAL GLOBAL RISK</div>";
}

?>

</body>
</html>
</dv>