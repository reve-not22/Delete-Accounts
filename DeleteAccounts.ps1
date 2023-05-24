$excludeList = "admin", "cteadmin", "CTEAdmin", "Admin", "Damian D"

$input = Read-Host 'Please input an account you would like to keep, or type N to ignore'
if (($input -ne 'N') -or ($input -ne ' ')) {
	$excludeList += $input
}
Get-ChildItem -Path C:\Users |

Foreach-Object { 
	$isInList = 0
	foreach ($n in $excludeList) {
		if ($_.Name -eq $n) {
			$isInList = 1
		}	
	}
	if ($isInList -ne 1) {
		Write-Host "Deleting: " $_.Name
		Remove-LocalUser -Name $_.Name
		Remove-Item $_.FullName -Recurse
	}
}