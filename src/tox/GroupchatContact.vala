/*
 *    GroupchatContact.vala
 *
 *    Copyright (C) 2013-2018  Venom authors and contributors
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
  public class GroupchatContact : IContact, GLib.Object {
    // Saved in toxs savefile
    public uint32      tox_conference_number { get; set; }
    public string      title           { get; set; }
    public string      status_message  { get; set; default = ""; }

    public GroupchatContact(uint32 conference_number, string title) {
      tox_conference_number = conference_number;
      this.title = title;
    }

    public virtual string get_id() {
      return tox_conference_number.to_string();
    }

    public virtual string get_name_string() {
      return title != "" ? title : tox_conference_number.to_string();
    }

    public virtual string get_status_string() {
      return status_message;
    }

    public virtual UserStatus get_status() {
      return UserStatus.ONLINE;
    }

    public virtual Gdk.Pixbuf get_image() {
      return Gtk.IconTheme.get_default().load_icon(R.icons.default_groupchat, 48, 0);
    }
  }
}