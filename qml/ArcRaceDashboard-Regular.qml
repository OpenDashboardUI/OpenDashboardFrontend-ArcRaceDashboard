// Copyright (C) 2020 twyleg
import QtQuick 2.2
import QtQuick.Window 2.1

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

import QtPositioning 5.5
import QtLocation 5.6

import "./Items"

Rectangle {
	id: root

	width: 1920
	height: 1080

	color: "black"

	FontLoader {
		id: cpMonoFont
		source: qwd + "/fonts/CPMono_v07_Plain.otf"
	}

	MainItemRegular {
		id: mainItem
		anchors.centerIn: parent
	}

}
