$path = "c:\Users\pc\Desktop\bong2\business_design1.html"
$content = Get-Content $path -Raw -Encoding UTF8

# We need to change the CTA button from using "btn btn-primary" (which has rolling text styles)
# to a new class like "btn-static-pill" that is purely a static link button.
# This avoids the complex nested span structure and padding conflicts in CSS.

# 1. Define the new button HTML directly
$oldBtnPattern = '(?s)<a href="#" class="btn btn-primary"[^>]*?>.*?</a>'
$newBtnHTML = '<a href="#" class="btn-static-pill">10분 안에 내 사이트 만나보기</a>'

if ($content -match $oldBtnPattern) {
    # Replace the HTML
    $content = $content -replace $oldBtnPattern, $newBtnHTML
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Replaced button HTML with new static class."
}

# 2. Add the CSS for .btn-static-pill directly to style.css to ensure it works perfect.
$cssPath = "c:\Users\pc\Desktop\bong2\style.css"
$cssContent = Get-Content $cssPath -Raw -Encoding UTF8
$newCSS = @'
/* Special Static CTA Button for Business Page */
.btn-static-pill {
    display: inline-block;
    background-color: var(--primary);
    color: white !important;
    font-size: 1.6rem;
    font-weight: 700;
    padding: 25px 100px; /* Generous padding */
    border-radius: 100px; /* Full pill shape */
    text-decoration: none;
    transition: transform 0.3s ease;
    white-space: nowrap;
    border: none;
    line-height: normal; /* Reset line-height */
}
.btn-static-pill:hover {
    transform: scale(1.05);
    background-color: #e69500; /* Slightly darker orange */
    color: white !important;
}
'@

Add-Content $cssPath -Value "`n$newCSS" -Encoding UTF8
Write-Host "Added CSS for .btn-static-pill."
