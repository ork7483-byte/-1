$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Define the marker for the end of the valid footer CSS
$footerEndMarker = "    .new-footer .footer-bottom {
        flex-direction: column;
        gap: 15px;
        align-items: flex-start;
    }
}"

# We want to keep everything up to and including the footerEndMarker
if ($content -match "(?s)(.*" + [regex]::Escape($footerEndMarker) + ")") {
    $cleanUpToFooter = $matches[1]
    
    # New Styles based on user requests
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
    font-family: 'Pretendard', sans-serif !important;
    font-style: normal !important;
    font-size: 48px !important;
    font-weight: 700 !important;
    line-height: 62px !important;
    color: rgb(255, 255, 255) !important;
    margin: 0 0 30px 0 !important;
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
    
    $finalContent = $cleanUpToFooter + $newStyles
    Set-Content $path -Value $finalContent -Encoding UTF8
    Write-Host "Style.css completely cleaned and h2 updated."
}
else {
    Write-Host "Could not find the footer end marker. Modification skipped to avoid damage."
}
