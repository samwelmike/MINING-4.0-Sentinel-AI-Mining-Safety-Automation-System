<?php
/**
 * Sentinel AI - Automated Alert Dispatcher
 * This script handles the server-side logic for sending emergency SMS/Logs.
 */

if(isset($_GET['machine']) && isset($_GET['temp'])) {
    $machineName = htmlspecialchars($_GET['machine']);
    $temperature = htmlspecialchars($_GET['temp']);
    $recipient = "+2557XXXXXXXX"; // Your professional contact

    // Formatting the emergency message
    $timestamp = date("Y-m-d H:i:s");
    $alertMessage = "CRITICAL ALERT: $machineName reached $temperature °C at $timestamp. Immediate inspection required. - Sentinel AI System\n";
    
    // Logging the alert for audit trails (Essential for Mining Compliance)
    file_put_contents("system_alerts.log", $alertMessage, FILE_APPEND);
    
    echo "Alert Dispatched Successfully";
}
?>