#
# etc_updates module
#
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#
# This module deploys 2 tools
#
# - etc-update
# - etc-downgrade
#
# They both look for config files in /etc
# which are named .rpmnew or .rpmsave
# and provide a way to merge them.
# as well it deploys some cronscripts 
# which will look for them
#
# this is tool is thought for rpm-based
# systems and to provide the same elegant
# way, like gentoo does.
# it is only tested on centos and fedora
# systems.
#
class etc_updates {

  include ::mlocate

  file{
    # cron
    '/etc/cron.weekly/etc-updates.cron':
      source  => 'puppet:///modules/etc_updates/etc-updates.cron',
      require => Package[mlocate],
      owner   => root,
      group   => 0,
      mode    => '0755';
    # config
    '/etc/sysconfig/etc-update.conf':
      source => 'puppet:///modules/etc_updates/etc-update.conf',
      owner  => root,
      group  => 0,
      mode   => '0644';
    # etc-update
    '/usr/local/sbin/etc-update':
      source => 'puppet:///modules/etc_updates/etc-update',
      owner  => root,
      group  => 0,
      mode   => '0700';
    # etc-downgrade
    '/usr/local/sbin/etc-downgrade':
      source => 'puppet:///modules/etc_updates/etc-downgrade',
      owner  => root,
      group => 0,
      mode   => '0700';
  }
}
