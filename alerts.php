<?php include 'sidebar.php'; ?>
<div class="main-content">

<?php
// 1. DATABASE CONNECTION
// Using your exact database name 'sentiel_ai'
$conn = mysqli_connect("localhost", "root", "", "sentiel_ai");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// 2. COUNT ACTIVE ALERTS FOR THE BADGE (Removed vibration to fix the error)
$worker_check = mysqli_query($conn, "SELECT COUNT(*) as total FROM workers WHERE fatigue_level = 'HIGH'");
$w_count = mysqli_fetch_assoc($worker_check)['total'];

$machine_check = mysqli_query($conn, "SELECT COUNT(*) as total FROM machines WHERE temperature > 100");
$m_count = mysqli_fetch_assoc($machine_check)['total'];

$total_alerts = $w_count + $m_count;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sentinel AI | Live Alerts System</title>
    <style>
        body {
            background-color: #0f0f0f;
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 30px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #333;
            padding-bottom: 15px;
        }

        .notification-badge {
            background-color: #ff0000;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 20px;
        }

        .alert-box {
            padding: 20px;
            margin: 15px 0;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            border-left: 10px solid;
        }

        /* BLINKING EFFECT FOR CRITICAL ALERTS */
        .critical {
            background: rgba(255, 0, 0, 0.2);
            border-left-color: #ff0000;
            animation: blinker 1s linear infinite;
        }

        @keyframes blinker {
            50% { opacity: 0.3; }
        }

        .safe {
            background: rgba(0, 255, 0, 0.1);
            border-left-color: #00ff00;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>🚨 SENTINEL AI - LIVE MONITORING</h1>
    <div>
        <span>Active Alerts: </span>
        <span class="notification-badge"><?php echo $total_alerts; ?></span>
    </div>
</div>

<div class="container">
    <?php
    $critical_status = false;

    // 3. CHECK WORKERS & LOG TO DATABASE
    $workers = mysqli_query($conn, "SELECT * FROM workers");
    while($w = mysqli_fetch_assoc($workers)) {
        if($w['fatigue_level'] == "HIGH") {
            $critical_status = true;
            $msg = "CRITICAL FATIGUE: Worker " . $w['full_name'] . " detected.";
            
            // Logging to alerts_logs table
            mysqli_query($conn, "INSERT INTO alerts_logs (alert_type, message) VALUES ('FATIGUE', '$msg')");
            
            echo "<div class='alert-box critical'>👷 WORKER ALERT: $msg</div>";
        }
    }

    // 4. CHECK MACHINES & LOG TO DATABASE
    $machines = mysqli_query($conn, "SELECT * FROM machines");
    while($m = mysqli_fetch_assoc($machines)) {
        if($m['temperature'] > 100) {
            $critical_status = true;
            $msg = "OVERHEATING: " . $m['machine_name'] . " reached " . $m['temperature'] . " Celsius.";
            
            // Logging to alerts_logs table
            mysqli_query($conn, "INSERT INTO alerts_logs (alert_type, message) VALUES ('OVERHEATING', '$msg')");
            
            echo "<div class='alert-box critical'>🚜 MACHINE ALERT: $msg</div>";
        }
    }

    // SYSTEM SAFE MESSAGE
    if(!$critical_status) {
        echo "<div class='alert-box safe'>✅ SYSTEM STATUS: All mining parameters are stable.</div>";
    }
    ?>
</div>

<!-- 5. SIREN SOUND AUDIO -->
<audio id="siren" loop>
    <source src="https://www.soundjay.com/buttons/sounds/beep-01a.mp3" type="audio/mpeg">
</audio>

<script>
    // Audio activation on click
    document.body.addEventListener('click', function() {
        var isCritical = <?php echo $critical_status ? 'true' : 'false'; ?>;
        var audio = document.getElementById("siren");
        if(isCritical) {
            audio.play();
        }
    });
</script>

<p style="text-align: center; color: #444; margin-top: 40px;">
    <i>Note: Click anywhere on the page to enable the Siren Sound.</i>
</p>

</body>
</html>
</div>