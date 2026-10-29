#!/bin/sh
set -eu

# Install a user-writable executable so the signed desktop updater can replace it.
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
data_dir=${XDG_DATA_HOME:-$HOME/.local/share}
install_dir=$data_dir/hyperline
applications=$data_dir/applications
mkdir -p "$install_dir" "$applications"
install -m 755 "$source_dir/hyperline" "$install_dir/hyperline.next"
mv "$install_dir/hyperline.next" "$install_dir/hyperline"

# Desktop Entry escaping preserves paths containing spaces and field-code characters.
desktop_path=$(printf '%s' "$install_dir/hyperline" | sed 's/\\/\\\\\\\\/g; s/"/\\\\"/g; s/`/\\\\`/g; s/\$/\\\\$/g; s/%/%%/g')
cat > "$applications/hyperline.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Hyperline
Comment=Play custom Deadlock games with friends
Exec="$desktop_path" %u
Icon=applications-games
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/hyperline;
EOF
chmod 644 "$applications/hyperline.desktop"

# Open the website's hyperline:// links with this desktop.
if command -v xdg-mime >/dev/null 2>&1; then
  xdg-mime default hyperline.desktop x-scheme-handler/hyperline || true
fi
if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$applications" || true
fi
printf 'Hyperline is installed. Open it from your application menu and sign in.\n'
