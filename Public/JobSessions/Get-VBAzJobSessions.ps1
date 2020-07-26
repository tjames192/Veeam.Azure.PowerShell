function Get-VBAzJobSessions {
    <#
    .SYNOPSIS
    Get job sessions
    #>
    [CmdletBinding()]
    Param (
        $policyName
    )
    
    Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
    
    $results = Invoke-VBAzRestMethod -Resource "/api/v1/jobSessions"
    
    if ($policyName) {
        $whereFilter = @{
            property = 'backupjobinfo'
            ErrorAction = 'SilentlyContinue'
        }
        
        $policyFilter = @{
            FilterScript = {$_.backupjobinfo.policyName -eq $policyName}
        }
        
        $results | where @whereFilter | where @policyFilter
    }
    else {
        $results
    }
}