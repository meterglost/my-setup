#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"


$InterfaceList = Get-NetAdapter | Where-Object { $_.Status -Eq "Up" -And $_.InterfaceDescription -NotLike "*Virtual*" }
$InterfaceList = $InterfaceList | Where-Object { $_.InterfaceAlias -Like "*Wi-Fi*" -or $_.InterfaceAlias -Like "*Ethernet*" }


$DnsServerList = @(
    [PSCustomObject]@{
        Name = "Cloudflare"
        Host = "one.one.one.one"
        Addr = @("1.1.1.1", "1.0.0.1", "2606:4700:4700::1111", "2606:4700:4700::1001")
    },
    [PSCustomObject]@{
        Name = "Quad9"
        Host = "dns.quad9.net"
        Addr = @("9.9.9.9", "149.112.112.112", "2620:fe::fe", "2620:fe::9")
    },
    [PSCustomObject]@{
        Name = "Google"
        Host = "dns.google"
        Addr = @("8.8.8.8", "8.8.4.4", "2001:4860:4860::8888", "2001:4860:4860::8844")
    }
)


ForEach ($DnsServer in $DnsServerList) {
    try {
        $DnsServer.Addr = Resolve-DnsName -Name $DnsServer.Host -DnsOnly -NoHostsFile | Select-Object -ExpandProperty IPAddress
        Write-Host "- Successfully update $($DnsServer.Name) DNS server addresses."
    }
    catch {
        Write-Warning "- Failed to update $($DnsServer.Name) DNS server addresses. Using default addresses."
    }
}


Write-Host


ForEach ($Interface in $InterfaceList) {
    ForEach ($DnsServer in $DnsServerList) {
        try {
            Set-DnsClientServerAddress -InterfaceAlias $Interface.InterfaceAlias -ServerAddresses ($DnsServer.Addr -join ',') -Validate
            Write-Host "- Successfully config $($DnsServer.Name) DNS for $($Interface.InterfaceAlias) interface."
            break
        }
        catch {
            Write-Warning "- Failed to config $($DnsServer.Name) DNS for $($Interface.InterfaceAlias) interface."
        }
    }
}


Clear-DnsClientCache
