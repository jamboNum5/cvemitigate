# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate
class cvemitigate (
  Boolean   $test_cve_2026_31431 = $cvemitigate::params::test_cve_2026_31431,
  Boolean   $fix_cve_2026_31431 = $cvemitigate::params::fix_cve_2026_31431,
  Boolean   $test_dirty_frag = $cvemitigate::params::test_dirty_frag,
  Boolean   $fix_dirty_frag = $cvemitigate::params::fix_dirty_frag,
) inherits cvemitigate::params {
}
