define u_date::date( $deploy_params, $params ) {

$artifact = "${deploy_params['artifact']}"
$deployid = "${deploy_params['deploy_id']}"
$install_dir = $deploy_params['install_dir']
$version = "${deploy_params['version']}"

notify {"Running The Date Puppet Module":
		require => Anchor["after-${deploy_params['deploy_id']}"]
	}

file { 'setting the permissions': 
		path => "$install_dir",
		mode => "0755",
		recurse => true,
		require => Anchor["after-${deploy_params['deploy_id']}"]
	}

exec { "running ID command":
        command => "/usr/bin/id",
		path => ['/bin/:/sbin/:/usr/bin/:/usr/sbin/'],
		logoutput => true,
		require => Anchor["after-${deploy_params['deploy_id']}"]
    }
}
