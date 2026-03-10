import QtQuick 2.15
import calamares.slideshow 1.0

Presentation
{
    id: presentation

    property string bgColor: "#080112"
    property string fgColor: "#e6dcff"
    property string accentPurple: "#b400ff"
    property string accentCyan: "#00ffc8"
    property string accentRed: "#ff0033"
    property string dimColor: "#5a00b4"

    Timer {
        id: advanceTimer
        interval: 7000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    // Slide 1: Welcome
    Slide {
        Rectangle {
            anchors.fill: parent
            color: bgColor

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "WELCOME TO SITH OS"
                    font.pixelSize: 32
                    font.bold: true
                    font.letterSpacing: 4
                    color: accentPurple
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 400; height: 2
                    color: accentCyan
                    opacity: 0.6
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "A custom Arch Linux distribution\nwith a hand-crafted cyberpunk desktop"
                    font.pixelSize: 16
                    color: fgColor
                    horizontalAlignment: Text.AlignHCenter
                    lineHeight: 1.4
                }
            }
        }
    }

    // Slide 2: Desktop
    Slide {
        Rectangle {
            anchors.fill: parent
            color: bgColor

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "CYBERPUNK DESKTOP"
                    font.pixelSize: 28
                    font.bold: true
                    font.letterSpacing: 4
                    color: accentPurple
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 300; height: 2
                    color: accentCyan
                    opacity: 0.6
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "• KDE Plasma with Cyber Neon theme\n• Klassy window decorations with purple glow\n• Blur effects and translucent terminals\n• 4 themed virtual desktops\n• Conky system HUD with Sith quotes"
                    font.pixelSize: 14
                    color: fgColor
                    lineHeight: 1.6
                }
            }
        }
    }

    // Slide 3: Terminal
    Slide {
        Rectangle {
            anchors.fill: parent
            color: bgColor

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "POWER TERMINAL"
                    font.pixelSize: 28
                    font.bold: true
                    font.letterSpacing: 4
                    color: accentPurple
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 300; height: 2
                    color: accentCyan
                    opacity: 0.6
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "• Kitty terminal with Sith colorscheme\n• Starship prompt with custom palette\n• Modern CLI: eza, bat, fd, fzf, zoxide\n• Neovim with Sith Cyberpunk theme\n• Git with delta side-by-side diffs\n• tmux with themed status bar"
                    font.pixelSize: 14
                    color: fgColor
                    lineHeight: 1.6
                }
            }
        }
    }

    // Slide 4: Tools
    Slide {
        Rectangle {
            anchors.fill: parent
            color: bgColor

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "BUILT-IN TOOLS"
                    font.pixelSize: 28
                    font.bold: true
                    font.letterSpacing: 4
                    color: accentPurple
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 300; height: 2
                    color: accentCyan
                    opacity: 0.6
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "• sith-showcase — Terminal rice demo\n• sith-wallpaper — Wallpaper switcher\n• sith-fetch — System info display\n• sith-theme — Theme manager\n• Firefox with cyberpunk startpage\n• Themed man pages with syntax highlighting"
                    font.pixelSize: 14
                    color: fgColor
                    lineHeight: 1.6
                }
            }
        }
    }

    // Slide 5: Performance
    Slide {
        Rectangle {
            anchors.fill: parent
            color: bgColor

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "OPTIMIZED"
                    font.pixelSize: 28
                    font.bold: true
                    font.letterSpacing: 4
                    color: accentPurple
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 300; height: 2
                    color: accentCyan
                    opacity: 0.6
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "• Zram compressed swap for speed\n• PipeWire low-latency audio\n• Parallel package downloads\n• NVIDIA + AMD driver support\n• Wayland with KWin compositor\n• UEFI and BIOS boot support"
                    font.pixelSize: 14
                    color: fgColor
                    lineHeight: 1.6
                }
            }
        }
    }

    // Slide 6: Closing
    Slide {
        Rectangle {
            anchors.fill: parent
            color: bgColor

            Column {
                anchors.centerIn: parent
                spacing: 20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "THE DARK SIDE\nOF LINUX"
                    font.pixelSize: 36
                    font.bold: true
                    font.letterSpacing: 4
                    color: accentCyan
                    horizontalAlignment: Text.AlignHCenter
                    lineHeight: 1.2
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 300; height: 2
                    color: accentPurple
                    opacity: 0.8
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Peace is a lie. There is only passion."
                    font.pixelSize: 14
                    font.italic: true
                    color: accentRed
                    opacity: 0.8
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "github.com/JROtto5/sith-os"
                    font.pixelSize: 12
                    color: dimColor
                }
            }
        }
    }

    function onActivate() {
        presentation.currentSlide = 0
    }

    function onLeave() {}
}
