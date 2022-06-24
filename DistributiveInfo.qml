import QtQuick 2.3
import QtQuick.Window 2.0
import QtQuick.Controls 2.15


Window {
    id: window
    visible: true
    width: 640
    height: 580
    title: qsTr("Hello World")
    AlteratorToolBar{
        id: alteratorToolBar
        property string info: "<html><body>
                <h2>Информация о дистрибутиве</h2>
                <p>Дистрибутив установлен. На данной странице находится информация об использовании данной версии системы от её разработчиков. Она может включать в себя сведения, не вошедшие в печатное руководство.</p>
                </body></html>"
    }
    ScrollView{
        id: scrollView
        anchors{
            top: alteratorToolBar.bottom
            bottom: parent.bottom
            right: parent.right
            left: parent.left
        }
        TextArea{
            id: _textComponent
            anchors{
                top: parent.top
                right: parent.right
                left: parent.left
            }
            width: window.width
            textFormat: TextEdit.AutoText
            readOnly: true
            selectByMouse: true
            selectByKeyboard: true
            text: qsTr("<html>
                    <body>

                    <h1>Спасибо Вам за выбор Альт Рабочая станция 10.0!</h1>

                    <p>На нашем официальном сайте <a  href=\"http://www.basealt.ru\" target=\"_blank\">www.basealt.ru</a> вы можете узнать больше о возможностях продукта.<\p>


                    <h2>Другие полезные ресурсы: </h2>


                    <p>Онлайновая документация <a  href=\"http://docs.altlinux.org\" target=\"_blank\">http://docs.altlinux.org</a><\p>


                    <p>Wiki <a  href=\"http://altlinux.org/\" target=\"_blank\">http://altlinux.org/</a><\p>


                    <p>FAQ <a  href=\"http://altlinux.org/FAQ\" target=\"_blank\">http://altlinux.org/FAQ</a><\p>


                    <p>Форум сообщества <a  href=\"http://forum.altlinux.org\" target=\"_blank\">http://forum.altlinux.org</a><\p>

                    <p>Эта страница доступна после установки в Центре управления системой (acc) → Информация о дистрибутиве.<\p>

                    <p>Свободные программы для свободных людей <\p>

                    </body></html>");
            wrapMode: TextEdit.Wrap
            font.pixelSize: 15
            horizontalAlignment: TextEdit.AlignLeft
            verticalAlignment: TextEdit.AlignVCenter
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }

    Row{
        spacing: 5
        anchors.top: scrollView.bottom
        anchors.topMargin: 20

        Repeater{
            model: _textComponent.lineCount

            delegate: Rectangle{
                width: 20
                height: 20
                color: "blue"
                Text{
                    anchors.centerIn: parent
                    text: index
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        var lines = _textComponent.text.split("\n");
                        var count=0;
                        for (var i=0; i<index;i++){
                            count+=(lines[i].length+1);
                        }
                        _textComponent.select(count, count+lines[index].length);
                        _textComponent.forceActiveFocus()

                        var maxY = _textComponent.contentHeight-scrollView.height
                        var lineHeight = _textComponent.contentHeight/_textComponent.lineCount
                        var centeredY=index*lineHeight-scrollView.height/2
                        if (centeredY < 0){
                            scrollView.flickableItem.contentY=0
                        }else if (centeredY<=maxY){
                            scrollView.flickableItem.contentY=centeredY
                        }else{
                            scrollView.flickableItem.contentY=maxY
                        }
                    }
                }
            }
        }
    }
}


