$ListADComputer = @()

$ListADComputer = (Get-ADComputer -Filter *).name

if($ListADComputer)
{
    return $ListADComputer
}

$ListADComputer | Out-File C:\Users\loc.BOOY3105.TWEEDEKAMER\Documents\Powershell\ServiceDeskToolKit2.0\HelperFiles\Temp_Files\AllComputers.txt