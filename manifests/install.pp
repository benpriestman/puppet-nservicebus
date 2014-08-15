# define nservicebus::install
#
# Use NServiceBus powershell commands to install components
#
define nservicebus::install (
  $component  = $title,
  $module_path  = undef,
) {
  
  include nservicebus::powershell_tools
  
  if $module_path == undef {
    case $nservicebus::powershell_tools::package_provider {
      'chocolatey': {
        $real_module_path = '%ChocolateyInstall%'
      }
      default:      {
        fail("I don't know where to find nservicebus powershell tools, when they are installed by ${nservicebus::powershell_tools::package_provider}")
      }
    }  
  } else {
    $real_module_path = $module_path
  }
  $import_module = "Import-Module ${real_module_path}\\lib\\NServiceBus.PowerShell.${nservicebus::powershell_tools::package_version}\\lib\\net40\\NServiceBus.PowerShell.dll"
  
  exec{"install_nservicebus_${title}":
    provider  => 'powershell',
    command   => "${import_module}; Install-NServiceBus${component}",
    unless    => "${import_module}; Test-NServiceBus${component}Installation",
    require   => Package['NServiceBusPowershellTools'],
  }
  
}