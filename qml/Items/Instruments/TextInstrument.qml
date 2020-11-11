// Copyright (C) 2020 twyleg
import QtQuick 2.0

Column {

	property var font
	property real value: 0
	property real fontSizeFactor: 1

	property alias nameText: nameTextField.text
	property alias unitText: unitTextField.text

	property alias nameTextSize: nameTextField.font.pointSize
	property alias valueTextSize: valueTextField.font.pointSize
	property alias unitTextSize: unitTextField.font.pointSize

	Text {
		id: nameTextField

		anchors.horizontalCenter: parent.horizontalCenter

		font.pointSize: 15 * fontSizeFactor
		color: "white"

		font.family: parent.font.name
		text: "example"
	}

	Text {
		id: valueTextField

		anchors.horizontalCenter: parent.horizontalCenter

		font.family: parent.font.name
		font.pointSize: 24 * fontSizeFactor
		color: "white"

		text: Math.round(parent.value);
	}

	Text {
		id: unitTextField

		anchors.horizontalCenter: parent.horizontalCenter

		font.family: parent.font.name
		font.pointSize: 16 * fontSizeFactor
		color: "white"

		text: "psi"
	}
}
