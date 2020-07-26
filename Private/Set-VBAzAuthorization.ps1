function Set-VBAzAuthorization {
    <#
    .SYNOPSIS
    Set Authorization Headers
	#>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        $Response,

        [Parameter(Mandatory = $true)]
        $Session
    )

    Begin {
        $Session.Headers['authorization'] = $response.token_type + ' '+ $response.access_token
        $DefaultSession.Headers = $Session.Headers
    }

    Process {

    }

    End {
    }
}