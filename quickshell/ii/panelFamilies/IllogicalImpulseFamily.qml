import QtQuick
import Quickshell
import qs.modules.common
import qs.modules.ii.dock
import qs.modules.ii.overview
Scope {
    PanelLoader { component: Dock {} }
    PanelLoader { component: Overview {} }
}
