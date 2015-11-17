package MyLogger;
use common::sense;
use Log::Log4perl;

our $IS_LOADED = 0;
our $LOG_DIR = '/var/log/my_tmp/%Y-%m-%d';
our $CONFIG = <<END_CONFIG;
log4perl.logger.mytest = DEBUG, MYTEST

log4perl.appender.MYTEST = Log::Dispatch::Pipe
log4perl.appender.MYTEST.output_to      = cronolog ${LOG_DIR}/mytest.log
log4perl.appender.MYTEST.binmode        = :utf8
log4perl.appender.MYTEST.layout         = PatternLayout
log4perl.appender.MYTEST.layout.ConversionPattern = \%d [\%c] \%C(\%L) [\%p] - \%m\%n
END_CONFIG

sub get_logger {
    my $class = shift;

    if (!$IS_LOADED) {
        Log::Log4perl::init(\$CONFIG);
        $IS_LOADED = 1;
    }

    Log::Log4perl::get_logger(@_);
}

1;
