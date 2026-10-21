# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::emudhra
class cvemitigate::emudhra {
  $ca_fixed = "20260816ubuntu0.${facts['os']['release']['major']}.1"

  if ($facts['ca_certificates'] != $ca_fixed) {
    notify { 'widtdt':
      name     => $facts['ca_certificates'],
      loglevel => 'err',
    }
    exec { 'ca-apt-update' :
      command => '/usr/bin/apt update',
    }
  }
}
