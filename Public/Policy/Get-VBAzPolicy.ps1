function Get-VBAzPolicy {
    <#
    .SYNOPSIS
    Get policies
    #>
    [CmdletBinding()]
    Param (
        $Name
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
    
    $policies = Invoke-VBAzRestMethod -Resource "/api/v1/policies"
    
    if ($Name) {
        $policies | where {$_.Name -eq $Name}
    }
    else {
        $policies
    }
}