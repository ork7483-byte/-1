try {
    $path = "c:\Users\pc\Desktop\bong2\style.css"
    # Attempt to read with default encoding (which usually detects UTF8/16 mix in PS)
    $content = Get-Content $path -Raw
    # Write back as Force UTF8
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "File encoding fixed."
}
catch {
    Write-Error $_
}
