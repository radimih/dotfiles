/* Based on: https://gitlab.com/sagidayan/primary-input-on-lockscreen
 */

'use strict';

const Main = imports.ui.main;
const inputSourceManager = imports.ui.status.keyboard.getInputSourceManager();

let lockScreenHandlerId = null;
function init() {
}

function enable() {
    if (lockScreenHandlerId) return;
    lockScreenHandlerId = Main.screenShield.connect('lock-screen-shown', _check_state);
}


function disable() {
    if (!Main.sessionMode.isLocked && lockScreenHandlerId) {
        Main.screenShield.disconnect(lockScreenHandlerId);
        lockScreenHandlerId = null;
    }
}


function _check_state() {
    try {
        const primaryInput = inputSourceManager.inputSources["0"];
        const currentInput = inputSourceManager.currentSource;
        if (currentInput != primaryInput) {
            primaryInput.activate();
        }
    } catch (err) {
        log(`[PRIMARY_LOCK]: ERROR: ${err}`)
    }
}
