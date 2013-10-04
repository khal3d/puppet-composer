class composer {
    exec { 'php-install-composer':
        cwd     => "/root/",
        command => 'curl -s https://getcomposer.org/installer | php',
        timeout => 0,
        require => [
            Package['curl', 'php5-cli']
        ],
        creates => "/root/composer.phar"
    }

    file { '/usr/bin/composer':
        ensure  => link,
        target  => "/root/composer.phar",
        require => Exec['php-install-composer'],
    }
}