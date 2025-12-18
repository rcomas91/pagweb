$in = 'C:\Users\ray\Desktop\PROYECTOS\pagweb\assets\me.jpeg'
$out = 'C:\Users\ray\Desktop\PROYECTOS\pagweb\assets\guide.jpg'
Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile($in)
$maxW = 800
if ($img.Width -gt $maxW) {
  $ratio = $maxW / $img.Width
  $newW = [int]([Math]::Round($img.Width * $ratio))
  $newH = [int]([Math]::Round($img.Height * $ratio))
} else {
  $newW = $img.Width
  $newH = $img.Height
}
$thumb = New-Object System.Drawing.Bitmap $newW, $newH
$g = [System.Drawing.Graphics]::FromImage($thumb)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g.DrawImage($img, 0,0, $newW, $newH)
$g.Dispose()
$enc = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
$eps = New-Object System.Drawing.Imaging.EncoderParameters 1
$param = New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, 85)
$eps.Param[0] = $param
$thumb.Save($out, $enc, $eps)
$img.Dispose()
$thumb.Dispose()
Write-Host "Saved optimized image: $out"
