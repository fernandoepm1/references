## Example usage

```json
{
  "responseId": "ea3d77e8-ae27-41a4-9e1d-174bd461b68c",
  "session": "projects/your-agents-project-id/agent/sessions/88d13aa8-2999-4f71-b233-39cbf3a824a0",
  "queryResult": {
    "languageCode": "en",
    "queryText": "user's original query to your agent",
    "fulfillmentText": "Text defined in Dialogflow's console for the intent that was matched",
    "action": "action name",
    "allRequiredParamsPresent": true,
    "parameters": {
      "param": "param value"
    },
    "outputContexts": [
      {
        "name": "projects/your-agents-project-id/agent/sessions/88d13aa8-2999-4f71-b233-39cbf3a824a0/contexts/generic",
        "lifespanCount": 5,
        "parameters": {
          "param": "param value"
        }
      }
    ],
    "intent": {
      "name": "projects/your-agents-project-id/agent/intents/29bcd7f8-f717-4261-a8fd-2d3e451b8af8",
      "displayName": "Matched Intent Name"
    },
    "fulfillmentMessages": [
      {
        "text": {
          "text": [
            "Text defined in Dialogflow's console for the intent that was matched"
          ]
        }
      }
    ],
    "intentDetectionConfidence": 1,
    "diagnosticInfo": {}
  },
  "originalDetectIntentRequest": {
    "source": "google",
    "version": "2",
    "payload": {
      "isInSandbox": true,
      "surface": {
        "capabilities": []
      },
      "inputs": [],
      "user": {},
      "conversation": {},
      "availableSurfaces": []
    }
  }
}
```