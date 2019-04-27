class tomcat_list(
    $tomcat_list                                                  = hiera("profile::tomcat_list")
)
  {
      class { 'java': }

      tomcat::install { '/opt/tomcat9':
        source_url => 'https://www.apache.org/dist/tomcat/tomcat-9/v9.0.x/bin/apache-tomcat-9.0.x.tar.gz'
      }

    $tomcat_list.each |Integer $index, String $value| {
      notify { "DEBUGGGG:::: puppet module tomcat loop  ${value}":
        withpath => true,
      }

      #for each tomcat list
      tomcat::instance { "tomcat9-${value}":
        catalina_home => "/opt/tomcat9",
        catalina_base => "/opt/tomcat9/${value}",
      }

    }
   tomcat::instance { 'tomcat9-first':
        catalina_home => '/opt/tomcat9',
        catalina_base => '/opt/tomcat9/first',
    }

  }