function Get-VBAzLicense {
    <#
    .SYNOPSIS
    Get License
    #>
    [CmdletBinding()]
    Param (
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
    Invoke-VBAzRestMethod -Resource "/api/v1/license"
}