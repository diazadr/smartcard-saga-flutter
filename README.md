# Smartcard Saga

![Project Status](https://img.shields.io/badge/status-completed-brightgreen)

This project was developed as part of the final assignment for the **Internship Program (Praktik Kerja Lapangan)** at **PT LSKK**. The objective is to build a Flutter-based mobile application that works with the **IoT Working Kit Smartcard Saga**, using technologies like **RFID**, **QR Code scanning**, **local data storage**, and **AMQP communication**.

## **Technologies Used**

* **Flutter**: Framework for cross-platform mobile development.
* **Dart**: Primary language used for Flutter development.
* **Android Studio**: IDE for building and debugging Flutter applications.
* **stacked**: MVVM architecture support.
* **get\_it**: Service locator for dependency injection.
* **dart\_amqp**: For connecting to AMQP-based messaging queues.
* **shared\_preferences**: Local key-value storage.
* **qr\_code\_scanner\_plus**: To implement QR code scanning features.
* **path\_provider & sqflite**: For local file and SQLite database storage.
* **flutter\_screenutil**: For responsive UI design.
* **flutter\_launcher\_icons**: For generating custom launcher icons.

## **Demo**

### **Login, Dashboard, Result Screens**

These screens showcase login access, real-time result display, and QR interactions integrated with smartcard data.

<img src="https://github.com/user-attachments/assets/d800f29d-ca83-44c3-9427-8bfbc8546c39" alt="Screenshot" style="height: 300px; width: auto;">

## **Setup**

1. Clone the repository:

```bash
git clone https://github.com/diazadr/smartcard-saga-flutter.git
```

2. Open the project in **Android Studio**.
3. Run the following to install dependencies:

```bash
flutter pub get
```

4. Connect a device or open an emulator, then run:

```bash
flutter run
```

5. You can also directly install the APK file if provided.

## **Usage**

* Use the app to scan QR codes tied to RFID smartcards.
* Observe how AMQP messaging works in real-time for data updates.
* Explore the local storage implementation for offline access.
* Modify or extend features for your own smart IoT integration needs.

## **Project Status**

This project is **completed** and intended for **educational and prototyping purposes** only.

## **Important Notice**

Logos, images, and brand references used are strictly for **educational and non-commercial** purposes.

## **Contributions**

We welcome contributions! Please feel free to fork this repo, raise an issue, or submit a pull request to improve the application.
