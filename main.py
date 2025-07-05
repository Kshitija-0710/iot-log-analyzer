import base64
import json

def iot_log_handler(event, context):
    if 'data' in event:
        decoded = base64.b64decode(event['data']).decode('utf-8')
        try:
            log = json.loads(decoded)
            print(f"📥 Received Log: Device={log.get('device_id')} | Temp={log.get('temperature')}°C")
        except Exception as e:
            print(f"❌ Failed to parse log: {decoded}")
    else:
        print("⚠️ No data in event")

def iot_log_handler(event, context):
    import base64
    import json

    log_data = base64.b64decode(event['data']).decode('utf-8')
    print("📥 Received IoT log:", log_data)
