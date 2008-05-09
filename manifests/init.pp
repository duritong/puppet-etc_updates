#######################################
# etc-updates module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#
# this moudel deploys 2 tools
# - etc-update
# - etc-downgrade
#
# they both look for config files in /etc
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
#######################################


# modules_dir { "etc-updates": }
class etc-updates {

    # cron
    file{"/etc/cron.weekly/etc-updates.cron":
        source => "puppet://$server/etc-updates/etc-updates.cron",
        mode => 0755, owner => root, group => 0;
    }

    # config
    file{"/etc/sysconfig/etc-update.conf":
        source => "puppet://$server/etc-updates/etc-update.conf",
        mode => 0644, owner => root, group => 0;
    }

    # etc-update
    file{"/usr/local/sbin/etc-update":
        source => "puppet://$server/etc-updates/etc-update",
        mode => 0700, owner => root, group => 0;
    }

    # etc-downgrade
    file{"/usr/local/sbin/etc-downgrade":
        source => "puppet://$server/etc-updates/etc-downgrade",
        mode => 0700, owner => root, group => 0;
    }
}