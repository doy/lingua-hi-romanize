package Lingua::HI::Romanize;
use Moose;
use utf8;

has unicode => (
    is      => 'ro',
    isa     => 'Bool',
    default => 0,
);

has default_ascii => (
    is      => 'ro',
    isa     => 'Str',
    default => 'ITRANS',
);

has default_unicode => (
    is      => 'ro',
    isa     => 'Str',
    default => 'IAST',
);

sub romanize {
    my $self = shift;
    my ($text) = @_;
    my $package = 'Lingua::HI::Romanize::';
    if ($self->unicode) {
        $package .= $self->default_unicode;
    }
    else {
        $package .= $self->default_ascii;
    }
    my %translit = %{ $package->TRANSLIT };
    my $output = '';
    for my $word (split /\b/s, $text) {
        for my $char (split //, $word) {
            if (exists $translit{$char}) {
                $output .= $translit{$char};
            }
            else {
                $output .= $char;
            }
        }
        # XXX: word-final 'a' should be stripped
    }
    return $output;
}

1;
