package Ticker;

sub new {
	my $class = shift;
	my $self = {
		current => 0,
		symbols => [qw(- \ | /)],
		is_new => 1
	};                  
	bless $self, ref($class) || $class;
	return $self;  
}

sub init {
	my $self = shift;
	my $symbol = $self->{symbols}[$self->{current}];
	$self->step();
	$self->print($symbol);
}

sub tick {
	my $self = shift;
	my $symbol = $self->{symbols}[$self->{current}];
	$self->step();
	$self->clear();
	$self->print($symbol);
}

sub step {
	my $self = shift;
	if($self->{current} < @{$self->{symbols}}-1) {
		$self->{current}++;
	}else {
		$self->{current} = 0;
	}
}

sub clear {
	my $self = shift;
	$self->print("\b");
}

sub print {
	my $self = shift;
	my $char = shift;
	print($char);
	select()->flush();
}
1;
