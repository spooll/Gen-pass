<#
    .SYNOPSIS
        Generates passwords with 256 symbols maximum. 
 
    .PARAMETER Many
        How many symbols will be
 
    .PARAMETER Spec
        How many special symbols
 
    .PARAMETER Amount
        How many passwords will be generated     
 
    .EXAMPLE
        Gen-Pass -Many 126
        Gen-Pass -Many 126 -Spec 120
        Gen-Pass -Many 126 -Spec 120 -Amount 5
#>

function Gen-Pass {
    param (
    [int]$Many=18,
    [int]$Spec=2,
    [int]$Amount=1
    )

    [Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null
    1..$amount|ForEach-Object {
        if ($many -ge 129)
        {
            $manys=$many - 128
            $p1=[System.Web.Security.Membership]::GeneratePassword(128,$spec)
            $p2=[System.Web.Security.Membership]::GeneratePassword($manys,0)
            Write-Output ($p1 + $p2)
            ""
        }
        else{
        [System.Web.Security.Membership]::GeneratePassword($many,$spec)
        }
    }
}
