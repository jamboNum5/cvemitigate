# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::dirty_frag
class cvemitigate::dirty_frag {
  file { 'fix_dirty_frag' :
    ensure  => file,
    path    => '/etc/modprobe.d/dirtyfrag.conf',
    content => 'install esp4 /bin/false
install esp6 /bin/false
install rxrpc /bin/false',
  }
}
