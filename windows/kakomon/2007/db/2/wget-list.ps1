
$webClient = New-Object System.Net.WebClient 

$PdfUrls = Get-Content pdf_url.txt

for ( $i = 1; $i -le $PdfUrls.Length; $i++ ){
  $webClient.DownloadFile($PdfUrls[$i - 1], ($PdfUrls[$i - 1]).Substring(($PdfUrls[$i - 1]).LastIndexOf("/") + 1))
}
