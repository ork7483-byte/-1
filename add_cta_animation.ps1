$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

$newCSS = @'

/* Animations for CTA Banner (Business Page) */
.cta-banner h2,
.cta-banner p,
.cta-banner .btn-static-pill {
    opacity: 0;
    will-change: opacity, transform;
}

.cta-banner.visible h2,
.cta-banner.visible p,
.cta-banner.visible .btn-static-pill {
    animation: fadeInUp 0.8s ease-out forwards;
}

.cta-banner.visible h2 {
    animation-delay: 0.2s;
}

.cta-banner.visible p {
    animation-delay: 0.4s;
}

.cta-banner.visible .btn-static-pill {
    animation-delay: 0.6s;
}
'@

Add-Content $path -Value "`n$newCSS" -Encoding UTF8
Write-Host "Added scroll-reveal animations for CTA Banner."
