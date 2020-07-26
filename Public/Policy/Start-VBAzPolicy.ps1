function Start-VBAzPolicy {
    <#
    .SYNOPSIS
    Start policy
    #>
    [CmdletBinding()]
    Param (
        $Name
    )
    
    Begin {
        Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
        $policy = Get-VBAzPolicy -Name $Name
        $id = $policy.id
        
        $resource = "/api/v1/policies/$id/start"
        
        $params = @{
            Resource = $resource
            Method = 'Post'
        }
    }
    
    Process {
        
    }
    
    End {
        Invoke-VBAzRestMethod @params
    }
}