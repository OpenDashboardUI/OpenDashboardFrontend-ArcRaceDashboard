// Copyright (C) 2020 twyleg
import QtQuick 2.0

CircularArc {

	property var font

	property alias nameText: nameTextField.text
	property alias unitText: unitTextField.text

	property alias nameTextSize: nameTextField.font.pointSize
	property alias valueTextSize: valueTextField.font.pointSize
	property alias unitTextSize: unitTextField.font.pointSize

	Text {
		id: nameTextField

		anchors.centerIn: parent
		anchors.verticalCenterOffset: - parent.height * 0.1

		font.pointSize: 15
		color: "white"

		font.family: parent.font.name
		text: "example"
	}

	Text {
		id: valueTextField

		anchors.centerIn: parent
		anchors.verticalCenterOffset: parent.height * 0.1

		font.family: parent.font.name
		font.pointSize: 24
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
		font.pointSize: 16
		color: "white"

		text: "psi"
	}
}
