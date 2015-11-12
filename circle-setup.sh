if [ ! -d ~/.anyenv ]
then
    git clone https://github.com/riywo/anyenv.git ~/.anyenv;
fi

. ~/.bashrc;

if [ ! $(which anyenv) ]
then
    echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc;
    echo 'eval "$(anyenv init -)"' >> ~/.bashrc;
fi

. ~/.bashrc;

if [ ! -d ~/.anyenv/envs/plenv ]
then
    anyenv install plenv;
fi

if [ ! -d ~/.anyenv/envs/plenv/versions/5.20.2 ]
then
    plenv install 5.20.2;
    plenv global 5.20.2;
    plenv rehash;
    plenv install-cpanm;
fi

if [ ! $(which carton) ]
then
    cpanm Carton;
fi
