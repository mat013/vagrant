class fun ( String $msg = "world" ) {
  notify {"Hello $msg":
      loglevel => notice,
    }
    
  file { '/tmp/greet':
    ensure  => present,
    mode    => '644',
    content => "hello $msg.\n",
  }
  
  file { '/tmp/template':
    ensure  => present,
    mode    => '644',
    # https://puppet.com/docs/puppet/4.10/modules_fundamentals.html describes how the file name is resolved
    content => epp('fun/my_template.epp', {'service_name' => 'xntpd' }),
  }

  class { 'second':
    msg => "test"
  }
}