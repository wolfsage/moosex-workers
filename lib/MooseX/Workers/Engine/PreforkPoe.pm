package MooseX::Workers::Engine::PreforkPoe;
use Moose;

extends qw(MooseX::Workers::Engine);

has command => (
    isa      => 'CodeRef|Object|ArrayRef',
    is       => 'ro',
    required => 1,
);

has args => (
    isa => 'ArrayRef',
    is  => 'ro',    
);

sub BUILD {
    my ($self) = @_;
    print "BUILD here. command is " . $self->command . "\n";
    $self->add_worker( $self->command ) for $self->max_workers;
}

no Moose;
1;
