$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# CSS animation definitions and application
$animationStyles = @'

/* Animations for Sub Visual Text */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.sub-visual-content .sub-eyebrow,
.sub-visual-content h2,
.sub-visual-content .breadcrumb {
    opacity: 0; /* Instantly hide initially */
    animation: fadeInUp 0.8s ease-out forwards;
}

/* Stagger delays */
.sub-visual-content .sub-eyebrow {
    animation-delay: 0.1s;
}

.sub-visual-content h2 {
    animation-delay: 0.3s;
}

.sub-visual-content .breadcrumb {
    animation-delay: 0.5s;
}
'@

Add-Content $path -Value $animationStyles -Encoding UTF8
Write-Host "Added fade-in animations to sub-visual text."
