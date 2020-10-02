// Copyright (C) 2020 twyleg
import QtQuick 2.2
import QtQuick.Window 2.1

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

import QtPositioning 5.5
import QtLocation 5.6


Item {
	id: cockpit

	anchors.centerIn: parent
	width: 1920
	height: 1080

	property bool isMenuExtended: false
	property real tachometerRelX: 0.5
	property real extendedMenuRelX: 0.0

	ExtendedMenu {
		id: extended_menu

		width: 1280 * extendedMenuRelX
		height: 768

		x: parent.width * 0.6 - width * 0.5
		y: parent.height * 0.48 - height * 0.5
	}

	Tachometer {
		id: tachometer

		width: 1000
		height: 1000

		x: parent.width * parent.tachometerRelX - width * 0.5
		y: parent.heigh * 0.5 - height * 0.5

		onExtendButtonPressed: cockpit.openExtendedMenu()

		rpm: dataModel.engineRpm
		gear: dataModel.gearboxGear

		velocity: dataModel.vehicleVelocity
		ax: dataModel.vehicleAx
		ay: dataModel.vehicleAy
		az: dataModel.vehicleAz

		throttle: dataModel.inputThrottle
		brake: dataModel.inputBrake
	}

	SequentialAnimation {
		id: openExtendedMenuAnimation

		PropertyAnimation {
			target: cockpit
			property: "tachometerRelX"
			to: 0.2
			easing.type: Easing.InOutQuad
			duration: 200
		}

		PropertyAnimation {
			target: cockpit
			property: "extendedMenuRelX"
			to: 1.0
			easing.type: Easing.InOutQuad
			duration: 300
		}
	}

	SequentialAnimation {
		id: closeExtendedMenuAnimation

		PropertyAnimation {
			target: cockpit
			property: "extendedMenuRelX"
			to: 0.0
			easing.type: Easing.InOutQuad
			duration: 300

		}

		PropertyAnimation {
			target: cockpit
			property: "tachometerRelX"
			to: 0.5
			easing.type: Easing.InOutQuad
			duration: 200
		}
	}

	function openExtendedMenu(){
		if (isMenuExtended){
			closeExtendedMenuAnimation.start();
		} else {
			openExtendedMenuAnimation.start();
		}
		isMenuExtended = !isMenuExtended
	}
}
