<<<<<<< HEAD
=======
<<<<<<< HEAD
# Pulse Oximeter

=======
>>>>>>> c2b95febe8505ab3582fe18bd8b3cd3f7ee4e027
>>>>>>> app-cung
## Team

| Team Member | GitHub Username |
|---|---|
| Julio Coronado-Toscano | [VapurGunslinger](https://github.com/VapurGunslinger) |
| Cung Sin Mawi | [deborahcsm12](https://github.com/deborahcsm12) |
| Alfredo Dela Torre | [cableman12](https://github.com/cableman12) |
| Jasmine Phan | [phan17](https://github.com/phan17) |

## Project Description

The Pulse Oximeter project combines a physical pulse oximeter device with a mobile or web application for monitoring and displaying health readings. The application is designed to present collected data in a simple, clear layout, including graphs that show changes in readings over a selected period: one week, one month, or one year.

## Prototype Scope

### Currently Working

- The application launches successfully in the supported development environment.
- Page-to-page navigation works as expected.
- Preset pulse oximeter data is displayed correctly.
- Graphs and other health information are displayed using the preset data.
- The main navigation flow between the Home, History, Settings, and Account pages is implemented.

### Incomplete Features

- Retrieving live readings from the physical pulse oximeter device.
- Updating the application automatically when new device data is received.
- Redrawing graphs and displayed information using newly retrieved readings.
- Creating and connecting the database that will store pulse oximeter values.
- Completing the Notifications, Privacy, and App Preferences pages.

### Expo Preparation

Before the Project Expo, the team plans to complete device-to-application communication, database integration, live data updates, and additional testing for potential issues.

## System Architecture

The current prototype follows this navigation structure:

```text
Splash Screen
      |
      v
  Home Page
   /   |    \
  v    v     v
History Settings Account
        |
        v
     Account
     /  |  \
    v   v   v
Notifications  Privacy  App Preferences
```

The Notifications, Privacy, and App Preferences destinations are currently placeholders. In the planned full system, the physical pulse oximeter will send readings to the application, and the application will store those readings in a database. The stored data will then be used to update the health information and graphs.

## Prerequisites

The following software is required to build and run the prototype:

- Visual Studio Code 1.143.1
- Flutter 3.47.5
- Dart 3.13.4
- DevTools 2.60.0
- Google Chrome or another supported Flutter device

No environment variables or external accounts are currently required for the prototype. Database and device-integration requirements will be added as those features are implemented.

## Installation

1. Install [Visual Studio Code](https://code.visualstudio.com/).
2. Install the Flutter and Dart extensions from the Visual Studio Code Extensions tab.
3. Install the Flutter SDK and confirm that Flutter is available from the command line.
4. Clone this repository and open the project folder in Visual Studio Code.
5. From the project directory, install the project dependencies:

   ```bash
   flutter pub get
   ```

6. Verify the Flutter installation and available devices:

   ```bash
   flutter doctor
   flutter devices
   ```

## Running the Prototype

From the project directory, run:

```bash
flutter run
```

Flutter will display the available devices and ask you to select one. The team recommends selecting Chrome for the current prototype.

Example:

```text
Connected devices:
Windows (desktop) • windows • windows-x64    • Microsoft Windows [Version 10.0.26200.9711]
Chrome (web)      • chrome  • web-javascript • Google Chrome 156.0.8078.47
Edge (web)        • edge    • web-javascript • Microsoft Edge 155.0.4283.62

[1]: Windows (windows)
[2]: Chrome (chrome)
[3]: Edge (edge)

Please choose one (or "q" to quit): 2
```

You can also run the application directly on Chrome with:

```bash
flutter run -d chrome
```

## Testing

Automated tests have not been implemented yet. At this stage, the team is manually testing the prototype by verifying that:

- The application launches correctly.
- Each navigation button opens the expected page.
- Preset readings appear correctly.
- Graphs display the expected information.
- The History, Settings, and Account navigation flows work as intended.

Automated unit, widget, integration, and device-communication tests will be added as the database and physical-device integration are completed.

## Demo

Demo video: **(https://drive.google.com/drive/u/1/folders/1cM36bazQHmaAiHFZR-_Ffyub5bjFIg46)**

Screenshots and execution logs will be added here as the prototype is updated.

## Technical Stack

### Software

- **Language:** Dart
- **Framework:** Flutter
- **Development environment:** Visual Studio Code
- **Current prototype platform:** Google Chrome

### Planned Components

- Physical pulse oximeter device
- Database for storing pulse oximeter readings
- Device-to-application communication interface
- Data visualization through weekly, monthly, and yearly graphs

## What's Next

Before the Project Expo on December 11, the team will:

1. Implement data transfer from the physical pulse oximeter to the application.
2. Create and connect the database used to store pulse oximeter readings.
3. Update the application dynamically as new data is received.
4. Redraw the graphs and health information using the latest readings.
5. Complete the Notifications, Privacy, and App Preferences pages.
6. Test the complete system and fix any issues found during integration.
