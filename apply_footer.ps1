$targetFiles = @(
    "business_design1.html",
    "business_design2.html",
    "contact.html",
    "faq.html",
    "greeting.html",
    "history.html",
    "location.html",
    "news.html",
    "notice.html",
    "products.html"
)

# Read the correct footer content explicitly as UTF8
$footerHTML = Get-Content "c:\Users\pc\Desktop\bong2\footer_content.txt" -Raw -Encoding UTF8

foreach ($file in $targetFiles) {
    $path = Join-Path "c:\Users\pc\Desktop\bong2" $file
    if (Test-Path $path) {
        Write-Host "Processing $file"
        $content = Get-Content $path -Raw -Encoding UTF8
        
        # Regex to match the footer block
        $regex = '(?s)\s*<footer\s+class="new-footer">.*?</footer>'
        
        if ($content -match $regex) {
            $content = $content -replace $regex, $footerHTML
            Set-Content $path -Value $content -Encoding UTF8
            Write-Host "  -> Updated with correct encoding."
        }
        else {
            Write-Host "  -> Footer pattern not found in $file"
        }
    }
    else {
        Write-Host "File not found: $file"
    }
}
