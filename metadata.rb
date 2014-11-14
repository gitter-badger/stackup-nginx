name 'stackup-nginx'

maintainer 'Stack-up'
maintainer_email 'chef@stack-up.net'
license 'MIT'
description 'Installs/Configures stackup-base'
long_description 'Installs/Configures stackup-base'

version '0.1.0'

supports 'ubuntu', '14.04'

depends 'apt'
depends 'firewall'
depends 'stackup-base'
