# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::dirty_frag
class cvemitigate::dirty_frag {
  # fix_dirty_frag
  if ( $cvemitigate::fix_dirty_frag == true ){
    file { 'fix_dirty_frag' :
      ensure  => file,
      path    => '/etc/modprobe.d/dirtyfrag.conf',
      content => '# Fix DirtyFrag Issue
install esp4 /bin/false
install esp6 /bin/false
install rxrpc /bin/false',
      notify  => Exec['fix_dirty_frag_cache'],
    }
    exec { 'fix_dirty_frag_cache' :
      command     => 'echo 3 > /proc/sys/vm/drop_caches; true',
      refreshonly => true,
      path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    }
  }
  if ( $cvemitigate::fix_dirty_frag == false ){
    file { 'fix_dirty_frag' :
      ensure  => absent,
      path    => '/etc/modprobe.d/dirtyfrag.conf',
    }
  }
}
