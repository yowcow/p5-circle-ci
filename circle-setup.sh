if test ! -e ~/.anyenv; then
    git clone https://github.com/riywo/anyenv.git ~/.anyenv;
    echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc;
    echo 'eval "$(anyenv init -)"' >> ~/.bashrc;
    exec $SHELL -l;
fi

if test -e ~/.anyenv/envs/plenv; then
    anyenv install plenv;
    exec $SHELL -l;
fi

if test ! -e ~/.anyenv/envs/plenv/versions/5.20.2; then
    plenv install 5.20.2;
    plenv global 5.20.2;
    plenv rehash;
    plenv install-cpanm;
fi

if test ! $(which carton); then
    cpanm Carton;
fi
