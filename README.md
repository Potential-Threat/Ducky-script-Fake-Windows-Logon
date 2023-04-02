# Ducky-script-Fake-Windows-Logon
Fake Windows Login Ducky Script
This repository contains a Ducky Script that displays a fake Windows login screen to the user. When the user enters their password, the script captures the input and uploads it to Dropbox using the provided Dropbox access token.

Prerequisites
A Rubber Ducky USB device (https://shop.hak5.org/products/usb-rubber-ducky-deluxe)
Setup
Clone this repository:

Open the script.txt file in a text editor.

Replace the <YOUR_DROPBOX_ACCESS_TOKEN> placeholder with your own Dropbox access token.

$DropBoxAccessToken = '<YOUR_DROPBOX_ACCESS_TOKEN>'

Save the changes to the script.txt file.

Usage

Insert the Rubber Ducky USB device into the target computer.

The script will start running, displaying a fake Windows login screen.

When the user enters their password and clicks "Submit", the script captures the password and uploads it to the specified Dropbox account.

Disclaimer
This script is for educational purposes only. Do not use it for any malicious activities or without the explicit consent of the computer's owner. The author and contributors are not responsible for any illegal actions performed with the help of this script.
