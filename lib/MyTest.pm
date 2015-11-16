package MyTest;
use common::sense;
use DBI;
use MyConfig;

sub dbh {
    my $config = MyConfig->dbconfig;
    DBI->connect(@$config);
}

1;
