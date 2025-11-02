param([Parameter(Mandatory=$true)][string]$Path)
$ErrorActionPreference = 'Stop'
if (-not (Test-Path $Path)) { throw "File not found: $Path" }
$c = Get-Content -LiteralPath $Path -Raw

# Build mapping using actual characters to avoid quoting issues
$map = @(
  @{ from = "Ã¼"; to = "ü" },
  @{ from = "Ãœ"; to = "Ü" },
  @{ from = "Ã¶"; to = "ö" },
  @{ from = "Ã–"; to = "Ö" },
  @{ from = "Ã¤"; to = "ä" },
  @{ from = "Ã„"; to = "Ä" },
  @{ from = "ÃŸ"; to = "ß" },
  @{ from = "â€“"; to = "–" },
  @{ from = "â€”"; to = "—" },
  @{ from = "â€ž"; to = "„" },
  @{ from = "â€œ"; to = "“" },
  @{ from = "â€�"; to = "”" },
  @{ from = "â€˜"; to = "‘" },
  @{ from = "â€™"; to = "’" },
  @{ from = "â€¦"; to = "…" },
  @{ from = "ïƒ¨"; to = "→" },
  @{ from = "ïƒ³"; to = "→" },
  @{ from = "Â";  to = ""  }
)

foreach ($m in $map) {
  $c = $c -replace [Regex]::Escape($m.from), [System.Text.RegularExpressions.MatchEvaluator]{ param($mch) $m.to }
}

Set-Content -LiteralPath $Path -Value $c -Encoding UTF8
Write-Host "Fixed encoding for: $Path"
