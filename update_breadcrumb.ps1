$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Define the marker for the breadcrumb style block
$breadcrumbRegex = '(?s)\.sub-visual-content \.breadcrumb\s*\{.*?\}'

# New Styles based on user requests
$newBreadcrumbStyle = @'
.sub-visual-content .breadcrumb {
    font-family: 'Pretendard', sans-serif !important;
    font-style: normal !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    line-height: 16px !important;
    color: rgb(207, 207, 207) !important;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 15px;
    opacity: 1 !important; /* Override previous opacity if needed, since color is explicit */
}
'@

if ($content -match $breadcrumbRegex) {
    $content = $content -replace $breadcrumbRegex, $newBreadcrumbStyle
    Set-Content $path -Value $content -Encoding UTF8
    Write-Host "Updated breadcrumb styles."
}
else {
    Add-Content $path -Value $newBreadcrumbStyle -Encoding UTF8
    Write-Host "Appended breadcrumb styles."
}
