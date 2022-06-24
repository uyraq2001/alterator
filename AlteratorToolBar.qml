import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

ToolBar {
    id: alteratorToolBar
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.rightMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    height: 40
    ToolButton {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        id: upBtn
        text: qsTr("На уровень выше")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        //        onClicked: winld.active = true                           ////////////////////////////TODO
    }
    ToolButton {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        id: quitBtn
        text: qsTr("Выйти")
        anchors.left: upBtn.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        onClicked: winldq.active = true
    }
    ToolButton {
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
        id: infBtn
        text: qsTr("Справка")
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        onClicked: winldi.active = true
    }
    Loader {
        id: winldq
        active: false
        source: "AlteratorQuit.qml"
    }
    Loader {
        id: winldi
        active: false
        sourceComponent: Window{
            id: infoWindow
            visible: true
            height: 200
            width: 300
            Label{
                anchors{
                    top: infoWindow.top
                    right: infoWindow.right
                    left: infoWindow.left
                }
                width: infoWindow.width
                text: alteratorToolBar.info
                wrapMode: Text.Wrap
            }
            title: "Справка"
        }
    }
}
