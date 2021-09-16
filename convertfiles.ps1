if (!(Test-Path Archive))
{
    New-Item -Name "Archive" -ItemType "directory"
}

$fileIn = Get-ChildItem -File -Filter '*.heic'
foreach ($fileName in $fileIn)
{
    #write-host $fileName.basename is a $fileName.extension
    $fileNameNew = $fileName.BaseName + ".png"
    magick $fileName.name $fileNameNew
    Move-Item $fileName Archive
}