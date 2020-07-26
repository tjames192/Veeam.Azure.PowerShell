function Get-VBAzLogin {
    <#
    .SYNOPSIS
    Get Login
	#>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        $Username,
        
        [Parameter(Mandatory = $true)]
        $Password,
        
        [Parameter(Mandatory = $false)]
        $refresh_token = 'refresh_token',
        
        [Parameter(Mandatory = $false)]
        $grant_type = 'Password'
    )
    
    Begin {
        $Resource = "$BaseUrl/api/oauth2/token"
        
        # required defaults
        $json = [ordered]@{
            Username = $Username
            Password = $Password
            refresh_token = $refresh_token
            grant_type = $grant_type
        }
        
        $params = @{
			Uri = $Resource
			Method   = 'Post'
            Body = $json
            ErrorVariable = 'apiErr'
            SessionVariable = 'Session'
        }
    }
    
    Process {
        Write-Verbose -Message "[$($MyInvocation.MyCommand)]"
    }
    
    End {
        try {
            $response = Invoke-RestMethod @params

            Set-VBAzAuthorization -response $response -Session $Session
        }
        catch {
            Write-warning $apiErr.InnerException
        }
    }
}
