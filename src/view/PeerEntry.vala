/*
 *    PeerEntry.vala
 *
 *    Copyright (C) 2018 Venom authors and contributors
 *
 *    This file is part of Venom.
 *
 *    Venom is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    Venom is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with Venom.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Venom {
  [GtkTemplate(ui = "/chat/tox/venom/ui/peer_entry.ui")]
  public class PeerEntry : Gtk.ListBoxRow {
    [GtkChild] private Gtk.Image peer_image;
    [GtkChild] private Gtk.Label peer_name;
    [GtkChild] private Gtk.Label peer_key;
    [GtkChild] private Gtk.Image peer_known;
    [GtkChild] private Gtk.Image peer_self;

    private ILogger logger;

    public PeerEntry(ILogger logger, ConferencePeer peer) {
      this.logger = logger;
      peer_name.label = peer.peer_name;
      peer_key.label = peer.peer_key;
      peer_known.visible = peer.is_known;
      peer_self.visible = peer.is_self;

      var pub_key = Tools.hexstring_to_bin(peer.peer_key);
      var pixbuf = Identicon.generate_pixbuf(pub_key);
      peer_image.pixbuf = round_corners(pixbuf.scale_simple(44, 44, Gdk.InterpType.BILINEAR));
      logger.d("PeerEntry created.");
    }

    ~PeerEntry() {
      logger.d("PeerEntry destroyed.");
    }
  }
  [GtkTemplate(ui = "/chat/tox/venom/ui/peer_entry_compact.ui")]
  public class PeerEntryCompact : Gtk.ListBoxRow {
    [GtkChild] private Gtk.Image peer_image;
    [GtkChild] private Gtk.Label peer_name;
    [GtkChild] private Gtk.Image peer_known;
    [GtkChild] private Gtk.Image peer_self;

    private ILogger logger;

    public PeerEntryCompact(ILogger logger, ConferencePeer peer) {
      this.logger = logger;
      peer_name.label = peer.peer_name;
      peer_known.visible = peer.is_known;
      peer_self.visible = peer.is_self;

      var pub_key = Tools.hexstring_to_bin(peer.peer_key);
      var pixbuf = Identicon.generate_pixbuf(pub_key);
      peer_image.pixbuf = round_corners(pixbuf.scale_simple(22, 22, Gdk.InterpType.BILINEAR));
      logger.d("PeerEntryCompact created.");
    }

    ~PeerEntryCompact() {
      logger.d("PeerEntryCompact destroyed.");
    }
  }
}
