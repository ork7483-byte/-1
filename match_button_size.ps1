$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Update .btn-static-pill to match the size of .mid-banner .btn-outline
$pattern = '(?s)\.btn-static-pill\s*\{.*?\}'
$replacement = @'
.btn-static-pill {
    display: inline-block;
    background-color: var(--primary);
    color: white !important;
    font-size: 1rem;
    font-weight: 700;
    padding: 13px 34px; /* Matched to greeting page mid-banner button size */
    border-radius: 50px; /* Matched to greeting page mid-banner button shape */
    text-decoration: none;
    transition: all 0.3s ease;
    white-space: nowrap;
    border: none;
    line-height: normal;
}
'@

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Matched CTA button size to Greeting page Mid-Banner button."
}
else {
    Write-Host "Pattern not found."
}
