$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

$midBannerAnimation = @'

/* Mid Banner Animations */
.mid-banner p,
.mid-banner h2,
.mid-banner .btn {
    opacity: 0; /* Initially hidden */
    animation: fadeInUp 0.8s ease-out forwards;
}

/* Staggered Delays for Mid Banner */
/* Assuming user scrolls down, we might want a slight delay or just standard staggering. 
   Since it's further down the page, we'll keep delays short so it plays if visible, 
   or relies on the fact that simple CSS animations run on load. 
   (Note: Ideally this would use IntersectionObserver, but per pattern we use CSS) */

.mid-banner p {
    animation-delay: 0.5s;
}

.mid-banner h2 {
    animation-delay: 0.7s;
}

.mid-banner .btn {
    animation-delay: 0.9s;
}
'@

Add-Content $path -Value $midBannerAnimation -Encoding UTF8
Write-Host "Added fade-in animations to Mid Banner section."
