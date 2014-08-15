# == Class: nservicebus::powershell_module
#
# Installs NServiceBus powershell tools.
# The default behaviour is to install these from the Particular-maintained package in the public NuGet feed, using chocolately.
# The package name, provider and source can all be customised, though.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { nservicebus:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class nservicebus::powershell_tools (
  $package_name       = $nservicebus::params::powershell_tools_package_name,
  $package_version    = $nservicebus::params::powershell_tools_version,
  $package_provider   = $nservicebus::params::powershell_tools_installation_provider,
  $package_source     = $nservicebus::params::powershell_tools_installation_source,
) inherits nservicebus::params {

  package{'NServiceBusPowershellTools':
    name      => $package_name,
    ensure    => $package_version,
    provider  => $package_provider,
    source    => $package_source
  }

}
