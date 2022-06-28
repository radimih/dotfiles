/* Based on:
 *   - https://github.com/ramottamado/eval-gjs/blob/main/eval-gjs%40ramottamado.dev/extension.js
 */

'use strict';

const { Gio, GLib, Meta } = imports.gi;

const Main = imports.ui.main;
const inputSourceManager = imports.ui.status.keyboard.getInputSourceManager();

const ExtensionInterface =
    '<node>' +
    '   <interface name="org.gnome.Shell.LayoutSwitcher">' +
    '       <method name="Switch">' +
    '           <arg type="i" direction="in" name="layout" />' +
    '           <arg type="b" direction="out" name="success"/>' +
    '           <arg type="s" direction="out" name="returnValue"/>' +
    '       </method>' +
    '   </interface>' +
    '</node>';

class LayoutSwitcher {

    constructor() {
        this._dbusImpl = Gio.DBusExportedObject.wrapJSObject(ExtensionInterface, this);
    }

    Switch(layout) {
        let returnValue;
        let success;

        try {
            returnValue = JSON.stringify(inputSourceManager.inputSources[layout].activate());
            returnValue = returnValue == undefined
                ? ''
                : returnValue;

            success = true;
        }
        catch (e) {
            success = false;
        }

        return [success, returnValue];
    }

    enable() {
        this._dbusImpl.export(Gio.DBus.session, '/org/gnome/Shell/LayoutSwitcher');
    }

    disable() {
        if (this._dbusImpl) this._dbusImpl.unexport();
    }
}

function init() {
    return new LayoutSwitcher();
}
