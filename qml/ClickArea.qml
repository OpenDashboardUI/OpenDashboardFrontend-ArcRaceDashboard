// Copyright (C) 2020 twyleg
import QtQuick 2.0

MouseArea {
	id: click_area

	property bool border: false
	property real relX: 0.5
	property real relY: 0.5
	property real relWidth: 1.0
	property real relHeight: 1.0
	property color color: "white"
	property bool isPressed: false

	width: parent.width * relWidth
	height: parent.height * relHeight

	x: parent.width * relX - width * 0.5
	y: parent.height * relY - height * 0.5

	onPressed: isPressed = true
	onReleased: isPressed = false

	Rectangle {
		visible: click_area.border
		anchors.fill: parent
		color: 'transparent'
		border.color: click_area.color
	}

}
