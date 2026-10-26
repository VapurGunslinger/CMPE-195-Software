# [Pulse Oximeter]

## Team
Name (GitHub username) for each member.
Julio Coronado-Toscano (VapurGunslinger)
Cung Sin Mawi (deborahcsm12)
Alferdo Del La Torre (cableman12)
Jasmine Phan (phan17)

## Project Description
Two or three sentences: the problem and your solution.
This side of the project is for the creation of the application that will go hand in hand with the physical device in order to have a simple and clear layout for the data collected from the device. This will be done using graphs that show changes in readings over a selected period. These periods are a week, a month, or a year.

## Prototype Scope
What works end to end right now. What is incomplete, and what is left for the Expo. As well as the graphs and other information display properly with the given preset information. 

Currently, the page-to-page interactions work as expected. 

We need to work on the integration of retrieving data from the device and, in turn, making it so that the app updates as it retrieves data from the device and redraws the graphs and information that is being displayed. Also, the setting up of a database that will be in charge of holding the values. 

## System Architecture
A diagram or clear description of the components and how they connect.

Splash screen -> home page -> History page
                           -> Settings page  -> Account page
                                             -> Notifications 
                                             -> Privacy 
                                             -> App Preferences
                           -> Account page
Currently, the notification, Privacy, and app pref are placeholders where their pages will be placed at a later date

## Prerequisites
Software, tools, accounts, and hardware needed, with versions.
VS Code - 1.143.1 
Dart - 3.13.4
DevTools 2.60.0
Flutter - 3.47.5

## Installation
Numbered steps from a clean machine. Document environment variables without their values.
An installation of Flutter and Dart through the Extensions tab in VS Code will allow for the startup of the current build of the app. Recommended way for simplicity 

## Running the Prototype
The exact commands to start the system.
To start the program 
  flutter run 
After this, it will prompt you to input a value that correlates to the system to run the code on. We used Chrome to run the code, so we recommend using that. Example below of what to look out for. 
EX:
Connected devices:
Windows (desktop) • windows • windows-x64    • Microsoft Windows [Version 10.0.26200.9711]
Chrome (web)      • chrome  • web-javascript • Google Chrome 156.0.8078.47
Edge (web)        • edge    • web-javascript • Microsoft Edge 155.0.4283.62
[1]: Windows (windows)
[2]: Chrome (chrome)
[3]: Edge (edge)
Please choose one (or "q" to quit): 2

After this, it will run on the connected device that is chosen. 


## Testing
How to run your tests, and what they cover.

We currently don't have any tests implemented. We are currently making sure that everything is working as expected and each page leads to the correct one. 

## Demo
Your demo video link, plus screenshots or logs.

Video link - 


## Technical Stack
Languages, frameworks, services, and hardware.
Labguages
  Dart / Flutter 

## What's Next
What you will finish before the Project Expo on December 11.

Will create data storage from the device into a database that will be used later for updating the application. 
We will finish the device-to-application integration from the pulse oximeter to the app. Includes changes to the current build as well as major additions. 
After that, we will test and fix any potential issues that we find.


