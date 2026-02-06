param(
[Parameter(Mandatory=$true)]
[string]$Filename
)
$MAX_SIZE = 1048576 # 1MB in bytes
if (-not (Test-Path -Path $Filename -PathType Leaf)) {
Write-Host "Error: File '$Filename' does not exist" -ForegroundColor Red
exit 1
}
$fileInfo = Get-Item -Path $Filename
$fileSize = $fileInfo.Length
if ($fileSize -gt $MAX_SIZE) {
Write-Host "Warning: File is too large" -ForegroundColor Yellow
Write-Host "File size: $fileSize bytes ($([math]::Round($fileSize/1MB, 2)) MB)"
} else {
Write-Host "File size is within limits" -ForegroundColor Green
Write-Host "File size: $fileSize bytes ($([math]::Round($fileSize/1MB, 2)) MB)"
}