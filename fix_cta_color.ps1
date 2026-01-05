$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Ensure "3초만에 문의하기" button text is always white
# Some pages might be overriding this to black due to transparent headers flipping to white background
# We will enforce white color for .btn-primary in nav

$cssOverride = @'

/* Enforce White Text for CTA Button in Nav */
.nav-links li a.btn-primary,
.nav-links li a.btn-primary span,
.nav-links li a.btn-primary span::after,
header.header-scrolled .nav-links li a.btn-primary,
header.header-scrolled .nav-links li a.btn-primary span {
    color: white !important;
}
'@

Add-Content $path -Value $cssOverride -Encoding UTF8
Write-Host "Enforced white text for CTA button globally."
