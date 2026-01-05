$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# 1. Remove the previously added element-specific animations for the CTA Banner
$patternToRemove = '(?s)/\* Animations for CTA Banner \(Business Page\) \*/.*?\.cta-banner\.visible \.btn-static-pill\s*\{.*?animation-delay: 0\.6s;.*?\}'
$content = $content -replace $patternToRemove, ""

# 2. Add the new "Slide Up" animation for the entire CTA Banner section
$newCTAAnimation = @'

/* New Scroll-Up Animation for the entire CTA Banner */
.cta-banner.scroll-animate {
    opacity: 0 !important;
    transform: translateY(100px) !important; /* Start from below */
    transition: opacity 1.2s ease-out, transform 1.2s ease-out !important;
    will-change: opacity, transform;
}

.cta-banner.scroll-animate.visible {
    opacity: 1 !important;
    transform: translateY(0) !important; /* Move to original position */
}

/* Ensure children are visible instantly since the parent is animating */
.cta-banner h2, 
.cta-banner p, 
.cta-banner .btn-static-pill {
    opacity: 1 !important;
}
'@

# Cleanup any potential leftover fragments and append new style
$content = $content.Trim() + "`n" + $newCTAAnimation
Set-Content $path -Value $content -Encoding UTF8
Write-Host "Updated CTA Banner to uses a single section-wide slide-up animation."
