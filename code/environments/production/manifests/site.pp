File { backup => false }

node default {
  hiera_include('classes')

  #class { 'apt': }

  #file { '/tmp/puppet-in-docker':
  #  ensure  => present,
  #  content => 'This file is for demonstration purposes only file updated after !!!!!!!!¨',
  #}

  #$ldap=hiera("ldap_servers")
  #notify {"PROXYPASS GENERATOR $ldap ID defined":
  #  withpath => true,
  # }

  #class{'debug_with_path':}
  $customHostVar="MYCUSTOMHOSTVARIABLE"


  $proxyVar =  { proxy_pass => [
    { 'path' => '/a', 'url' => "http://${customHostVar}backend-a/" },
    { 'path' => '/b', 'url' => 'http://backend-b/' },
    { 'path' => '/c', 'url' => 'http://backend-a/c', 'params' => {'max'=>20, 'ttl'=>120, 'retry'=>300}},
    { 'path' => '/l', 'url' => 'http://backend-xy',
      'reverse_urls' => ['http://backend-x', 'http://backend-y'] },
    { 'path' => '/d', 'url' => 'http://backend-a/d',
      'params' => { 'retry' => '0', 'timeout' => '5' }, },
    { 'path' => '/e', 'url' => 'http://backend-a/e',
      'keywords' => ['nocanon', 'interpolate'] },
    { 'path' => '/f', 'url' => 'http://backend-f/',
      'setenv' => ['proxy-nokeepalive 1','force-proxy-request-1.0 1']},
    { 'path' => '/g', 'url' => 'http://backend-g/',
      'reverse_cookies' => [{'path' => '/g', 'url' => 'http://backend-g/',}, {'domain' => 'http://backend-g', 'url' => 'http:://backend-g',},], },
    { 'path' => '/h', 'url' => 'http://backend-h/h',
      'no_proxy_uris' => ['/h/admin', '/h/server-status'] },
  ]}

  $secondProxy= { proxy_pass => [
    { 'path' => '/SECONDPROXY', 'url' => 'http://SECONDPROXY-a/' }
  ]}

  $thirdProxyWithVar= { proxy_pass => [
    { 'path' => '/SECONDPROXY', 'url' => 'http://$dsda/' }
  ]}

  #$finalProxy= merge($proxyVar, $secondProxy)

$finalProxy= $proxyVar
  #include filecreator
#class{'proxypassgenerator':
#  proxy_pass => $finalProxy['proxy_pass']
#}

}
