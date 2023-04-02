# Ducky-script-Fake-Windows-Login
This repository contains a Ducky Script that displays a fake Windows login screen to the user. When the user enters their password, the script captures the input and uploads it to Dropbox using the provided Dropbox access token.

## Demo
![Untitled video - Made with Clipchamp](https://user-images.githubusercontent.com/50125131/229378296-4ad8efad-9473-4a3d-b38f-b6e0664f0e87.gif)

## Features
- Disables Microsoft Real Time Protection, so No running into those problems...
- If custom background is configured by the user, shows that background instead of the default one.
- Validates entered password before closing the screen.

## Prerequisites
- A Rubber Ducky USB device (https://shop.hak5.org/products/usb-rubber-ducky-deluxe) or Flipper zero - That's what I used - (https://shop.flipperzero.one/)

- Open the script.txt file in a text editor.

- Replace the <YOUR_ACCESS_TOKEN_HERE> placeholder, on line 45 in script.txt, with your own Dropbox access token. `STRING $DropBoxAccessToken = 'YOUR_ACCESS_TOKEN_HERE'`

- Save the changes to the script.txt file.

- Deploy Payload to ducky

## Usage

- Insert the Rubber Ducky USB device into the target computer.

- The script will start running, displaying a fake Windows login screen.

- When the user enters their password and clicks "Submit", the script captures the password and uploads it to the specified Dropbox account.

## Acknowledgments
Arris Huijgen (@bitsadmin - https://github.com/bitsadmin/) for FakeLogonScreen (https://github.com/bitsadmin/fakelogonscreen)
I-Am-Jakoby (https://github.com/I-Am-Jakoby)

## Disclaimer
This script is for educational purposes only. Do not use it for any malicious activities or without the explicit consent of the computer's owner. The author and contributors are not responsible for any illegal actions performed with the help of this script.
