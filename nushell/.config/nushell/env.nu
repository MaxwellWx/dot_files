# Default Nushell Environment Config File
# These "sensible defaults" are set before the user's `env.nu` is loaded
#
# version = "0.104.1"

# Prompt colors and layout are configured in theme.nu.

$env.PATH = ($env.PATH | prepend '/home/xuanwu/.local/bin')
$env.PATH = ($env.PATH | prepend '/home/xuanwu/scripts/singularity_def_fmt')
$env.PATH = ($env.PATH | prepend ($".venv/bin" | path expand))
$env.PATH = ($env.PATH | append '/usr/bin/vendor_perl' | uniq)
