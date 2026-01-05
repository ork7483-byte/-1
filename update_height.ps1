$files = Get-ChildItem -Path "c:\Users\pc\Desktop\bong2" -Filter "*.html"

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    if ($content -match "height:\s*350px") {
        $newContent = $content -replace "height:\s*350px", "height: 300px"
        Set-Content $file.FullName -Value $newContent -Encoding UTF8
        Write-Host "Updated $($file.Name) to 300px height."
    }
}
