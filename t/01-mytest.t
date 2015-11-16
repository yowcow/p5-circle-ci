use common::sense;
use Test::More;

use_ok 'MyTest';

subtest 'Test dbh' => sub {
    my $dbh = MyTest->dbh;

    isa_ok $dbh, 'DBI::db';
    ok $dbh->ping;
};

done_testing;
