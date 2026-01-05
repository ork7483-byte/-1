
$path = "c:\Users\pc\Desktop\bong2\business_design1.html"

# Force read using generic encoding to grab raw bytes, then convert properly or just rewrite strictly.
# Since we know the targeted string is corrupted, let's just use the regex to find the garbage and replace it with HTML Entities.
# Using HTML entities is the safest way to bypass console encoding issues.

# "10분 안에 내 사이트 만나보기" in HTML entities:
# 10&#48148; &#50504;&#50640; &#45236; &#49324;&#51060;&#53944; &#475cc;&#45208;&#48372;&#44592;
# Actually let's try direct replacement with UTF8 BOM first using .NET classes which are more reliable than standard PowerShell piping.

$txt = "10분 안에 내 사이트 만나보기"
$html = Get-Content $path -Raw
# The pattern for the button content
$pattern = 'class="btn-static-pill">.*?</a>'
$replacement = 'class="btn-static-pill">10분 안에 내 사이트 만나보기</a>'

# Replace any content inside that tag
$html = [System.Text.RegularExpressions.Regex]::Replace($html, $pattern, $replacement)

# Write with BOM to ensure Windows Editors/Browsers pick it up correctly
[System.IO.File]::WriteAllText($path, $html, [System.Text.Encoding]::GetEncoding("UTF-8"))

Write-Host "Forced UTF-8 with BOM rewrite."
