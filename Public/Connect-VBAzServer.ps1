function Connect-VBAzServer {
    <#
    .SYNOPSIS
    Connect to Veeam Backup for Microsoft Azure server
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        $Server,
        
        [Parameter(Mandatory = $True)]
        [PSCredential]
        $Credential,

        [Parameter(Mandatory = $false, HelpMessage = 'Trust all certs ?')]
        [Bool]$TrustAllCerts = $True
    )
    
    Begin {
        $UserName = $Credential.UserName
        $Password = $Credential.GetNetworkCredential().Password

        write-debug "User: $UserName"
        write-debug	"Pass: $Password"

        if ($TrustAllCerts) {
            Unblock-Certs
        }

        $script:BaseUrl = $BaseUrl + $Server
    }
    
    Process {
        Get-VBAzLogin -Username $UserName -Password $Password -Verbose
        $DefaultSession.IsConnected = if ($DefaultSession.headers) { $true } else { $false }
        $DefaultSession.Host = $Server
        $DefaultSession.Headers = if ($DefaultSession.headers) { [hashtable]$DefaultSession.headers } else { $null }
    }
    
    End {
        $DefaultSession
    }
}