while read p; do
  /home/linuxbrew/.linuxbrew/bin/brew install "$p"
done <packages
