import QtQuick 2.15
import QtQuick.Window 2.15

Rectangle {
    id: root
    color: "#080112"
    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
        if (stage == 6) {
            fadeOut.running = true
        }
    }

    // Scanline effect
    Canvas {
        id: scanlines
        anchors.fill: parent
        z: 10
        opacity: 0.03
        onPaint: {
            var ctx = getContext("2d")
            ctx.strokeStyle = "#b400ff"
            ctx.lineWidth = 1
            for (var i = 0; i < height; i += 3) {
                ctx.beginPath()
                ctx.moveTo(0, i)
                ctx.lineTo(width, i)
                ctx.stroke()
            }
        }
    }

    // Main title
    Item {
        id: titleBlock
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -40
        width: parent.width
        height: 200
        opacity: 0

        Text {
            id: mainTitle
            anchors.horizontalCenter: parent.horizontalCenter
            text: "SITH OS"
            font.family: "Hack Nerd Font"
            font.pixelSize: 72
            font.weight: Font.Bold
            font.letterSpacing: 16
            color: "#b400ff"
            style: Text.Outline
            styleColor: "#5a00b4"
        }

        // Glow effect using layered text
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: mainTitle.verticalCenter
            text: "SITH OS"
            font: mainTitle.font
            color: "transparent"
            style: Text.Outline
            styleColor: Qt.rgba(0.7, 0, 1, 0.3)
        }

        // Decorative line
        Rectangle {
            id: decorLine
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: mainTitle.bottom
            anchors.topMargin: 16
            height: 2
            width: 0
            color: "#00ffc8"
            opacity: 0.8

            NumberAnimation on width {
                from: 0; to: 400
                duration: 1200
                easing.type: Easing.OutCubic
                running: introAnimation.running
            }
        }

        // Subtitle
        Text {
            id: subtitle
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: decorLine.bottom
            anchors.topMargin: 12
            text: "THE DARK SIDE OF LINUX"
            font.family: "Hack Nerd Font"
            font.pixelSize: 14
            font.letterSpacing: 8
            color: "#00ffc8"
            opacity: 0

            NumberAnimation on opacity {
                from: 0; to: 0.8
                duration: 800
                running: introAnimation.running
            }
        }
    }

    // Loading indicator
    Item {
        id: loadingArea
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.15
        width: 300
        height: 40
        opacity: 0

        // Progress bar background
        Rectangle {
            id: progressBg
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 3
            color: "#1a0535"
            radius: 1
        }

        // Progress bar fill
        Rectangle {
            id: progressFill
            anchors.left: progressBg.left
            anchors.verticalCenter: progressBg.verticalCenter
            height: 3
            width: progressBg.width * (root.stage / 6)
            color: "#b400ff"
            radius: 1

            Behavior on width {
                NumberAnimation { duration: 400; easing.type: Easing.OutCubic }
            }
        }

        // Glow on progress
        Rectangle {
            anchors.left: progressFill.left
            anchors.verticalCenter: progressFill.verticalCenter
            height: 8
            width: progressFill.width
            color: "transparent"
            border.color: Qt.rgba(0.7, 0, 1, 0.2)
            radius: 4
        }

        // Loading text
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: progressBg.bottom
            anchors.topMargin: 12
            text: "INITIALIZING"
            font.family: "Hack Nerd Font"
            font.pixelSize: 10
            font.letterSpacing: 6
            color: "#e6dcff"
            opacity: 0.4

            SequentialAnimation on opacity {
                running: true
                loops: Animation.Infinite
                NumberAnimation { to: 0.7; duration: 800 }
                NumberAnimation { to: 0.3; duration: 800 }
            }
        }
    }

    // Intro animation
    ParallelAnimation {
        id: introAnimation
        NumberAnimation {
            target: titleBlock
            property: "opacity"
            from: 0; to: 1
            duration: 1000
            easing.type: Easing.OutCubic
        }
        NumberAnimation {
            target: loadingArea
            property: "opacity"
            from: 0; to: 1
            duration: 1500
            easing.type: Easing.OutCubic
        }
    }

    // Fade out when done
    NumberAnimation {
        id: fadeOut
        target: root
        property: "opacity"
        from: 1; to: 0
        duration: 500
        easing.type: Easing.InCubic
    }
}
