# @summary Creates the memtest script file, and the performance table file that it will reference.
#
# @param performance_table
#   A hash of regex representing a range of nodes and their expected STREAM triad performance values
# 
# @param stream_path
#   The path of the STREAM binary if not the default location
#
# @example
#   include profile_memtest
class profile_memtest {

  Hash   $performance_table,
  String $stream_path

# table
#  file {
#    ensure  => 'file',
#    mode    => '644',
#    content => template('profile_memtest/memtest.table.epp'),
#  }

# script
  file { '/root/scripts/memtest_script':
    ensure  => file,
    mode    => '755',
#    content => template('profile_memtest/memtest.script.epp'),
    content => "${stream_path}",  
  }

}
