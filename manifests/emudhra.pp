# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::emudhra
class cvemitigate::emudhra {
  if ($facts['ca_certificates'] != '20260816ubuntu0.22.04.1') {
    notify { 'widtdt':
      name     => $facts['ca_certificates'],
      loglevel => 'err',
    }
  }
}
