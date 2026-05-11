 <?php include 'sidebar.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sentinel AI - Environmental Risk Engine</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background-color: #000; margin: 0; }
        .main-content { margin-left: 280px; padding: 30px; background: #0a0a0a; min-height: 100vh; color: white; font-family: 'Segoe UI', sans-serif; }
        .chart-container { width: 95%; margin: 20px auto; background: #111; padding: 25px; border-radius: 15px; border: 1px solid #333; }
        h1 { color: #00ffcc; border-left: 5px solid #00ffcc; padding-left: 15px; text-transform: uppercase; }
        .env-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 15px; margin-bottom: 25px; }
        .env-card { background: #1a1a1a; padding: 15px; border-radius: 10px; text-align: center; border: 1px solid #333; transition: all 0.3s; }
        
        /* Gas Leak / Oxygen Depletion Alert */
        .gas-emergency { background: rgba(255, 165, 0, 0.2) !important; border: 2px solid #ffa500 !important; animation: pulse 1s infinite; }
        @keyframes pulse { 0% { transform: scale(1); } 50% { transform: scale(1.03); } 100% { transform: scale(1); } }
        
        .env-val { font-size: 26px; font-weight: bold; color: #00ffcc; }
        .dispatch-tag { color: #ffa500; font-size: 11px; display: none; font-weight: bold; margin-top: 5px; }
    </style>
</head>
<body>

<div class="main-content">
    <h1>Environmental Intelligence</h1>
    <p>Monitoring gas concentrations and air quality in critical zones.</p>

    <div class="env-grid">
        <div class="env-card" id="env-1"><h4>TUNNEL B - OXYGEN</h4><p class="env-val" id="val-1">--</p><span>%</span><div class="dispatch-tag" id="tag-1">SMS DISPATCHED</div></div>
        <div class="env-card" id="env-2"><h4>PROCESSING PLANT - DUST</h4><p class="env-val" id="val-2">--</p><span>mg/m³</span><div class="dispatch-tag" id="tag-2">SMS DISPATCHED</div></div>
        <div class="env-card" id="env-3"><h4>OPEN PIT - METHANE</h4><p class="env-val" id="val-3">--</p><span>% LEL</span><div class="dispatch-tag" id="tag-3">SMS DISPATCHED</div></div>
        <div class="env-card" id="env-4"><h4>CRUSHING PLANT - NOISE</h4><p class="env-val" id="val-4">--</p><span>dB</span><div class="dispatch-tag" id="tag-4">SMS DISPATCHED</div></div>
    </div>

    <div class="chart-container">
        <canvas id="envRealTimeChart"></canvas>
    </div>
</div>

<script>
    const ctx = document.getElementById('envRealTimeChart').getContext('2d');
    let envAlerts = {}; 

    let envTelemetry = {
        oxygen: [20.5, 20.2, 19.8],
        dust: [35, 42, 48],
        noise: [82, 85, 88]
    };

    const envChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['T-10', 'T-5', 'Now'],
            datasets: [
                { label: 'Oxygen (Tunnel B)', data: envTelemetry.oxygen, borderColor: '#00ffcc', fill: true, backgroundColor: 'rgba(0, 255, 204, 0.1)' },
                { label: 'Dust (Plant)', data: envTelemetry.dust, borderColor: '#ffcc00' }
            ]
        },
        options: { responsive: true, plugins: { legend: { labels: { color: 'white' } } } }
    });

    function monitorEnvironment() {
        // 1. Oxygen Logic (Critical below 19.2%)
        let lastO2 = envTelemetry.oxygen[envTelemetry.oxygen.length - 1];
        let newO2 = (lastO2 - (Math.random() * 0.3)).toFixed(1); // Simulating oxygen drop
        envTelemetry.oxygen.push(parseFloat(newO2));
        if(envTelemetry.oxygen.length > 10) envTelemetry.oxygen.shift();
        
        document.getElementById('val-1').innerText = newO2;

        if (newO2 < 19.2) {
            triggerEnvAlert("Oxygen Depletion - Tunnel B", newO2 + "%", 1, "oxygen");
        }

        // 2. Dust Logic (Critical above 65 mg/m3)
        let lastDust = envTelemetry.dust[envTelemetry.dust.length - 1];
        let newDust = Math.floor(lastDust + (Math.random() * 12 - 5));
        envTelemetry.dust.push(newDust);
        if(envTelemetry.dust.length > 10) envTelemetry.dust.shift();
        
        document.getElementById('val-2').innerText = newDust;

        if (newDust > 65) {
            triggerEnvAlert("High Dust Concentration - Plant", newDust + "mg/m3", 2, "dust");
        }

        envChart.update();
    }

    function triggerEnvAlert(zone, value, id, key) {
        document.getElementById(`env-${id}`).classList.add('gas-emergency');
        document.getElementById(`val-${id}`).style.color = 'red';

        if (!envAlerts[key]) {
            // Sound Alarm
            new Audio('https://www.soundjay.com/buttons/sounds/beep-07.mp3').play();

            // Trigger SMS via existing send_alert.php
            fetch(`send_alert.php?machine=${encodeURIComponent(zone)}&temp=${value}`)
            .then(() => {
                document.getElementById(`tag-${id}`).style.display = 'block';
                console.log(`[ENV ALERT] SMS sent for ${zone}`);
            });
            envAlerts[key] = true;
        }
    }

    setInterval(monitorEnvironment, 4000);
</script>
</body>
</html>