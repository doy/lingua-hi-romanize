package Lingua::HI::Romanize;
use strict;
use warnings;
use utf8;

sub new {
    my $class = shift;
    my %args = @_;
    return bless {
        unicode         => $args{unicode},
        default_unicode => 'iast',
        default_ascii   => 'itrans',
    }, $class;
}

sub romanize {
    my $self = shift;
    my $method = "romanize_";
    if ($self->{unicode}) {
        $method .= $self->{default_unicode};
    }
    else {
        $method .= $self->{default_ascii};
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
