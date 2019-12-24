require "fileinto";

if header :contains "X-Spam-Flag" "YES" {
    fileinto "Junk";
}

if header :is "X-Spam" "Yes" {
    fileinto "Junk";
}
