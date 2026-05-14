# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::dirty_frag
class cvemitigate::dirty_frag {
  exec { 'fix_dirty_frag_cache' :
    command     => 'echo 3 > /proc/sys/vm/drop_caches; true',
    refreshonly => true,
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  }
  # fix_dirty_frag
  if ( $cvemitigate::fix_dirty_frag == true ) {
    file { 'fix_dirty_frag' :
      ensure  => file,
      path    => '/etc/modprobe.d/dirtyfrag.conf',
      content => "# Fix DirtyFrag Issue \ninstall esp4 /bin/false \ninstall esp6 /bin/false \ninstall rxrpc /bin/false",
      notify  => Exec['fix_dirty_frag_cache','update_initramfs'],
    }
  }
  if ( $cvemitigate::fix_dirty_frag == false ) {
    file { 'fix_dirty_frag' :
      ensure => absent,
      path   => '/etc/modprobe.d/dirtyfrag.conf',
      notify => Exec['fix_dirty_frag_cache'],
    }
  }

  # Check for loaded kernel modules
  #$kernel_modules = $facts['loaded_kernel_modules']
#
  #$modules_to_check = [
  #  'esp4',
  #  'esp6',
  #  'rxrpc',
  #  'xt_limit',
  #]

  # Create a hash for loaded modules found in fact
  #$loaded_modules = {}
  ##$modules_to_check.each |String $mod| {
  #['one','two','three'].each |Integer $index, String $krnmod| { notice ("${index} = ${krnmod}") }
}
