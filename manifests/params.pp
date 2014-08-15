# class nservicebuss::params
#
# Default parameters for nservicebus. Can and should be overried by hiera lookups.
#
class nservicebus::params {
  $powershell_tools_package_name          = 'NServiceBus.PowerShell'
  $powershell_tools_version               = '4.3.0'
  $powershell_tools_installation_provider = 'chocolatey'
  $powershell_tools_installation_source   = 'http://packages.nuget.org/v1/FeedService.svc/'
}