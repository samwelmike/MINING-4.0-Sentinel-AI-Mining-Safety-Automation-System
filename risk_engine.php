 <?php include 'sidebar.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sentinel AI - Fleet Risk Engine</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background-color: #000; margin: 0; }
        .main-content { margin-left: 280px; padding: 30px; background: #0a0a0a; min-height: 100vh; color: white; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .chart-container { width: 95%; margin: 20px auto; background: #111; padding: 25px; border-radius: 15px; border: 1px solid #333; box-shadow: 0 10px 30px rgba(0,0,0,0.5); }
        h1 { color: #ff0000; border-left: 5px solid #ff0000; padding-left: 15px; text-transform: uppercase; letter-spacing: 2px; }
        .stats-grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 15px; margin-bottom: 25px; }
        .stat-card { background: #1a1a1a; padding: 15px; border-radius: 10px; text-align: center; border: 1px solid #333; transition: all 0.3s ease; }
        
        /* Emergency Blinking Animation */
        .status-critical { background: rgba(255, 0, 0, 0.2) !important; border: 2px solid #ff0000 !important; animation: blinker 0.8s linear infinite; }
        @keyframes blinker { 50% { opacity: 0.4; } }
        
        .temp-value { font-size: 28px; font-weight: bold; color: #00ff00; margin: 10px 0; }
        .alert-label { color: #ffcc00; font-size: 12px; font-weight: bold; display: none; text-transform: uppercase; }
    </style>
</head>
<body>

<div class="main-content">
    <h1>Autonomous Risk Engine</h1>
    <p>Real-time machine health monitoring and predictive alert system.</p>

    <div class="stats-grid">
        <div class="stat-card" id="card-1"><h4>CAT 777 DUMP TRUCK</h4><p class="temp-value" id="temp-1">--</p><span>°C</span><div class="alert-label" id="alert-1">SMS DISPATCHED</div></div>
        <div class="stat-card" id="card-2"><h4>KOMATSU RIG</h4><p class="temp-value" id="temp-2">--</p><span>°C</span><div class="alert-label" id="alert-2">SMS DISPATCHED</div></div>
        <div class="stat-card" id="card-3"><h4>EXCAVATOR ZX870</h4><p class="temp-value" id="temp-3">--</p><span>°C</span><div class="alert-label" id="alert-3">SMS DISPATCHED</div></div>
        <div class="stat-card" id="card-4"><h4>SANDVIK LOADER</h4><p class="temp-value" id="temp-4">--</p><span>°C</span><div class="alert-label" id="alert-4">SMS DISPATCHED</div></div>
        <div class="stat-card" id="card-5"><h4>WARMAN PUMP</h4><p class="temp-value" id="temp-5">--</p><span>°C</span><div class="alert-label" id="alert-5">SMS DISPATCHED</div></div>
    </div>

    <div class="chart-container">
        <canvas id="fleetIntelligenceChart"></canvas>
    </div>
</div>

<script>
    const ctx = document.getElementById('fleetIntelligenceChart').getContext('2d');
    let dispatchedAlerts = {}; // Prevents spamming alerts for the same event

    // Initial Database Simulation Data
    let telemetryData = {
        cat: [75, 78, 82], 
        komatsu: [55, 58, 60], 
        excavator: [95, 105, 112], 
        sandvik: [65, 70, 72], 
        warman: [108, 112, 116]
    };

    const fleetChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['T-10', 'T-5', 'Now'],
            datasets: [
                { label: 'CAT 777', data: telemetryData.cat, borderColor: '#ffcc00', tension: 0.4 },
                { label: 'Excavator ZX870', data: telemetryData.excavator, borderColor: '#ff4400', tension: 0.4 },
                { label: 'Warman Slurry Pump', data: telemetryData.warman, borderColor: '#ff0000', borderWidth: 3, tension: 0.4 }
            ]
        },
        options: { 
            responsive: true, 
            scales: {
                y: { grid: { color: '#222' }, ticks: { color: '#888' } },
                x: { grid: { color: '#222' }, ticks: { color: '#888' } }
            },
            plugins: { legend: { labels: { color: 'white' } } } 
        }
    });

    function processSensorStreams() {
        const machineIds = ['cat', 'komatsu', 'excavator', 'sandvik', 'warman'];
        const displayNames = ['CAT 777 Dump Truck', 'Komatsu Drilling Rig', 'Excavator ZX870', 'Sandvik LH517 Loader', 'Warman Slurry Pump'];

        machineIds.forEach((id, index) => {
            let lastVal = telemetryData[id][telemetryData[id].length - 1];
            let newVal = lastVal + (Math.floor(Math.random() * 5) - 2); // Simulating variance
            
            telemetryData[id].push(newVal);
            if(telemetryData[id].length > 15) telemetryData[id].shift();

            document.getElementById(`temp-${index+1}`).innerText = newVal;

            // PREDICTIVE LOGIC: Critical Threshold at 118°C
            if (newVal >= 118) {
                document.getElementById(`card-${index+1}`).classList.add('status-critical');
                document.getElementById(`temp-${index+1}`).style.color = 'red';
                
                if (!dispatchedAlerts[id]) {
                    triggerEmergencyResponse(displayNames[index], newVal, index+1);
                    dispatchedAlerts[id] = true;
                }
            } else {
                document.getElementById(`card-${index+1}`).classList.remove('status-critical');
                document.getElementById(`temp-${index+1}`).style.color = '#00ff00';
                dispatchedAlerts[id] = false;
                document.getElementById(`alert-${index+1}`).style.display = 'none';
            }
        });
        fleetChart.update();
    }

    function triggerEmergencyResponse(name, value, cardIndex) {
        // Audio Warning for the Control Room Officer
        let alarm = new Audio('https://www.soundjay.com/buttons/sounds/beep-07.mp3');
        alarm.play();

        // Asynchronous Alert Dispatch (PHP API Call)
        fetch(`send_alert.php?machine=${encodeURIComponent(name)}&temp=${value}`)
        .then(response => {
            document.getElementById(`alert-${cardIndex}`).style.display = 'block';
            console.log(`[SYSTEM] Emergency SMS triggered for ${name}`);
        });
    }

    // Refresh rate: 3000ms (3 seconds)
    setInterval(processSensorStreams, 3000);
</script>
</body>
</html>