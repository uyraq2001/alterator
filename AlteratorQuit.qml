import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window{
    id: window
    visible: true
    width: 200
    height: 100
    title: qsTr("Hello World")
    minimumHeight: height
    minimumWidth: width
    maximumHeight: height
    maximumWidth: width
    Label{
        id: _textComponent
        anchors{
            top: parent.top
            right: parent.right
            left: parent.left
        }
        width: window.width
        text: qsTr("Вы точно хотите выйти из альтератора?");
        wrapMode: Text.Wrap
        font.pixelSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    TabButton {
        id: yesBtn
        x: 19
        y: 50
        width: 53
        height: 50
        text: qsTr("Да")
        onClicked: Qt.quit()
    } //The method qsTr() is used for translations from one language to other.

    TabButton {
        id: noBtn
        x: 130
        y: 50
        width: 53
        height: 50
        text: qsTr("Нет")
        onClicked: winldq.active = false
    }
}
