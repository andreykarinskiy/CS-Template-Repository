param([String]$target, [string]$from, [String]$to)
((Get-Content -path $target -Raw) -replace $from, $to) | Set-Content -Path $target