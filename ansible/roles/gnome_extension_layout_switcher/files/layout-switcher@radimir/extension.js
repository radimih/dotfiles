/* Based on: https://github.com/ramottamado/eval-gjs/blob/main/eval-gjs%40ramottamado.dev/extension.js
 */

'use strict';

const { Gio, GLib, Meta } = imports.gi;

const Main = imports.ui.main;
const inputSourceManager = imports.ui.status.keyboard.getInputSourceManager();

const ExtensionInterface =
    '<node>' +
    '   <interface name="org.gnome.Shell.LayoutSwitcher">' +
    '       <method name="Switch">' +
    '           <arg type="s" direction="in" name="layout_id" />' +
    '           <arg type="b" direction="out" name="success"/>' +
    '       </method>' +
    '   </interface>' +
    '</node>';

class Extension {

    constructor() {
        this._dbusImpl = Gio.DBusExportedObject.wrapJSObject(ExtensionInterface, this);
    }

    Switch(layout_id) {
        let inputSources;
        let success;

        try {
            inputSources = inputSourceManager.inputSources;
            inputSources[this.layout_index_by_id(inputSources, layout_id)].activate();
            success = true;
        }
        catch (e) {
            success = false;
        }

        return success;
    }

    layout_index_by_id(inputSources, layout_id) {
       for (const layout_index in inputSources) {
          let layout = inputSources[layout_index];
          if (layout.type === 'xkb' && layout.id === layout_id)
              return layout_index;
       }
       return null;
    }

    enable() {
        this._dbusImpl.export(Gio.DBus.session, '/org/gnome/Shell/LayoutSwitcher');
    }

    disable() {
        if (this._dbusImpl) this._dbusImpl.unexport();
    }
}

function init() {
    return new Extension();
}
