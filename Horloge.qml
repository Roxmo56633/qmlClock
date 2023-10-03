import QtQuick
import QtQuick.Layouts
import "timeTimer.js" as MyNumbers


Item {
    id:clockFrame
    property int timerDuration: 60
    property int timerSecDone: 3599
    property color primaryColor:"green" //set default
    property color secondaryColor:"#3cb37194" //set default
    property int animationTime: 1000
    property real value: (getClockTimer(timerSecDone) * 100 / timerDuration) / 100
    onValueChanged: c.degree = value * 360
    anchors.margins: 70

    function getSize(width, height){
        if(height == 0){
            return width
        }else if(width == 0) {
            return height
        }else if(width > height ){
            return height
        } else {
            return width}
    }

    function getClockTimer(timerSecDone){
        return timerSecDone % 60
    }
    ColumnLayout{
        anchors.fill: parent
        anchors.leftMargin: parent.width < 366 ? 50 : 0

        Canvas {
            id: c
            property real degree: 0
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 170
            Layout.minimumHeight: 170
            antialiasing: true
            onDegreeChanged: requestPaint()

            onPaint: {
                var ctx = getContext("2d");
                var x = c.width / 2;
                var y = c.height/2;
                var radius = getSize(c.width, c.height) / 2
                var startAngle = (Math.PI / 180) * 270;
                var fullAngle = (Math.PI / 180) * (270 + 360);
                var progressAngle = (Math.PI / 180) * (270 + degree);
                ctx.reset()
                ctx.fillStyle = clockFrame.secondaryColor;
                ctx.beginPath();
                ctx.moveTo(x,y);
                ctx.arc(x, y, radius-1, startAngle, fullAngle);
                ctx.lineTo(x, y)
                ctx.fill();
                ctx.fillStyle = clockFrame.primaryColor;
                ctx.beginPath();
                ctx.moveTo(x,y);
                ctx.arc(x, y, radius, startAngle, progressAngle);
                ctx.lineTo(x, y)
                ctx.fill();
            }

            Behavior on degree {
                NumberAnimation {
                    duration: clockFrame.animationTime
                }
            }
            Rectangle{
                width: getSize(c.width, c.height)
                height:getSize(c.width, c.height)
                anchors.centerIn:c
                color:"transparent"

                Repeater {
                    model: 12;
                    delegate:
                        NumberTime{
                        id:number
                        text: index +1
                        x:  MyNumbers.getPosX(index, getSize(c.width, c.height))
                        y: MyNumbers.getPosY(index, getSize(c.width, c.height))
                    }
                }
            }
        }
        //dot in the center
        Rectangle {
            width:10
            height: 10
            anchors.centerIn: c
            radius:180
            color:"black"
        }

        Rectangle{
            id:numberTimer
            width:200
            height:100
            color:"grey"
            border.color:"black"
            border.width: 3
            Layout.alignment: Qt.AlignCenter

            Text {
                id: time
                text: getTime(clockFrame.timerSecDone)
                function getTime(setTime){
                    let second = parseInt(setTime)
                    let min = 0
                    let hours = 0
                    if(second >= 3600){
                        hours = Math.trunc(second/3600)
                        second = second % 3600
                    }
                    if(second >= 60){
                        min = Math.trunc(second/60)
                        second = second % 60
                    }
                    let timeArray = [hours,min,second]
                    for (var value in timeArray){
                        if(timeArray[value] < 10)
                            timeArray[value] = "0" + timeArray[value].toString()
                    }
                    const newTime = timeArray.join(':')
                    return(newTime)
                }
                font.pointSize: 30
                anchors.centerIn:parent
            }
        }
    }




 }









