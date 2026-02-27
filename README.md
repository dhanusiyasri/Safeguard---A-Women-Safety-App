# 🛡️ Safeguard – Women Safety Application

Safeguard is a collection of two independent Flutter-based mobile safety applications designed to enhance personal security using multiple emergency trigger mechanisms.

These applications leverage device hardware buttons, motion sensors, and intuitive UI components to provide fast emergency activation.

---

# 👩‍💻 Team Information

This project was developed as a **team project** by:

## 🚀 Team Name: *SimpleX Crew*

### 👥 Team Members:
- **Sarathi Selvam D**
- **Saisha Priyadarshini S**
- **Dhanusiya Sri M**
- **Dhivyadharshini M**

We collaboratively designed, developed, and implemented the safety trigger mechanisms and application logic as part of this project.

---

# 📱 Repository Structure

```
Safeguard-Repository/
│
├── frontend/          → Hardware & Gesture Trigger App
└── safeguard/         → Manual + Gesture Trigger App
```

Both projects are standalone Flutter applications and must be run separately.

---

# 📱 Application 1: Frontend Trigger App

## 🔹 Overview

This application focuses on **hardware-based and gesture-based emergency activation**, enabling discreet SOS triggering without navigating through UI screens.

---

## 🚀 Features

- 🔊 Volume Down Button Trigger  
- 📳 Shake Detection Trigger  
- ⚡ Quick emergency callback execution  
- 📱 Lightweight architecture  

---


## 📂 File Structure

```
frontend/
│
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── home_screen.dart
│   └── triggers/
│       ├── shake_trigger.dart
│       └── volume_trigger.dart
│
├── pubspec.yaml
└── README.md
```

---

## ⚙️ Working Mechanism

### 🔊 Volume Button Flow

```
Volume Down Pressed
        ↓
Key Event Listener Detects Press
        ↓
Trigger Callback Executed
        ↓
Emergency Logic Activated
```

---

### 📳 Shake Detection Flow

```
Device Shaken
        ↓
Accelerometer Captures Motion
        ↓
Threshold Validated
        ↓
Emergency Trigger Activated
```

---

## ▶️ How to Run (Frontend App)

```bash
cd frontend
flutter pub get
flutter run
```

---

# 📱 Application 2: Safeguard App

## 🔹 Overview

The Safeguard app provides **gesture-based and manual SOS activation** through a user-friendly interface designed for intentional and quick emergency response.

---

## 🚀 Features

- 📳 Shake Trigger  
- 🚨 Manual SOS Button  
- 👩‍💻 Clean UI  
- ⚡ Instant activation logic  

---


## 📂 File Structure

```
safeguard/
│
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   └── home_screen.dart
│   │
│   ├── triggers/
│   │   └── shake_trigger.dart
│   │
│   └── widgets/
│       └── sos_button.dart
│
├── pubspec.yaml
└── README.md
```

---

## ⚙️ Working Mechanism

### 📳 Shake Trigger

```
Device Shaken
      ↓
Accelerometer Data Processed
      ↓
Shake Pattern Verified
      ↓
Emergency Callback Executed
```

---

### 🚨 Manual SOS Button

```
User Presses SOS
        ↓
OnPressed Event Triggered
        ↓
Emergency Logic Executed
```

---

## ▶️ How to Run (Safeguard App)

```bash
cd safeguard
flutter pub get
flutter run
```

---

# 🧠 Technical Stack

- Flutter
- Dart
- Accelerometer Sensor Integration
- Hardware Key Event Handling
- Android & iOS Support

---

# 🚀 Future Enhancements

- 📍 Live GPS Location Sharing  
- 📩 SMS Alerts to Emergency Contacts  
- 🔔 Background Service Activation  
- ☁️ Cloud-based Incident Logging  
- 🤖 AI-based Risk Prediction  

---

# 📌 Important Notes

- Volume button detection works reliably when the app is active.
- Shake detection sensitivity depends on motion threshold settings.
- Both apps are independent Flutter projects and must be executed separately.

---

# 👩‍💻 Project Contribution

This project was built through collaborative teamwork, where responsibilities were shared across:

- UI Development  
- Trigger Logic Implementation  
- Sensor Integration  
- Testing & Debugging  
- Documentation  

Team *SimpleX Crew* worked together to design a reliable multi-trigger safety solution.

---

# 🏁 Conclusion

Safeguard demonstrates innovative emergency activation techniques using gesture detection, hardware interaction, and manual SOS controls.

The project highlights how mobile technology can be leveraged to build effective and accessible personal safety solutions.

---
..