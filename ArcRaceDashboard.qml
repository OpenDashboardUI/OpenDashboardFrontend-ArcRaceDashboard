// Copyright (C) 2020 twyleg
import QtQuick 2.2
import QtQuick.Window 2.1

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

import QtPositioning 5.5
import QtLocation 5.6

import "./qml/"

Item {
	id: root

	anchors.fill: parent

	FontLoader {
		id: cpMonoFont
		source: qwd + "/fonts/CPMono_v07_Plain.otf"
	}

	MainItem {
		id: mainItem
		anchors.centerIn: parent
	}
}
