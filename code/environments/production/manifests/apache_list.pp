class apache_list(
    $apache_list                                                  = hiera("profile::tomcat_list")
)
  {
    include apache


    #class{'proxypassgenerator':
    #  proxy_pass => $finalProxy['proxy_pass']

    # push file system, but don't replace 'real' config file
    file { '/etc/service/config.staging':
      ensure => present,
      source => 'puppet:///modules/service/config',
      notify => Exec['reload-service']
    }

    # stop service, update config, start service
    exec { 'reload-service':
      command => '/etc/init.d/apache2 stop',
      refreshonly => true,
      path => ["/usr/sbin", "/usr/bin", "/sbin", "/bin/"]
    }
}