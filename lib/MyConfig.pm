package MyConfig;
use common::sense;

my %CONFIG = (
    test => {
        dbconfig => [
            'dbi:mysql:database=mytest;host=localhost',
            'root',
            '',
        ],
    },
    circleci => {
        dbconfig => [
            'dbi:mysql:database=circle_ci;host=localhost',
            'ubuntu',
            '',
        ],
    },
);

sub env {
    exists $ENV{CIRCLECI} ? 'circleci' : 'test';
}

sub dbconfig {
    my $class = shift;
    $CONFIG{ $class->env }{dbconfig};
}

1;
