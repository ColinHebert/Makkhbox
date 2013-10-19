Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
exec {'pacman -Sy ':}->Package <| |>

include transmission
#include dotfiles
#include nginx
#include makkbox
