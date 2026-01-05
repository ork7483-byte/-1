$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Precise replacement for the button style to make it proportional
$pattern = '(?s)\.btn-static-pill\s*\{.*?\s*font-size:\s*1\.6rem;.*?\s*padding:\s*25px\s*100px;.*?\}'
$replacement = @'
.btn-static-pill {
    display: inline-block;
    background-color: var(--primary);
    color: white !important;
    font-size: 1.15rem;
    font-weight: 700;
    padding: 18px 45px; /* Proportional padding to match image */
    border-radius: 100px; /* Full pill shape */
    text-decoration: none;
    transition: transform 0.3s ease;
    white-space: nowrap;
    border: none;
    line-height: normal;
}
'@

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Updated button style using regex."
}
else {
    Write-Host "Pattern not found. Appending strong override."
    Add-Content $path -Value "`n/* Force correct button size */`n.btn-static-pill { font-size: 1.15rem !important; padding: 18px 45px !important; }" -Encoding UTF8
}
