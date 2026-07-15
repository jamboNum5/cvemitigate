# @summary Main class, includes all other classes.
#
# @see https://gitlab.lboro.ac.uk/MUS/lu
#
# Initialise module, bring in manifests, to test and fix issues.
# @example
#   include cvemitigate
# @param test_cve_2026_31431
#   Toggle switch to test test_cve_2026_31431
# @param fix_cve_2026_31431
#   Toggle switch to test test_cve_2026_31431
# 
# @param test_dirty_frag
#   Test fix for Dirty Frag
# @param fix_dirty_frag
#   Toggle fix for dirty frag
#
# @param test_cow
#  Test fix for Copy-on-write issue
# @param fix_cow
#  Fix Copy-on-write issue

class cvemitigate (
  Boolean   $test_cve_2026_31431 = $cvemitigate::params::test_cve_2026_31431,
  Boolean   $fix_cve_2026_31431 = $cvemitigate::params::fix_cve_2026_31431,

  Boolean   $test_dirty_frag = $cvemitigate::params::test_dirty_frag,
  Boolean   $fix_dirty_frag = $cvemitigate::params::fix_dirty_frag,

  Boolean   $test_cow = $cvemitigate::params::test_cow,
  Boolean   $fix_cow = $cvemitigate::params::fix_cow,
) inherits cvemitigate::params {
# Include Fixes
# Enabling/disabling fix is controlled via Puppet ENC variables
  include cvemitigate::dirty_frag
  include cvemitigate::cve_2026_31431
  include cvemitigate::cow

# Reusable Commands
  exec { 'update_initramfs':
    command     => '/usr/sbin/update-initramfs -u -k all',
    refreshonly => true,
  }

  exec { 'reboot_sys':
    command     => 'shutdown -r +1',
    refreshonly => true,
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }
}
