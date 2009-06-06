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
    default => 'itrans',
);

has default_unicode => (
    is      => 'ro',
    isa     => 'Str',
    default => 'iast',
);

sub romanize {
    my $self = shift;
    my $method = "romanize_";
    if ($self->unicode) {
        $method .= $self->default_unicode;
    }
    else {
        $method .= $self->default_ascii;
    }
    return $self->$method(@_);
}

sub romanize_iast {
}

sub romanize_kolkata {
}

sub romanize_iso15919 {
}

sub romanize_harvard_kyoto {
}

sub romanize_itrans {
}

sub romanize_velthuis {
}

1;
