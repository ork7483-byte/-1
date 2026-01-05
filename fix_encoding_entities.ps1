
$path = "c:\Users\pc\Desktop\bong2\business_design1.html"

# Read raw
$content = Get-Content $path -Raw

# Use regex to target the button and replace with HTML Entities to bypass ANY encoding issues
# Pattern looks for class="btn-static-pill"> ... </a>
$pattern = 'class="btn-static-pill">.*?</a>'
$safeReplacement = 'class="btn-static-pill">10&#48516; &#50504;&#50640; &#45236; &#49324;&#51060;&#53944; &#475cc;&#45208;&#48372;&#44592;</a>'

if ($content -match $pattern) {
    $content = $content -replace $pattern, $safeReplacement
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Replaced with HTML Entities."
}
else {
    Write-Host "Pattern not found."
}
