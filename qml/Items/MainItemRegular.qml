// Copyright (C) 2020 twyleg
import QtQuick 2.2
import QtQuick.Window 2.1

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

import QtPositioning 5.5
import QtLocation 5.6

import "./Instruments"
import "./ExtendedMenu"

Item {
	id: cockpit

	anchors.fill: parent

	property bool isMenuExtended: false
	property real tachometerRelX: 0.5
	property real extendedMenuRelX: 0.0

	ExtendedMenu {
		id: extendedMenu

		width: parent.width * 0.66 * extendedMenuRelX
		height: parent.height * 0.7 * extendedMenuRelX

		x: parent.width * 0.65 - width/2
		y: parent.height * 0.48 - height/2

		opacity: 0
	}

	Tachometer {
		id: tachometer

		width: parent.height * 0.95
		height: parent.height * 0.95

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
			to: 0.25
			easing.type: Easing.InOutQuad
			duration: 200
		}

		ParallelAnimation {
			PropertyAnimation {
				target: cockpit
				property: "extendedMenuRelX"
				to: 1.0
				easing.type: Easing.InOutQuad
				duration: 300
			}
			PropertyAnimation {
				target: extendedMenu
				property: "opacity"
				to: 1.0
				easing.type: Easing.InOutQuad
				duration: 300
			}

			onStarted: extendedMenu.animation = true
			onStopped: extendedMenu.animation = false

		}

	}

	SequentialAnimation {
		id: closeExtendedMenuAnimation

		ParallelAnimation {
			PropertyAnimation {
				target: cockpit
				property: "extendedMenuRelX"
				to: 0.0
				easing.type: Easing.InOutQuad
				duration: 300
			}
			PropertyAnimation {
				target: extendedMenu
				property: "opacity"
				to: 0.0
				easing.type: Easing.InOutQuad
				duration: 300
			}
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
