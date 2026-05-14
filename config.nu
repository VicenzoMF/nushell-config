# config.nu
#
# Installed by:
# version = "0.111.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
$env.config.show_banner = false


def dockerkaboom [] {
    let ids = (docker ps -q | lines)
    
    if ($ids | is-empty) {
        print "Nenhum container em execução encontrado."
    } else {
        print $"Matando ($ids | length) containers..."
        $ids | each { |id| docker kill $id }
    }
}

source ~/.cache/fnm/fnm.nu
