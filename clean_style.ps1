$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw
# The garbage starts after the last valid closing brace of the media query.
# We'll search for the signature of the garbage "S u b" and cut before it.

# Finding the valid end: The last valid CSS was likely the footer media query.
$endMarker = "/* Sub Visual Styles */" 
# Note: The file currently has spaced out characters, so we might not find normal text easily if we look for the garbage.
# But we can look for the last valid "}" of the media query.

if ($content -match "}\s*/ \*   S u b") {
    $parts = $content -split "}\s*/ \*   S u b"
    $cleanContent = $parts[0] + "}"
}
else {
    # If pattern slightly different, try to just take substring if length is huge
    # Or fallback to just appending if we can't find it (but we want to remove garbage)
    # Let's try aggressive truncate if we see the spaced text
    if ($content -match "S u b") {
        $cleanContent = $content.Substring(0, $content.IndexOf("/ *   S u b"))
        # Check if we cut off a closing brace
        if (-not $cleanContent.Trim().EndsWith("}")) {
            $cleanContent = $cleanContent.Trim() + "}" 
        }
    }
    else {
        $cleanContent = $content
    }
}

$newStyles = @'

/* Sub Visual Styles */
.sub-visual-content .sub-eyebrow {
    font-family: 'Pretendard', sans-serif !important;
    font-style: normal !important;
    font-size: 18px !important;
    font-weight: 700 !important;
    line-height: 18px !important;
    color: rgb(230, 230, 230) !important;
    display: block;
    margin-bottom: 24px;
    letter-spacing: 0 !important;
}

.sub-visual-content h2 {
    font-size: 5rem !important;
    font-weight: 800 !important;
    margin: 0 0 30px 0 !important;
    color: #FFFFFF !important;
    line-height: 1.1;
    letter-spacing: -2px;
}

.sub-visual-content .breadcrumb {
    font-size: 1.1rem !important;
    opacity: 0.7 !important;
    font-weight: 400 !important;
    color: #FFFFFF !important;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 15px;
}
'@

$finalContent = $cleanContent + $newStyles
Set-Content $path -Value $finalContent -Encoding UTF8
Write-Host "Style.css cleaned and updated."
