$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Remove the weird spaced-out garbage block if it exists.
# We'll use a regex that matches the spaced pattern roughly.
# The pattern seems to be "/ *   S u b".
# We will match from that start to the start of the valid block.

$validBlockStart = "/* Sub Visual Styles */"

if ($content -match "/ \*   S u b") {
    Write-Host "Found garbage block. Removing..."
    # Split by the garbage signature
    $parts = $content -split "/ \*   S u b"
    
    # $parts[0] should be the good CSS before the garbage.
    # We also need to keep the valid block that comes AFTER the garbage.
    # The valid block usually starts with the clean signature.
    
    # Check if the clean signature exists in the content
    if ($content -match [regex]::Escape($validBlockStart)) {
        $finalParts = $content -split [regex]::Escape($validBlockStart)
        # We likely have: [Good CSS + Garbage] [Valid New Block]
        # We want: [Good CSS] [Valid New Block]
        
        # Taking the part strictly before the garbage signature
        $cleanPrefix = $parts[0]
        
        # Re-assemble
        $newContent = $cleanPrefix + $validBlockStart + $finalParts[$finalParts.Length - 1]
        Set-Content $path -Value $newContent -Encoding UTF8
        Write-Host "Garbage removed."
    }
}

# Now explicitly update the .sub-eyebrow rule to match the user's latest image perfectly.
$cssUpdate = @'
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
'@

$content = Get-Content $path -Raw -Encoding UTF8
$regex = '(?s)\.sub-visual-content \.sub-eyebrow\s*\{.*?\}'

if ($content -match $regex) {
    if ($content -notmatch "font-size: 18px") { 
        # Only replace if it looks different or just force it anyway
        $content = $content -replace $regex, $cssUpdate
        Set-Content $path -Value $content -Encoding UTF8
        Write-Host "Updated .sub-eyebrow styles."
    }
    else {
        # Force update to be sure
        $content = $content -replace $regex, $cssUpdate
        Set-Content $path -Value $content -Encoding UTF8
        Write-Host "Re-applied .sub-eyebrow styles."
    }
}
else {
    Add-Content $path -Value $cssUpdate -Encoding UTF8
    Write-Host "Appended .sub-eyebrow styles."
}
