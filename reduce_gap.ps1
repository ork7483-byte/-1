$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8
# Use regex to change padding-bottom of .section-padding from 100px to 50px
$pattern = '(?s)(\.section-padding\s*\{[^}]*?)padding:\s*180px\s*0\s*100px\s*0\s*;'
$replacement = '${1}padding: 180px 0 50px 0;'

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Reduced bottom padding of section-padding."
}
else {
    Write-Host "Pattern not found. Appending specific override for location page."
    # Fallback: target the location section specifically if the general one fails or is complex
    Add-Content $path -Value "`n/* Override spacing for Location Page to Footer */`n.location-section.section-padding { padding-bottom: 50px !important; }" -Encoding UTF8
}
