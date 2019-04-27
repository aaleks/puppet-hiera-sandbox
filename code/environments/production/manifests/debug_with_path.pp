class debug_with_path(
    $path                                                  = true,

)
  {

  #exec { 'refresh_cache':
  #  command => 'refresh_cache 8600',
  #  path    => '/usr/local/bin/:/bin/',
    # path    => [ '/usr/local/bin/', '/bin/' ],  # alternative syntax
  #}
    notify { "DEBUGGGG:::: puppet module before apache installation":
    withpath => true,
  }

}