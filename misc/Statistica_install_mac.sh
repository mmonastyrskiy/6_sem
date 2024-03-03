if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root. Please use sudo or run as root."
    exit 1
fi
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 2
fi

brew install --cask wine-stable
brew install rar

wget 'https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks' -O /usr/local/bin/winetricks
env WINEPREFIX=$HOME/statistica wineboot --init
WINEPREFIX=$HOME/statistica
winetricks --force dotnet40 statistica
winetricks --force dotnet71 statistica

unrar x $1
cd StatSoft\ STATISTICA\ 12.5.192.7/INSTALL6/
wine SETUP.exe
