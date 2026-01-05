$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8
# Use regex to find .section-padding and change top padding from 60px to 90px (50% increase)
$pattern = '(?s)\.section-padding\s*\{\s*padding:\s*60px\s*0\s*100px\s*0;\s*\}'
$replacement = '.section-padding { padding: 90px 0 100px 0; }'

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Replaced section-padding."
}
else {
    # If standard replacement fails, assume it might be different or already changed, so we append a specific override for the vision section
    Write-Host "Pattern not found. Using specific override for vision section."
    Add-Content $path -Value "`n/* Override spacing for Vision Section */`n.vision-section.section-padding { padding-top: 90px !important; }" -Encoding UTF8
}
