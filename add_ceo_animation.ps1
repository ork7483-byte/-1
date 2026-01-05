$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

$ceoAnimationStyles = @'

/* CEO Section Animations */
.ceo-section .ceo-img,
.ceo-section .ceo-text h3,
.ceo-section .ceo-text .highlight-text,
.ceo-section .ceo-text p,
.ceo-section .ceo-text .signature {
    opacity: 0; /* Initially hidden */
    animation: fadeInUp 0.8s ease-out forwards;
}

/* Staggered Delays for CEO Section */
.ceo-section .ceo-img {
    animation-delay: 0.2s;
}

.ceo-section .ceo-text h3 {
    animation-delay: 0.3s;
}

.ceo-section .ceo-text .highlight-text {
    animation-delay: 0.4s;
}

.ceo-section .ceo-text p {
    animation-delay: 0.5s;
}

.ceo-section .ceo-text .signature {
    animation-delay: 0.6s;
}
'@

Add-Content $path -Value $ceoAnimationStyles -Encoding UTF8
Write-Host "Added fade-in animations to CEO section."
