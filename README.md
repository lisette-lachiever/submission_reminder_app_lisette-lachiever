Submission Reminder App

Introduction

The Submission Reminder App is a simple application built using Linux shell scripts. The goal of the app is to remind students of their assignment deadlines. To get the app ready, we create a shell script called create_environment.sh to automatically create all the folders and files the application will need to run smoothly.

Setup Instructions

To begin, download (or clone) this project from GitHub to your computer.
Next, run the script called create_environment.sh. When you run it, the script will prompt you for a name. The script will then generate a new folder called submission_reminder_{YourName}.
Inside this folder, the program will put all the files and folders it needs to work. These folders are named as: app, modules, assets, and config.

Running the Application

Once you are finished with the setup, go inside your new folder submission_reminder_{YourName}. In it, you should find a file called startup.sh.
Run the startup.sh to start the Submission Reminder App.
This will enable the program to begin providing reminders.

Additional Information

The create_environment script has made the startup script executable, so there is no need to change permissions.
You can add more students now to the submissions list, if you want to.
This program will function well in a shell environment that supports bash.
