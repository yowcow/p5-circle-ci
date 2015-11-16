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
            'dbi:mysql:database=circle_ci;host=localhost',
            'ubuntu',
            '',
        ];
    };

    subtest 'In local' => sub {
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
