// Copyright (C) 2020 twyleg
import QtQuick 2.0
import "../../Instruments"

Item {
	id: engineView

	property real throttle: 0
	property real brake: 0

	property real engineRpm: 0
	property real enginePowerOut: 0
	property real engineTorque: 0

	property real gearboxPowerIn: 0
	property real gearboxPowerOut: 0
	property real gearboxRotationIn: 0
	property real gearboxRotationOut: 0

	//
	// Upper line
	//
	property int upperLineNameTextSize: 0.04 * height
	property int upperLineValueTextSize: 0.04 * height
	property int upperLineUnitTextSize: 0.04 * height

	Text {
		x: parent.width * 0.2
		y: parent.height * 0.08

		font.family: cpMonoFont.name
		font.pixelSize: 0.05 * parent.height
		text: "Engine:"
		color: "white"
	}

	CircularArcInstrument {
		id: rpmInstrument

		radius: parent.width * 0.09
		x: parent.width * 0.27 - radius
		y: parent.height * 0.3  - radius

		nameText: "RPM"
		unitText: "rpm"
		valueMax: 10000
		value: engineRpm
		font: cpMonoFont

		nameTextSize: upperLineNameTextSize
		valueTextSize: upperLineValueTextSize
		unitTextSize: upperLineUnitTextSize
	}

	CircularArcInstrument {

		radius: parent.width * 0.09
		x: parent.width * 0.50 - radius
		y: parent.height * 0.3  - radius

		nameText: "Torque"
		unitText: "Nm"
		valueMax: 800
		value: engineTorque
		font: cpMonoFont

		nameTextSize: upperLineNameTextSize
		valueTextSize: upperLineValueTextSize
		unitTextSize: upperLineUnitTextSize
	}

	CircularArcInstrument {

		radius: parent.width * 0.09
		x: parent.width * 0.75 - radius
		y: parent.height * 0.3  - radius

		nameText: "Power"
		unitText: "kw/h"
		valueMax: 500
		value: enginePowerOut
		font: cpMonoFont

		nameTextSize: upperLineNameTextSize
		valueTextSize: upperLineValueTextSize
		unitTextSize: upperLineUnitTextSize
	}


	//
	// Lower line
	//
	property int lowerLineNameTextSize: 0.03 * height
	property int lowerLineValueTextSize: 0.03 * height
	property int lowerLineUnitTextSize: 0.03 * height

	Text {
		x: parent.width * 0.2
		y: parent.height * 0.56

		font.family: cpMonoFont.name
		font.pixelSize: 0.05 * parent.height
		text: "Gear-Box:"
		color: "white"
	}

	CircularArcInstrument {

		radius: parent.width * 0.07
		x: parent.width * 0.25 - radius
		y: parent.height * 0.75  - radius

		nameText: "Pwr In"
		unitText: "kw/h"

		valueMax: 500
		value: gearboxPowerIn
		font: cpMonoFont

		nameTextSize: lowerLineNameTextSize
		valueTextSize: lowerLineValueTextSize
		unitTextSize: lowerLineUnitTextSize
	}

	CircularArcInstrument {

		radius: parent.width * 0.07
		x: parent.width * 0.4166 - radius
		y: parent.height * 0.75  - radius

		nameText: "Rot In"
		unitText: "rpm"

		valueMax: 11000
		value: gearboxRotationIn
		font: cpMonoFont

		nameTextSize: lowerLineNameTextSize
		valueTextSize: lowerLineValueTextSize
		unitTextSize: lowerLineUnitTextSize
	}

	CircularArcInstrument {

		radius: parent.width * 0.07
		x: parent.width * 0.5833 - radius
		y: parent.height * 0.75  - radius

		nameText: "Pwr Out"
		unitText: "kw/h"

		valueMax: 500
		value: gearboxPowerOut
		font: cpMonoFont

		nameTextSize: lowerLineNameTextSize
		valueTextSize: lowerLineValueTextSize
		unitTextSize: lowerLineUnitTextSize
	}

	CircularArcInstrument {

		radius: parent.width * 0.07
		x: parent.width * 0.75 - radius
		y: parent.height * 0.75  - radius

		nameText: "Rot Out"
		unitText: "rpm"

		valueMax: 11000
		value: gearboxRotationOut
		font: cpMonoFont

		nameTextSize: lowerLineNameTextSize
		valueTextSize: lowerLineValueTextSize
		unitTextSize: lowerLineUnitTextSize
	}


}
