$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Ensure header container matches layout perfectly
$headerContainerStyle = @'
header .container {
    max-width: 1200px !important;
    width: 100% !important;
    margin: 0 auto !important;
    padding: 0 20px !important;
    overflow: visible !important;
    display: flex;
    align-items: center;
}
'@

# Ensure nav spans full width
$navStyle = @'
nav {
    width: 100% !important;
    display: flex;
    align-items: center;
    position: relative;
    overflow: visible !important;
    padding: 0 !important;
}
'@

# Force Right Area to align absolutely to the right
$navRightStyle = @'
.nav-right-area {
    display: flex !important;
    align-items: center !important;
    justify-content: flex-end !important;
    flex: 1 !important;
    width: auto !important; /* Let flex grow handle it */
    margin-left: auto !important;
    margin-right: 0 !important;
    padding-right: 0 !important;
}

.nav-links {
    display: flex !important;
    gap: 15px !important; /* Restore comfortable gap */
    margin-right: 0 !important;
    padding-right: 0 !important;
    align-items: center !important;
}

/* Ensure the last item (button) has no margin right */
.nav-links li:last-child {
    margin-right: 0 !important;
}

.nav-links li:last-child a.btn {
    margin-right: 0 !important;
}
'@

# Apply specific replacements to ensure these rules take precedence
# We will append these highly specific overrides to the end of the file to guarantee they win

Add-Content $path -Value "`n/* Forced Alignment Overrides */`n$headerContainerStyle`n$navStyle`n$navRightStyle" -Encoding UTF8
Write-Host "Appended forced alignment styles."
