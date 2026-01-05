$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Update Mid-Banner CTA Button (Greeting Page)
# Base state: border/text white, transparent background
# Hover state: background rgb(255, 159, 10), text white, border matches background

$pattern = '(?s)\.mid-banner \.btn-outline\s*\{.*?\s*\}\s*\.mid-banner \.btn-outline:hover\s*\{.*?\}'
$replacement = @'
.mid-banner .btn-outline {
    color: white !important;
    border: 1px solid white;
    background: transparent;
    padding: 13px 34px;
    border-radius: 50px;
    font-size: 1rem;
    font-weight: 500;
    transition: all 0.3s ease;
    display: inline-block;
    text-decoration: none;
}

.mid-banner .btn-outline:hover {
    background-color: rgb(255, 159, 10) !important;
    color: white !important;
    border-color: rgb(255, 159, 10) !important;
}
'@

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Updated Greeting page Mid-Banner CTA: Hover only effect applied."
}
else {
    # If the previous override snippet exists, we need to clean it up.
    # But usually, the replacement should find it if I use a broad enough pattern.
    Write-Host "Pattern not found. Trying to fix previous override."
    $content = $content -replace '(?s)/\* Mid-Banner Button Override \*/.*?(?=\n\n|\Z)', ""
    Add-Content $path -Value "`n$replacement"
}
