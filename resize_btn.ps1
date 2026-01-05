$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Regex to find the button styles block
$pattern = '(?s)(\.mid-banner \.btn-outline\s*\{[^}]*?)padding:\s*15px\s*40px;([^}]*?)font-size:\s*1\.1rem;'
$replacement = '${1}padding: 10px 28px;$2font-size: 0.9rem;'

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Successfully resized mid-banner button."
}
else {
    Write-Host "Pattern not found. Appending override style."
    # If regex fails, append a specific override at the end
    $override = "
/* Resize Mid Banner Button Override */
.mid-banner .btn-outline {
    padding: 10px 28px !important;
    font-size: 0.9rem !important;
}
"
    Add-Content $path -Value $override -Encoding UTF8
}
