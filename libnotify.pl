#!/usr/bin/perl -w
# vim:set tw=80 sts=2 sw=2 et:
use strict;
use warnings;
use Irssi;

our $VERSION = '0.1.0';
our %IRSSI = (
  authors     => 'Donald King',
  contact     => 'chronos@chronos-tachyon.net',
  name        => 'irssi-libnotify',
  description => 'Uses notify-send(1) to alert you when someone is talking to you.',
  url         => 'https://github.com/chronos-tachyon/irssi-libnotify',
  license     => 'GNU General Public License',
  changed     => '2014-04-29 15:46-07:00',
);

sub notify ($$) {
  my($target, $msg) = @_;
  my @argv = (
    'notify-send',
    '--icon=user-available',
    '--category=im.received',
    "${target}: ${msg}",
  );
  system(@argv);
}

sub priv_msg ($$$$$) {
  my ($server, $msg, $nick, $address, $target) = @_;
  notify($nick, $msg);
}

sub hilight ($$$) {
  my ($dest, $text, $stripped) = @_;
  if ($dest->{level} & MSGLEVEL_HILIGHT) {
    notify($dest->{target}, $stripped);
  }
}

Irssi::signal_add_last('message private', \&priv_msg);
Irssi::signal_add_last('print text', \&hilight);
