$targetFiles = @(
    "business_design1.html",
    "business_design2.html",
    "contact.html",
    "faq.html",
    "greeting.html",
    "history.html",
    "location.html",
    "news.html",
    "notice.html",
    "products.html"
)

$newFooter = @'
    <footer class="new-footer">
        <div class="container">
            <div class="footer-top">
                <div class="footer-left">
                    <div class="f-section">
                        <h4>Address</h4>
                        <p>서울특별시 00구 00동</p>
                    </div>
                    <div class="f-section">
                        <h4>Contact</h4>
                        <p>T. 010 1234 1234<br>F. 010 1234 1234</p>
                    </div>
                </div>

                <div class="footer-right">
                    <div class="f-section">
                        <h4>십분의일</h4>
                        <p>대표: 안상언<br>사업자등록번호: 000-00-00000<br>주소: 서울특별시 00구 00동</p>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div>
                    <a href="#">개인정보처리방침</a>
                </div>
                <div>
                    <span>One-tenth. All rights reserved.</span>
                </div>
            </div>
        </div>
    </footer>
'@

foreach ($file in $targetFiles) {
    try {
        $path = Join-Path "c:\Users\pc\Desktop\bong2" $file
        if (Test-Path $path) {
            $content = Get-Content $path -Raw -Encoding UTF8
            # Replace the footer. Using Regex.
            $content = $content -replace '(?s)<footer class="new-footer">.*?</footer>', $newFooter
            Set-Content $path -Value $content -Encoding UTF8
            Write-Host "Updated $file"
        }
        else {
            Write-Host "File not found: $file"
        }
    }
    catch {
        Write-Host "Error updating $file : $_"
    }
}
