# 📡 IoT Log Analyzer - GCP Serverless Project

A serverless log processing pipeline on Google Cloud Platform (GCP) that listens to IoT device messages published via **Pub/Sub**, triggers a **Cloud Function** to process them, and logs each message execution using **Cloud Logging**.

---

## 🚀 Project Overview

This project simulates a lightweight and scalable IoT logging system using:

- **Pub/Sub** to simulate IoT device log streams.
- **Cloud Function** (Python) to process and log messages.
- **Cloud Logging** to track device logs with execution IDs.

---

## 🛠️ Tech Stack

- Google Cloud Platform
  - Cloud Pub/Sub
  - Cloud Functions (Python 3.11)
  - Cloud Logging
- Bash (for automation)
- Cloud Shell or local terminal

---

## 📂 Project Structure

```
iot-log-analyzer/
├── main.py               # Cloud Function code
├── requirements.txt      # Dependencies (none in this case)
├── deploy.sh             # Script to deploy Pub/Sub + Function
├── screenshot.png        # Deployment verification screenshot
├── README.md             # You're here!
```

---

## 📜 Function Logic (main.py)

```python
def iot_log_handler(event, context):
    import base64
    import logging
    message = base64.b64decode(event['data']).decode('utf-8')
    logging.info(f"📥 IoT Log Received: {message}")
```

---

## 📦 Deploy Using Shell

```bash
chmod +x deploy.sh
./deploy.sh
```

The script:
- Creates a Pub/Sub topic named `iot-device-logs`.
- Deploys the `iot_log_handler` function (2nd Gen).
- Binds the Cloud Function to trigger on each message.

---

## ✅ Deployment Output

- Cloud Function Name: `iot-log-handler`
- Trigger Type: Pub/Sub topic message
- Runtime: Python 3.11
- Region: `us-central1`
- Execution Log: View in **Cloud Logging** (Log Explorer)

---

## 🖼️ Screenshot

📸 Terminal showing VM/IP or successful function deployment:

![screenshot](iot-log-handler.png)
![screenshot](iot-logs.png)

---

## 🧪 Test the System

Publish a test message:
```bash
gcloud pubsub topics publish iot-device-logs --message="Sensor 42: Temp=36.7C"
```

Then check logs:
```bash
gcloud logging read "resource.type=cloud_function AND resource.labels.function_name=iot-log-handler" --limit=5
```

---

## 🧠 Interview Talking Points

| Error Faced | Solution |
|-------------|----------|
| `Resource already exists` | Pub/Sub topic already created from earlier run. Handled by ignoring the duplicate error. |
| `PERMISSION_DENIED for Cloud Build` | Enabled `cloudbuild.googleapis.com` and retried. |
| `Eventarc API not enabled` | Activated `eventarc.googleapis.com` via console. |
| `URL not working` | Cloud Function is event-triggered by Pub/Sub, not HTTP-invoked. |

---

## 📚 Learning Outcome

- Built a **serverless event-driven pipeline**
- Integrated **Pub/Sub + Cloud Functions**
- Debugged real GCP deployment errors
- Used **Cloud Shell + gcloud CLI** for deployment

---

## 📄 License

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## 🙋‍♀️ Author

Kshitija Randive – [GitHub](https://github.com/kshitija100998)
