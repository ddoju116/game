$ErrorActionPreference = 'Stop'
$photos = @{
 'scene-1' = '1441974231531-c6227db76b6e'
 'scene-3' = '1473448912268-2022ce9509d8'
 'scene-4' = '1506744038136-46273834b3fb'
 'scene-6' = '1464822759023-fed622ff2c3b'
 'scene-7' = '1470071459604-3b5ec3a7fe05'
 'scene-8' = '1448375240586-882707db888b'
 'scene-9' = '1472396961693-142e6e269027'
 'scene-10' = '1501785888041-af3ef285b470'
}
$taskRoot = Split-Path -Parent $PSScriptRoot
$photoDir = Join-Path $taskRoot 'assets/photos'
New-Item -ItemType Directory -Force -Path $photoDir | Out-Null
foreach ($entry in $photos.GetEnumerator()) {
 $destination = Join-Path $photoDir ($entry.Key + '.jpg')
 if (!(Test-Path -LiteralPath $destination)) {
  Invoke-WebRequest -Uri ('https://images.unsplash.com/photo-{0}?auto=format&fit=crop&w=1440&h=960&q=85' -f $entry.Value) -OutFile $destination
 }
 Write-Output ($entry.Key + ': ready')
}
