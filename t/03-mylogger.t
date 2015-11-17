use common::sense;
use Data::Dumper;
use Encode qw(decode_utf8);
use Test::More;
use Time::Piece ();

use_ok 'MyLogger';

subtest 'Test get_logger' => sub {
    my $log = MyLogger->get_logger('mytest');

    isa_ok $log, 'Log::Log4perl::Logger';

    subtest 'Check output' => sub {
        my $message = 'あいうえお' . time;

        $log->debug($message);

        my $file = "/var/log/my_tmp/@{[ Time::Piece->localtime->ymd ]}/mytest.log";
        my $res = qx{ tail -n1 $file };

        like decode_utf8($res), qr|$message|;
    };
};

done_testing;
