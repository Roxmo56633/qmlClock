import QtQuick
import QtQuick.Layouts
import QtQuick.Controls 2.15




Window {
    id: window
    width: 600
    minimumHeight: 320
    minimumWidth: 310
    height: 680
    visible: true
    title: qsTr("The clock")
    

    /*
    Background of the page
    */
    Rectangle {
        id:page
        anchors.fill: parent
        color:"lightGrey"
        anchors.centerIn: parent


        Horloge{
            id:clockFrame
            anchors.centerIn:parent
            primaryColor: "#3cb37194"
            secondaryColor: "purple"
            anchors.fill: parent


            Timer {
                id:circleTimer
                interval: 1000
                running: false
                triggeredOnStart: true
                repeat: true
                onTriggered: {
                    clockFrame.timerSecDone++
                    if (clockFrame.timerSecDone > clockFrame.timerDuration+1) {
                    }
                }

            }
        }
        GridLayout {
                id: grid
                flow:  parent.width < 500 ? GridLayout.TopToBottom : GridLayout.LeftToRight
                anchors.margins: 30
                    Button {
                        id:startButton
                        Layout.margins: 10
                        Layout.minimumWidth: 50
                        Layout.preferredWidth: 100
                        Layout.maximumWidth: 300


                        onClicked: {
                                    circleTimer.running = true}


                        width: 100
                        height: 40
                        highlighted : false
                        contentItem: Text{
                            text: "Démarrer"

                            font.pointSize: 15
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        background: Rectangle{
                            opacity: enabled ? 1 : 0.3
                            border.color: "darksalmon"
                            border.width: 2
                            radius: 2
                            color:"lightsalmon"
                        }

                    }
                    Button {
                        id:stopButton
                        Layout.margins: 10
                        Layout.minimumWidth: 50
                        Layout.preferredWidth: 100
                        Layout.maximumWidth: 300

                        onClicked: {
                                    circleTimer.running = false}


                        width: 100
                        height: 40
                        highlighted : false
                        contentItem: Text{
                            text: "Stop"

                            font.pointSize: 15
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        background: Rectangle{
                            opacity: enabled ? 1 : 0.3
                            border.color: "darksalmon"
                            border.width: 2
                            radius: 2
                            color:"lightsalmon"
                        }

                    }
                    Button {
                        id:restartButton
                        Layout.margins: 10
                        Layout.minimumWidth: 50
                        Layout.preferredWidth: 100
                        Layout.maximumWidth: 300

                        onClicked: {
                                    circleTimer.running=true;
                                    clockFrame.timerSecDone = 0}


                        width: 100
                        height: 40
                        highlighted : false
                        contentItem: Text{
                            text: "Restart"

                            font.pointSize: 15
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        background: Rectangle{
                            opacity: enabled ? 1 : 0.3
                            border.color: "darksalmon"
                            border.width: 2
                            radius: 2
                            color:"lightsalmon"
                        }

                    }

                    Button {
                        id:resetButton
                        Layout.margins: 10
                        Layout.minimumWidth: 50
                        Layout.preferredWidth: 100
                        Layout.maximumWidth: 300

                        onClicked: {
                                    circleTimer.running=false;
                                    clockFrame.timerSecDone = 0}


                        width: 100
                        height: 40
                        highlighted : false
                        contentItem: Text{
                            text: "Reset"
                            font.pointSize: 15
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        background: Rectangle{
                            opacity: enabled ? 1 : 0.3
                            border.color: "darksalmon"
                            border.width: 2
                            radius: 2
                            color:"lightsalmon"
                        }

                    }}


        }



}

