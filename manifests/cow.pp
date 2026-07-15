# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::cow
#   Release: https://ubuntu.com/blog/pedit-cow-linux-vulnerability-fixes-available

class cvemitigate::cow {
  # Enable Fix
  if ( $cvemitigate::fix_cow == true ) {
    file { 'fix_cow' :
      ensure  => file,
      path    => '/etc/modprobe.d/pedit-cow.conf',
      content => "# Fix Copy-on-Write Issue \ninstall act_pedit /bin/false",
      notify  => Exec['update_initramfs'],
    }
  }
  # Disable Fix
  if ( $cvemitigate::fix_cow == false ) {
    file { 'rm_fix_cow' :
      ensure => absent,
      path   => '/etc/modprobe.d/pedit-cow.conf',
      notify => Exec['update_initramfs'],
    }
  }
}
