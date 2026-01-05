$path = "c:\Users\pc\Desktop\bong2\business_design1.html"

# 1. Read the file as raw bytes to inspect and handle encoding properly manually
# Or simpler: Force read as UTF8 and Force write as UTF8 with BOM to ensure browser recognizes it
# The user sees '???' which means it was written as ANSI probably or read incorrectly.

$content = Get-Content $path -Raw -Encoding UTF8

# Since the previous write might have already messed up the chars to '??', we need to restore the logic.
# However, if I wrote "10분 안에..." in the script, and executed it in a non-UTF8 console, it might have written garbage.
# The safest way is to use HTML entities or ensure the powershell session handles UTF8 processing.

# Restore the correct text
$brokenTextRegex = '(?s)<a href="#" class="btn-static-pill">.*?</a>'
$correctHtml = '<a href="#" class="btn-static-pill">10분 안에 내 사이트 만나보기</a>'

if ($content -match $brokenTextRegex) {
    $content = $content -replace $brokenTextRegex, $correctHtml
}

# 2. Add explicit meta charset if missing (though it was there)
# Just to be sure, we write back explicitly with UTF8 encoding
[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)

Write-Host "Restored text with explicit UTF8 encoding."
