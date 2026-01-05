$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Update Mid-Banner CTA Button (Greeting Page)
# Base state: background rgb(255, 159, 10), text white, no border (or matching border)
# Hover state: background slightly darker or same, text white

$pattern = '(?s)\.mid-banner \.btn-outline\s*\{.*?\s*transition:.*?\s*\}\s*\.mid-banner \.btn-outline:hover\s*\{.*?\}'
$replacement = @'
.mid-banner .btn-outline {
    background-color: rgb(255, 159, 10);
    color: white !important;
    border: none;
    padding: 13px 34px;
    border-radius: 50px;
    font-size: 1rem;
    font-weight: 700;
    transition: all 0.3s ease;
    display: inline-block;
    text-decoration: none;
}

.mid-banner .btn-outline:hover {
    background-color: rgb(230, 140, 0); /* Slightly darker orange */
    color: white !important;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(255, 159, 10, 0.3);
}
'@

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Updated Greeting page Mid-Banner CTA button styles."
}
else {
    Write-Host "Pattern not found. Appending override."
    Add-Content $path -Value "`n/* Mid-Banner Button Override */`n.mid-banner .btn-outline { background-color: rgb(255, 159, 10) !important; color: white !important; border: none !important; }`n.mid-banner .btn-outline:hover { color: white !important; background-color: rgb(230, 140, 0) !important; }"
}
