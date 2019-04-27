class proxypass_generator(
    $proxypass                                                  = hiera("profile:proxpass")
)
  {



  notify {"PROXYPASS GENERATOR $proxypass ID defined":
    withpath => true,
  }



  class{'proxypassgenerator':
     proxy_pass => $proxypass
  }

}