# Load the shared Catppuccin Mocha theme.
source ($nu.default-config-dir | path join "theme.nu")

$env.config.buffer_editor = "nvim"
$env.config.shell_integration.osc133 = false
$env.config.show_banner = false
