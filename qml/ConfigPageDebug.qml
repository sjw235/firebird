import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Firebird.Emu 1.0
import Firebird.UIComponents 1.0

ColumnLayout {
    spacing: 5

    FBLabel {
        text: qsTr("Remote GDB debugging")
        font.pointSize: 12
        Layout.topMargin: 5
        Layout.bottomMargin: 5
    }

    FBLabel {
        Layout.maximumWidth: parent.width
        wrapMode: Text.WordWrap
        text: qsTr("If enabled, a remote GDB debugger can be connected\nto the port and be used for debugging.")
        font.pointSize: 10
    }

    RowLayout {
        // No spacing so that the spin box looks like part of the label
        spacing: 0

        LabeledCheckBox {
            id: gdbCheckBox
            text: qsTr("Enable GDB stub on Port")

            checked: Emu.gdbEnabled
            onCheckedChanged: Emu.gdbEnabled = checked
        }

        SpinBox {
            id: gdbPort

            minimumValue: 1
            maximumValue: 65535

            value: Emu.gdbPort
            onValueChanged: Emu.gdbPort = value
        }
    }

    FBLabel {
        text: qsTr("Remote access to internal debugger")
        font.pointSize: 12
        Layout.topMargin: 10
        Layout.bottomMargin: 5
    }

    FBLabel {
        Layout.maximumWidth: parent.width
        wrapMode: Text.WordWrap
        text: qsTr("Enable this to access the internal debugger via TCP (telnet/netcat),\nlike for firebird-send.")
        font.pointSize: 10
    }

    RowLayout {
        // No spacing so that the spin box looks like part of the label
        spacing: 0

        LabeledCheckBox {
            id: rgbCheckBox
            text: qsTr("Enable internal debugger on Port")

            checked: Emu.rdbEnabled
            onCheckedChanged: Emu.rdbEnabled = checked
        }

        SpinBox {
            id: rdbPort

            minimumValue: 1
            maximumValue: 65535

            value: Emu.rdbPort
            onValueChanged: Emu.rdbPort = value
        }
    }

    FBLabel {
        text: qsTr("Enter into Debugger")
        font.pointSize: 12
        Layout.topMargin: 5
        Layout.bottomMargin: 5
    }

    FBLabel {
        Layout.maximumWidth: parent.width
        wrapMode: Text.WordWrap
        text: qsTr("Configure which situations cause the emulator to trap into the debugger.")
        font.pointSize: 10
    }

    LabeledCheckBox {
        text: qsTr("Enter Debugger on Startup")

        checked: Emu.debugOnStart
        onCheckedChanged: Emu.debugOnStart = checked
    }

    LabeledCheckBox {
        text: qsTr("Enter Debugger on Warnings and Errors")

        checked: Emu.debugOnWarn
        onCheckedChanged: Emu.debugOnWarn = checked
    }

    Item {
        Layout.fillHeight: true
    }
}
