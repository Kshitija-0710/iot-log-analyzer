#!/bin/bash

# Set your GCP project ID
PROJECT_ID=$(gcloud config get-value project)
REGION="us-central1"
TOPIC_NAME="iot-device-logs"
FUNCTION_NAME="iot-log-handler"

# Enable necessary APIs
gcloud services enable pubsub.googleapis.com cloudfunctions.googleapis.com

# Create Pub/Sub topic (if not exists)
gcloud pubsub topics create $TOPIC_NAME --quiet || true

# Deploy Cloud Function
gcloud functions deploy $FUNCTION_NAME \
  --runtime python311 \
  --trigger-topic $TOPIC_NAME \
  --entry-point iot_log_handler \
  --source . \
  --region $REGION \
  --quiet
