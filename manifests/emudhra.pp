# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include cvemitigate::emudhra
class cvemitigate::emudhra {
  include apt
  package { 'ca-certificates':
    ensure   => latest,
    requires => Exec[apt_update],
  }
}
