param(
  [Parameter(Mandatory=$true)][string]$InputPath,
  [Parameter(Mandatory=$true)][string]$OutputPath
)

# Ensure paths are absolute relative to script location if needed
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Push-Location (Split-Path -Parent $root)
try {
  if (-not (Test-Path $InputPath)) {
    throw "Input file not found: $InputPath"
  }

  $tempDir = Join-Path $env:TEMP ("pptx_" + [IO.Path]::GetFileNameWithoutExtension($InputPath) + "_" + (Get-Date -Format 'yyyyMMddHHmmss'))
  New-Item -ItemType Directory -Path $tempDir | Out-Null

  # Extract pptx (pptx is a zip container) - copy with .zip extension for Expand-Archive
  $zipCopy = Join-Path $tempDir 'input.zip'
  Copy-Item -Path $InputPath -Destination $zipCopy -Force
  Expand-Archive -Path $zipCopy -DestinationPath $tempDir -Force

  $slidesDir = Join-Path $tempDir 'ppt/slides'
  if (-not (Test-Path $slidesDir)) {
    throw "Slides directory not found in PPTX: $slidesDir"
  }

  # We'll create the namespace manager per slide document

  $sb = New-Object System.Text.StringBuilder

  $title = [IO.Path]::GetFileNameWithoutExtension($InputPath)
  [void]$sb.AppendLine("# $title")
  [void]$sb.AppendLine()
  [void]$sb.AppendLine("> Automatisch aus PowerPoint konvertiert (nur Text - Bilder/Layouts nicht enthalten)")
  [void]$sb.AppendLine()

  # Process slides in order
  $slideFiles = Get-ChildItem -Path $slidesDir -Filter 'slide*.xml' | Sort-Object {
    [int]($_.BaseName -replace 'slide','')
  }

  $slideIndex = 0
  foreach ($slide in $slideFiles) {
    $slideIndex++
  # Read slide XML as UTF-8 to preserve umlauts on Windows PowerShell 5
  $bytes = [IO.File]::ReadAllBytes($slide.FullName)
  $xmlText = [System.Text.Encoding]::UTF8.GetString($bytes)
  [xml]$xml = $xmlText
  $ns = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
  $ns.AddNamespace('p', 'http://schemas.openxmlformats.org/presentationml/2006/main')
  $ns.AddNamespace('a', 'http://schemas.openxmlformats.org/drawingml/2006/main')

    # Collect paragraphs of text in order
    $paragraphs = @()
    $pNodes = $xml.SelectNodes('//p:sp/p:txBody/a:p', $ns)
    foreach ($p in $pNodes) {
      $runs = $p.SelectNodes('a:r/a:t', $ns)
      if ($runs -and $runs.Count -gt 0) {
        $text = ($runs | ForEach-Object { $_.'#text' }) -join ''
      } else {
        # Also check for field text a:fld/a:r/a:t
        $runs2 = $p.SelectNodes('a:fld/a:r/a:t', $ns)
        $text = ($runs2 | ForEach-Object { $_.'#text' }) -join ''
      }
      if ([string]::IsNullOrWhiteSpace($text)) { continue }
      $paragraphs += $text.Trim()
    }

    if ($paragraphs.Count -eq 0) { continue }

    $slideTitle = $paragraphs[0]
  [void]$sb.AppendLine("## Folie $slideIndex - $slideTitle")
    [void]$sb.AppendLine()
    foreach ($line in $paragraphs | Select-Object -Skip 1) {
      [void]$sb.AppendLine("- $line")
    }
    [void]$sb.AppendLine()
  }

  # Write output
  $outDir = Split-Path -Parent $OutputPath
  if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }
  $utf8Bom = New-Object System.Text.UTF8Encoding($true)
  [IO.File]::WriteAllText($OutputPath, $sb.ToString(), $utf8Bom)

} finally {
  Pop-Location
  if (Test-Path $tempDir) { Remove-Item -Recurse -Force $tempDir }
}

Write-Host "Markdown export created at: $OutputPath"
