
import requests
import json

def send_dialogflow_request(project_id, session_id, message):
    # Dialogflow API endpoint
    url = f"https://dialogflow.googleapis.com/v2/projects/{edudoc-'53ae7'}/agent/sessions/{session_id}:detectIntent"

    # Request payload
    payload = {
        "queryInput": {
            "text": {
                "text": message,
                "languageCode": "en"  # Language code for English
            }
        }
    }

    # Set the appropriate headers
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer YOUR_AUTH_TOKEN"  # Replace with your Dialogflow API token
    }

    # Send the HTTP POST request to the Dialogflow API
    response = requests.post(url, headers=headers, json=payload)

    # Process the response
    if response.status_code == 200:
        response_json = response.json()
        # Extract the relevant information from the response
        # For example, you can access the intent or fulfillment using response_json['queryResult']
        print(response_json)
    else:
        print("Error:", response.status_code, response.text)

# Usage example
project_id = "YOUR_PROJECT_ID"
session_id = "YOUR_SESSION_ID"
message = "Hello, how are you?"

send_dialogflow_request(project_id, session_id, message)
