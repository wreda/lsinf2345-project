#--Global Execution params----

Exec {
          path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin:/sbin:/bin/sh",
          user => root,
		  #logoutput => true,
}

#--apt-update Triggers-----

exec { "apt-update":
    command => "sudo apt-get update",
}

Exec["apt-update"] -> Package <| |> #This means that an apt-update command has to be triggered before any package is installed

#--Miscellaneous Execs-----

exec { "erlang-dep":
    command => "apt-get install -y build-essential libwxbase2.8-0 libwxgtk2.8-0 libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev",
    #refreshonly => true,
}

exec { "erlang-install":
    command => "wget http://packages.erlang-solutions.com/site/esl/esl-erlang/FLAVOUR_1_esl/esl-erlang_17.4-2~ubuntu~trusty_amd64.deb && dpkg -i esl-erlang_17.4-2~ubuntu~trusty_amd64.deb",
    require => Exec["erlang-dep"],
    cwd => '/home/vagrant/Downloads'
    #refreshonly => true,
}

exec { "riak-binary-download":
    command => "wget -O riak-2.1.0.zip https://www.dropbox.com/s/vgkni0wehvdm1vn/riak-2.1.0.zip?dl=1 && unzip riak-2.1.0.zip -d riak-2.1.0",
    cwd => '/home/vagrant/Downloads',
    #notify => Exec["riak-multi-node"],
    #refreshonly => true,
}

exec { "riak-multi-node":
	command => "git clone https://github.com/ksauzz/riak-multi-node && cd riak-multi-node && scp -r /home/vagrant/Downloads/riak-2.1.0/riak riak-2.1.0",
  require => Exec["riak-binary-download"],
  #refreshonly => true,
}

exec {"restart-system":
     command => "shutdown -r now",
	 refreshonly => true,
}

#--Packages----

package { "ubuntu-desktop":
  ensure => present,
  notify => Exec["restart-system"],
  install_options => ['--no-install-recommends'],
  require => Exec["riak-multi-node"],
}

package { "ssh":
   ensure => present,
}

package {"git":
	ensure => present,
}

package {"zip":
	ensure => present,
}

package { "libpam0g-dev":
	ensure => present,
}

package { "libssl0.9.8":
	ensure => present,
}

package { "libc6-dev-i386":
	ensure => present,
}

#--Files & Directories----

file { "/home/vagrant/Downloads":
    ensure => "directory",
    mode   => 777,
}