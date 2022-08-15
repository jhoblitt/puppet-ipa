# frozen_string_literal: true

# Managed by modulesync - DO NOT EDIT
# https://voxpupuli.org/docs/updating-files-managed-with-modulesync/

require 'voxpupuli/acceptance/spec_helper_acceptance'

configure_beaker do |host|
  # install_module_from_forge_on(host, 'herculesteam/augeasproviers_sysctl', '> 2 < 3')
  on host, 'sysctl -w net.ipv6.conf.lo.disable_ipv6=0'
  # disable sticky bit owner enforcement for ipa 4.6/EL7
  # https://bugzilla.redhat.com/show_bug.cgi?id=1677027
  # https://pagure.io/freeipa/c/87496d647706462fa8a10bbea5637104153146b2
  on host, 'sysctl -w fs.protected_regular=0'
  # https://cstan.io/?p=12175&lang=en
  on host, 'yum update -y'
end

Dir['./spec/support/acceptance/**/*.rb'].sort.each { |f| require f }
