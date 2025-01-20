# Job Role Test: Application Development

## Project Overview

You are tasked with developing two interconnected applications:
1. A desktop web application using JavaScript and HTML.
2. A Flutter mobile application.

The goal is to establish TCP communication between the two applications, allowing real-time, bidirectional message exchange. The applications will interact with one another, with specific behaviors implemented as outlined below.

## Folder Structure

- `sq_test_app/`: Contains the Flutter mobile application.
- `sq_web_application/`: Contains the desktop web application using JavaScript and HTML.

## Requirements

### 1. Web/Desktop Application (JavaScript + HTML)
- Build a web application with the following functionalities:
  1. Establish a TCP connection with the Flutter mobile app.
  2. Send messages to the Flutter app based on user actions.
  3. Receive and process messages from the Flutter app to update the UI or trigger specific actions.

### 2. Flutter Mobile Application
- Build a Flutter mobile app with the following functionalities:
  1. Include multiple interactive buttons that:
     - Change color based on messages received from the web application.
  2. Implement three special buttons with the following behaviors:
     - **Button 1**: Triggers a specific, unique action in the web application (e.g., opening a modal dialog or changing the style of an element).
     - **Button 2**: Allows the user to send custom text over to the web app to be displayed as plain text.
     - **Button 3**: Executes a creative or innovative functionality. Examples include animations, sounds, or a dynamic UI change.

## Technical Specifications

### 1. Communication Protocol
- Use TCP for reliable communication between the two applications.
- Define a structured message format (e.g., JSON) to ensure consistency and clarity. Example format:
  ```json
  {
    "action": "changeColor",
    "data": { "buttonId": "button1", "color": "#FF0000" }
  }
  ```

### 2. Web Application Details
- Use HTML for the structure of the interface.
- Use JavaScript for:
  - Handling TCP communication.
  - Implementing client-side logic.
  - Dynamically updating the UI based on messages received from the Flutter app.

### 3. Flutter Application Details
- Use Dart/Flutter to create a mobile app interface with:
  - Buttons that visually respond (e.g., change color) to messages from the web app.
  - Logic for sending predefined and custom messages to the web app.
  - Implementation of the three special button functionalities as described above.

### 4. User Interaction
- The web application must:
  - Provide visual feedback (e.g., UI updates) based on messages received from the Flutter app.
  - Respond appropriately to button presses or actions from the Flutter app.
- The Flutter app must:
  - Reflect state changes (e.g., color changes) triggered by the web app.
  - Trigger predefined actions in the web app when special buttons are pressed.