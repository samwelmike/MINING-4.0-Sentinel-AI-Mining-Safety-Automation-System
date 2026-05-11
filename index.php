 <?php include 'sidebar.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sentinel AI - Central Command Brain</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background-color: #000; margin: 0; font-family: 'Segoe UI', sans-serif; }
        .main-content { margin-left: 280px; padding: 30px; background: #0a0a0a; min-height: 100vh; color: white; }
        
        .header-section { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; border-bottom: 1px solid #333; padding-bottom: 10px; }
        h1 { color: #ff0000; text-transform: uppercase; letter-spacing: 2px; margin: 0; }
        .system-status { padding: 5px 15px; border-radius: 20px; background: rgba(0, 255, 0, 0.1); color: #00ff00; font-size: 12px; border: 1px solid #00ff00; }

        /* Brain Widgets */
        .brain-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 30px; }
        .brain-card { background: #111; padding: 25px; border-radius: 15px; border: 1px solid #333; text-align: center; position: relative; overflow: hidden; }
        .brain-card h3 { margin: 0; color: #888; font-size: 14px; text-transform: uppercase; }
        .brain-card .score { font-size: 48px; font-weight: bold; margin: 15px 0; color: #ffcc00; }
        .brain-card .trend { font-size: 12px; color: #00ff00; }

        /* Live Activity Log */
        .log-container { background: #111; padding: 20px; border-radius: 15px; border: 1px solid #333; height: 300px; overflow-y: hidden; }
        .log-header { color: #ff0000; font-weight: bold; border-bottom: 1px solid #222; padding-bottom: 10px; margin-bottom: 15px; display: flex; justify-content: space-between; }
        .log-entry { font-family: 'Courier New', monospace; font-size: 13px; margin-bottom: 8px; padding: 5px; border-left: 3px solid #444; background: #050505; }
        .log-entry.critical { border-left-color: #ff0000; color: #ff6666; animation: flash 1s infinite; }
        @keyframes flash { 50% { opacity: 0.5; } }
    </style>
</head>
<body>

<div class="main-content">
    <div class="header-section">
        <h1>Sentinel Central Brain</h1>
        <div class="system-status">● AI ENGINE ACTIVE</div>
    </div>

    <div class="brain-grid">
        <div class="brain-card">
            <h3>Fleet Health Index</h3>
            <div class="score" id="fleet-score">94%</div>
            <div class="trend">↑ 2.1% from last shift</div>
        </div>
        <div class="brain-card">
            <h3>Environment Safety</h3>
            <div class="score" id="env-score">98%</div>
            <div class="trend">Stable Compliance</div>
        </div>
        <div class="brain-card" id="risk-level-card">
            <h3>Overall Mine Risk</h3>
            <div class="score" id="risk-label" style="color: #00ff00;">LOW</div>
            <div class="trend" id="risk-desc">No critical hazards detected</div>
        </div>
    </div>

    <div class="log-container">
        <div class="log-header">
            <span>REAL-TIME INTELLIGENCE FEED</span>
            <span id="live-clock">00:00:00</span>
        </div>
        <div id="activity-log">
            <div class="log-entry">[INFO] Sentinel AI initialized. Connecting to sensors...</div>
            <div class="log-entry">[INFO] Establishing secure link to Tunnel B O2 sensors.</div>
            <div class="log-entry">[INFO] Fleet telemetry received from CAT 777 & Excavator ZX870.</div>
        </div>
    </div>
</div>

<script>
    function updateClock() {
        document.getElementById('live-clock').innerText = new Date().toLocaleTimeString();
    }
    setInterval(updateClock, 1000);

    const logMessages = [
        "[INFO] Pressure levels stable in Processing Plant.",
        "[INFO] Operator fatigue scan complete: All operators alert.",
        "[WARN] Slight temperature rise detected in Warman Pump.",
        "[INFO] Ventilation fans in Tunnel B operating at 100% capacity.",
        "[CRITICAL] Sudden vibration spike on Excavator ZX870! Analyzing...",
        "[INFO] SMS Alert dispatched to Maintenance Team Lead.",
        "[INFO] Dust suppression system activated in Crushing Plant."
    ];

    function addLogEntry() {
        const logContainer = document.getElementById('activity-log');
        const randomMsg = logMessages[Math.floor(Math.random() * logMessages.length)];
        
        const entry = document.createElement('div');
        entry.className = 'log-entry';
        if (randomMsg.includes('CRITICAL')) entry.className += ' critical';
        
        const time = new Date().toLocaleTimeString([], { hour12: false });
        entry.innerText = `[${time}] ${randomMsg}`;
        
        logContainer.prepend(entry); // Newest on top
        
        // Dynamic Risk Scoring Simulation
        if (randomMsg.includes('CRITICAL')) {
            document.getElementById('risk-label').innerText = "HIGH";
            document.getElementById('risk-label').style.color = "red";
            document.getElementById('risk-level-card').style.borderColor = "red";
            
            // Auto-reset after 10 seconds
            setTimeout(() => {
                document.getElementById('risk-label').innerText = "LOW";
                document.getElementById('risk-label').style.color = "#00ff00";
                document.getElementById('risk-level-card').style.borderColor = "#333";
            }, 10000);
        }
    }

    // New log entry every 5-8 seconds
    setInterval(addLogEntry, 6000);
</script>

</body>
</html>