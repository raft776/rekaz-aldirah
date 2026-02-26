# Script to organize project images
$base = $PSScriptRoot

# Move hero image
$hero = Get-ChildItem -Path $base -Filter "*.png" | Where-Object { $_.Name -like "*لقطة*" -or $_.Name -like "*005827*" }
if ($hero) { Move-Item $hero.FullName "$base\images\hero\" -Force }

# Move branch image
$branch = Get-ChildItem -Path $base -Filter "WhatsApp*.jpeg"
if ($branch) { Move-Item $branch.FullName "$base\images\branches\" -Force }

# Move menu/food images (Arabic named)
$menuImages = Get-ChildItem -Path $base -Filter "*.jpeg" | Where-Object { $_.DirectoryName -eq $base }
foreach ($img in $menuImages) {
    Move-Item $img.FullName "$base\images\menu\" -Force
}

Write-Host "Done! Images organized."
