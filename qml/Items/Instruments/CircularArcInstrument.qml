// Copyright (C) 2020 twyleg
import QtQuick 2.0

CircularArc {

	property var font

	property alias nameText: nameTextField.text
	property alias unitText: unitTextField.text

	property alias nameTextSize: nameTextField.font.pixelSize
	property alias valueTextSize: valueTextField.font.pixelSize
	property alias unitTextSize: unitTextField.font.pixelSize

	Text {
		id: nameTextField

		anchors.centerIn: parent
		anchors.verticalCenterOffset: - parent.height * 0.1

		font.pixelSize: 15
		color: "white"

		font.family: parent.font.name
		text: "example"
	}

	Text {
		id: valueTextField

		anchors.centerIn: parent
		anchors.verticalCenterOffset: parent.height * 0.1

		font.family: parent.font.name
		font.pixelSize: 24
		color: "white"

		text: parent.value.toPrecision(4);
	}

	Text {
		id: unitTextField

		anchors.left: parent.horizontalCenter
		anchors.leftMargin: 5
		anchors.verticalCenter: parent.verticalCenter
		anchors.verticalCenterOffset: parent.radius * (1.0 - arcWidthRelative/2.0)

		font.family: parent.font.name
		font.pixelSize: 16
		color: "white"

		text: "psi"
	}
}
