$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Refined professional look for the static pill button
$pattern = '(?s)\.btn-static-pill\s*\{.*?\s*padding:\s*18px\s*45px;.*?\}'
$replacement = @'
.btn-static-pill {
    display: inline-block;
    background-color: var(--primary);
    color: white !important;
    font-size: 1.1rem;
    font-weight: 800; /* Extra bold for visibility */
    padding: 16px 50px; /* Sleeker, flatter ratio */
    border-radius: 100px;
    text-decoration: none;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    white-space: nowrap;
    border: none;
    line-height: normal;
    letter-spacing: -0.5px; /* Tighter letter spacing for modern look */
    box-shadow: 0 8px 25px rgba(255, 152, 0, 0.3); /* Subtle orange glow */
}
'@

if ($content -match $pattern) {
    $content = $content -replace $pattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Refined CTA button style."
}
else {
    # If pattern slightly changed, use a broader regex or append
    $broadPattern = '(?s)\.btn-static-pill\s*\{.*?\}'
    $content = $content -replace $broadPattern, $replacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Refined CTA button style (broad match)."
}
