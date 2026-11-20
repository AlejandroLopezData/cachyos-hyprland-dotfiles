#!/bin/bash
DIR="$HOME/.local/share/applications"
mkdir -p "$DIR"

# Apps to SHOW in the launcher (everything else gets hidden)
SHOW=(
  "com.google.Chrome.desktop"
  "google-chrome.desktop"
  "kitty.desktop"
  "org.kde.dolphin.desktop"
  "code-oss.desktop"
  "btop.desktop"
)

# Hide every app that is not in the list
for f in /usr/share/applications/*.desktop; do
  name=$(basename "$f")
  if [[ ! " ${SHOW[@]} " =~ " ${name} " ]]; then
    echo -e "[Desktop Entry]\nNoDisplay=true" > "$DIR/$name"
  fi
done

# Create Netflix launcher
cat > "$DIR/netflix.desktop" << EOF
[Desktop Entry]
Name=Netflix
Exec=google-chrome-stable --app=https://netflix.com
Icon=video-television
Type=Application
Categories=Network;
EOF

# Create Chess.com launcher
cat > "$DIR/chess.desktop" << EOF
[Desktop Entry]
Name=Chess.com
Exec=google-chrome-stable --app=https://chess.com
Icon=applications-games
Type=Application
Categories=Game;
EOF

echo "Done!"
