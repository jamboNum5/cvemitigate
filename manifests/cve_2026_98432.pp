# @summary A short summary of the purpose of this class
#
# The pro fix command will apply if it is able to, if it run successfully
# then this will place a marker file to confirm it is has applied properly.
# 
# @example
#   include cvemitigate::cve_2026_98432
class cvemitigate::cve_2026_98432 {
  exec { 'fix_cve_2026_98432' :
    command => 'pro fix CVE-2026-98432 && sudo touch /opt/lboro/CVE-2026-98432',
    unless  => 'test -f /opt/lboro/CVE-2026-98432',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }
}
