# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::emudhra
class cvemitigate::emudhra {
  package { 'ca-certificates':
    ensure   => latest,
    requires => Exe[apt_update],
  }
}
