/*
 *  SPDX-FileCopyrightText: 2022 Marco Martin <mart@kde.org>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Layouts
import org.kde.spectacle.private

AnnotationViewport {
    id: root

    document: SpectacleCore.annotationDocument
    viewportRect: Qt.rect(0, 0, width, height)

    onPressedChanged: if (pressed) {
        if (textTool.shouldShow) {
            textTool.forceActiveFocus(Qt.MouseFocusReason);
        }
    }

    Item {
        x: -root.viewportRect.x
        y: -root.viewportRect.y
        transformOrigin: Item.TopLeft
        TextTool {
            id: textTool
            viewport: root
        }
        SelectionTool {
            id: selectionTool
            viewport: root
        }
        HoverOutline {
            viewport: root
            hidden: selectionTool.hovered || selectionTool.dragging
        }
    }

    Shortcut {
        enabled: root.enabled
        sequences: [StandardKey.Undo]
        onActivated: root.document.undo()
    }
    Shortcut {
        enabled: root.enabled
        sequences: [StandardKey.Redo]
        onActivated: root.document.redo()
    }
    // Annotation tool keyboard shortcuts
    // Select tool - S key
    Shortcut {
        enabled: root.enabled
        sequence: "S"
        onActivated: root.document.tool.type = AnnotationTool.SelectTool
    }
    
    // Freehand tool - F key  
    Shortcut {
        enabled: root.enabled
        sequence: "F"
        onActivated: root.document.tool.type = AnnotationTool.FreehandTool
    }
    
    // Highlighter tool - H key
    Shortcut {
        enabled: root.enabled
        sequence: "H"
        onActivated: root.document.tool.type = AnnotationTool.HighlighterTool
    }
    
    // Line tool - L key
    Shortcut {
        enabled: root.enabled
        sequence: "L"
        onActivated: root.document.tool.type = AnnotationTool.LineTool
    }
    
    // Arrow tool - A key
    Shortcut {
        enabled: root.enabled
        sequence: "A"
        onActivated: root.document.tool.type = AnnotationTool.ArrowTool
    }
    
    // Rectangle tool - R key
    Shortcut {
        enabled: root.enabled
        sequence: "R"
        onActivated: root.document.tool.type = AnnotationTool.RectangleTool
    }
    
    // Ellipse tool - E key
    Shortcut {
        enabled: root.enabled
        sequence: "E"
        onActivated: root.document.tool.type = AnnotationTool.EllipseTool
    }
    
    // Blur tool - B key
    Shortcut {
        enabled: root.enabled
        sequence: "B"
        onActivated: root.document.tool.type = AnnotationTool.BlurTool
    }
    
    // Pixelate tool - P key
    Shortcut {
        enabled: root.enabled
        sequence: "P"
        onActivated: root.document.tool.type = AnnotationTool.PixelateTool
    }
    
    // Text tool - T key
    Shortcut {
        enabled: root.enabled
        sequence: "T"
        onActivated: root.document.tool.type = AnnotationTool.TextTool
    }
    
    // Number tool - N key
    Shortcut {
        enabled: root.enabled
        sequence: "N"
        onActivated: root.document.tool.type = AnnotationTool.NumberTool
    }
}
