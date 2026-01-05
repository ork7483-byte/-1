$path = "c:\Users\pc\Desktop\bong2\style.css"
$content = Get-Content $path -Raw -Encoding UTF8

# Define the new styles based on the user's reference image
# Font size reduced, more compact layout, specific spacing
$newHistoryStyles = @'
/* Updated History Styling to Match Reference */

/* Month Title (e.g., 12월) */
.month-title {
    font-size: 1.1rem !important; /* Reduced from 1.5rem */
    font-weight: 700 !important;
    margin-bottom: 8px !important;
    color: #111 !important; /* Darker black for better readability */
    letter-spacing: -0.02em !important;
}

/* Month Description (e.g., 회사 연혁 내용...) */
.month-desc {
    font-size: 0.95rem !important; /* Reduced from 1rem */
    color: #888 !important; /* Grey color as per image */
    line-height: 1.5 !important;
    font-weight: 400 !important;
    letter-spacing: -0.01em !important;
}

/* Year Suffix (e.g., 24, 23) inside the block */
.year-suffix {
    font-size: 3rem !important; /* Keeping year visually distinct but slightly balanced */
    font-weight: 700 !important;
    color: var(--primary) !important; /* Orange/Yellow */
    line-height: 1 !important;
    margin-right: 40px !important; /* Space between Year and Month list */
    letter-spacing: -0.03em !important;
}

/* Adjusting the timeline dot position if needed */
.month-item::before {
    /* Ensure dot aligns well with the smaller text */
    top: 3px !important; 
    width: 12px !important;
    height: 12px !important;
    left: -47px !important; /* Slight adjust due to size change */
}

/* Spacing between items */
.month-item {
    margin-bottom: 30px !important; /* More breathing room between months */
}
'@

Add-Content $path -Value "`n$newHistoryStyles" -Encoding UTF8
Write-Host "Appended updated history styles to match reference image."
