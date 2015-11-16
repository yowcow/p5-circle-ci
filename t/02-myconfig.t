use common::sense;
use Test::More;

use_ok 'MyConfig';

subtest 'Test dbconfig' => sub {

    subtest 'In circleci' => sub {
        local %ENV;
        $ENV{CIRCLECI} = 'true';

        my $res = MyConfig->dbconfig;

        is @$res, 3;
        is_deeply $res, [
            'dbi:mysql:database=circle_test;unix_socket=/var/run/mysqld/mysqld.sock',
            'ubuntu',
            '',
        ];
    };

    subtest 'In local' => sub {
        local %ENV;
        delete $ENV{CIRCLECI};

        my $res = MyConfig->dbconfig;

        is @$res, 3;
        is_deeply $res, [
            'dbi:mysql:database=mytest;host=localhost',
            'root',
            '',
        ];
    };
};

done_testing;
