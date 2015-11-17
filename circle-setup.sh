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

eval "$(anyenv init -)";

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

sudo mkdir -p /var/log/my_tmp;
sudo chmod 777 /var/log/my_tmp;
