# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::cve_2026_31431
# ==========================================================================
# @cvemitigate::cve_2026_31431  
# Mitigation for 
# https://copy.fail/#mitigation
#
# @example lu::config
#   include lu::config
# ==========================================================================

class cvemitigate::cve_2026_31431 {
  # Test Vulnerability 
  #file { 'cve_2026_31431':
  #  ensure => file,
  #  path   => '/tmp/cve_2026_31431.py',
  #  owner  => 'locadmin',
  #  mode   => '0700',
  #  source => 'puppet:///modules/cvemitigate/cve_2026_31431/cve_2026_31431.py',
  #}

  exec { 'update_initramfs':
    command     => '/usr/sbin/update-initramfs -u',
    refreshonly => true,
  }

  exec { 'reboot_sys':
    command     => 'shutdown -r +1',
    refreshonly => true,
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }

  file { 'modprobe-disable-algif-conf' :
    path    => '/etc/modprobe.d/disable-algif.conf',
    content => 'install algif_aead /bin/false',
    notify  => [Exec['update_initramfs'],Exec['reboot_sys']],
  }
}
