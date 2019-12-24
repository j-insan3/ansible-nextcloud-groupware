require ["fileinto"];
if header :is "X-Spam-Flag" "YES"
{
    fileinto "Junk";
    stop;
}

