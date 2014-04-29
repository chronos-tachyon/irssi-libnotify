irssi-libnotify
===============

Uses `notify-send(1)` to alert you when someone is talking to you in irssi.

Description
-----------

This IRSSI script hooks itself into all private messages and channel text.
When someone sends a private message to you, or when someone says something in
a channel that triggers your highlighting rules, then this script forwards
that text to libnotify by shelling out to `notify-send(1)`, a binary shipped
with `libnotify`.  The notification is sent with category `im.received`.

Installing
----------

These instructions are for Ubuntu and other Debian derivatives.

  # Prerequisite: must have irssi and libnotify-bin
  sudo apt-get install irssi libnotify-bin

  # Install the script where irssi can find it
  mkdir -p ~/.irssi/scripts/autorun
  cp -t ~/.irssi/scripts libnotify.pl

  # OPTIONAL: Load the script automatically on startup.  If you don't do this,
  # you'll need to run "/SCRIPT LOAD libnotify" by hand each time you restart.
  ln -st ~/.irssi/scripts/autorun ../libnotify.pl

See Also
--------

* https://developer.gnome.org/notification-spec/
