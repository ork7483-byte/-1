$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8
# Regex to find the .mid-banner block even with weird comments/spacing
$pattern = '(?s)\.mid-banner\s*\{.*?\/\* ?⑤윺?숈뒪 ?④낵 \*\/\s*\}'
$replacement = @'
.mid-banner {
    position: relative;
    height: 300px; /* Reduced height to match image */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: white;
    background: url('team_banner_bg.png') no-repeat center center/cover;
    background-attachment: fixed;
}
'@

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Successfully replaced .mid-banner styles."
}
else {
    Write-Host "Pattern not found, appending override."
    Add-Content $path -Value "`n$replacement" -Encoding UTF8
}
