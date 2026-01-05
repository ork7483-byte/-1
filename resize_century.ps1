$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Regex to find or append .century-col styles and resize it to match the year suffix
# We want the century (20) to match the size of year-suffix (24), which is 3rem in our previous update.

$styleOverride = @'

/* Override Century Column Size */
.century-col {
    font-size: 3rem !important; /* Matches .year-suffix size */
    font-weight: 700 !important;
    line-height: 1 !important;
    color: #111 !important; /* Keep it black but same size */
    letter-spacing: -0.03em !important;
    padding-top: 0 !important; /* Align top */
}

/* Ensure year-suffix is also strictly 3rem */
.year-suffix {
    font-size: 3rem !important;
}
'@

Add-Content $path -Value $styleOverride -Encoding UTF8
Write-Host "Resized century column (20) to match year suffix (24)."
