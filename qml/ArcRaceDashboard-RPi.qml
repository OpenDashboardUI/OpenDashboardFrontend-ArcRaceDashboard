// Copyright (C) 2020 twyleg
import QtQuick 2.2
import QtQuick.Window 2.1

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

import QtPositioning 5.5
import QtLocation 5.6

import "./Items/"

Rectangle {
	id: root

	width: 800
	height: 480

	color: '#202020'

	FontLoader {
		id: cpMonoFont
		source: qwd + "/fonts/CPMono_v07_Plain.otf"
	}

	MainItemSteeringWheel {

		anchors.fill: parent

		tachometerFontSizeFactor: 0.65
		textInstrumentFontSizeFactor: 1.3

		color: parent.color

		tachometerRotation: dataModel.inputSteeringWheelAngle
	}
}
