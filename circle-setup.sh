if test ! -e ~/.anyenv; then
    git clone https://github.com/riywo/anyenv.git ~/.anyenv;
    echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc;
    echo 'eval "$(anyenv init -)"' >> ~/.bashrc;
fi

if test ! -e ~/.anyenv/envs/plenv; then
    ~/.anyenv/bin/anyenv install plenv;
fi

ls -alh;

#. ~/.bashrc;

#if test ! -e ~/.anyenv/envs/plenv/versions/5.20.2; then
#    plenv install 5.20.2;
#    plenv global 5.20.2;
#    plenv rehash;
#    plenv install-cpanm;
#fi
#
#if test ! $(which carton); then
#    cpanm Carton;
#fi
