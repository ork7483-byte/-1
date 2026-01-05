$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8
$newStyle = @'
.sub-visual-content h2 {
    font-family: 'Pretendard', sans-serif !important;
    font-style: normal !important;
    font-size: 48px !important;
    font-weight: 700 !important;
    line-height: 62px !important;
    color: rgb(255, 255, 255) !important;
    margin: 0 0 30px 0 !important;
}
'@

# Regex to find the block. (?s) enables dotall mode.
$regex = '(?s)\.sub-visual-content h2\s*\{.*?\}'

if ($content -match $regex) {
    $content = $content -replace $regex, $newStyle
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Updated h2 styles."
}
else {
    Write-Host "Pattern not found, appending..."
    Add-Content $path -Value $newStyle -Encoding UTF8
}
