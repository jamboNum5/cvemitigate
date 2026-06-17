# @summary This puppet config is to patch copy/fail
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
  if ( $cvemitigate::test_cve_2026_31431 == true ) {
    file { 'cve_2026_31431':
      ensure => file,
      path   => '/tmp/cve_2026_31431.py',
      owner  => 'locadmin',
      mode   => '0700',
      source => 'puppet:///modules/cvemitigate/cve_2026_31431/cve_2026_31431.py',
    }

    # Only run test if fact is reporting as true
    if ($facts['cve_2026_31431'] == true) or ( $facts['cve_2026_31431'] == undef ) {
      exec { 'cve_2026_31431.test':
        command => 'python3 /tmp/cve_2026_31431.py > /tmp/cve_2026_31431.test 2>&1',
        require => File['cve_2026_31431'],
        user    => 'locadmin',
        creates => '/tmp/cve_2026_31431.test',
        path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      }
    }
  }

  # Allow config to be removed
  if ( $cvemitigate::fix_cve_2026_31431 == true ) {
    file { 'modprobe-disable-algif-conf' :
      path    => '/etc/modprobe.d/disable-algif.conf',
      content => 'install algif_aead /bin/false',
      notify  => Exec['update_initramfs'],
    }
  }
  # Now proper fix has been released, need the ability to roll this back.
  if ( $cvemitigate::fix_cve_2026_31431 == false ) {
    file { 'rm-modprobe-disable-algif-conf' :
      ensure => absent,
      path   => '/etc/modprobe.d/disable-algif.conf',
      notify => Exec['update_initramfs'],
    }
    file { 'rm-modprobe-disable-algif-aead-conf' :
      ensure => absent,
      path   => '/etc/modprobe.d/disable-algif_aead.conf',
      notify => Exec['update_initramfs'],
    }
  }
}
