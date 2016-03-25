package Mojolicious::Plugin::Syslog;
use Mojo::Base 'Mojolicious::Plugin';

use Sys::Syslog;

our $VERSION = '0.01';

sub register {
  my ($self, $app, $conf) = @_;

  openlog($app->moniker, $conf->{logopt} || 'ndelay', $conf->{facility} || 'local0');
  $app->helper(syslog => sub { shift; syslog(@_) });
}

1;
__END__

=encoding utf8

=head1 NAME

Mojolicious::Plugin::Syslog - Mojolicious Plugin to provide a Perl interface
to the UNIX syslog(3) calls

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('Syslog');
  $self->syslog('info', "Log this message to syslog");

  # Mojolicious::Lite
  plugin 'Syslog';
  app->syslog('info', "Log this message to syslog");

=head1 DESCRIPTION

L<Mojolicious::Plugin::Syslog> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::Syslog> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicious.org>.

=cut
