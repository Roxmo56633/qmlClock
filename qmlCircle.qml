/*
 * Copyright (c) 2023 Remy van Elst
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 */

import QtQuick 2.15

Item {
    id: root
    property int size: 150
    property real value: 0
    property color primaryColor: "#ff6725"
    property color secondaryColor: "#52adff"
    property int animationTime: 1000
    width: size
    height: size

    onValueChanged: c.degree = value * 360

    Canvas {
        id: c
        property real degree: 0

        anchors.fill: parent
        antialiasing: true
        onDegreeChanged: requestPaint()

        onPaint: {
            var ctx = getContext("2d");

            var x = root.width / 2;
            var y = root.height / 2;

            var radius = root.size / 2
            var startAngle = (Math.PI / 180) * 270;
            var fullAngle = (Math.PI / 180) * (270 + 360);
            var progressAngle = (Math.PI / 180) * (270 + degree);

            ctx.reset()

            ctx.fillStyle = root.secondaryColor;
            ctx.beginPath();
            ctx.moveTo(x,y);
            ctx.arc(x, y, radius-1, startAngle, fullAngle);
            ctx.lineTo(x, y)
            ctx.fill();

            ctx.fillStyle = root.primaryColor;
            ctx.beginPath();
            ctx.moveTo(x,y);
            ctx.arc(x, y, radius, startAngle, progressAngle);
            ctx.lineTo(x, y)
            ctx.fill();
        }

        Behavior on degree {
            NumberAnimation {
                duration: root.animationTime
            }
        }
    }
}
