// Copyright (C) 2020 twyleg
import QtQuick 2.0
import "../"

Item {

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

	Text {
		x: parent.width * 0.2
		y: parent.height * 0.08

		font.family: cpMonoFont.name
		font.pointSize: 17
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
	}


	//
	// Lower line
	//

	Text {
		x: parent.width * 0.2
		y: parent.height * 0.56

		font.family: cpMonoFont.name
		font.pointSize: 17
		text: "Gear-Box:"
		color: "white"
	}

	CircularArcInstrument {

		radius: parent.width * 0.07
		x: parent.width * 0.25 - radius
		y: parent.height * 0.75  - radius

		nameText: "Pwr In"
		nameTextSize: 13
		unitText: "kw/h"
		unitTextSize: 14
		valueTextSize: 22

		valueMax: 500
		value: gearboxPowerIn
		font: cpMonoFont
	}

	CircularArcInstrument {

		radius: parent.width * 0.07
		x: parent.width * 0.4166 - radius
		y: parent.height * 0.75  - radius

		nameText: "Rot In"
		nameTextSize: 13
		unitText: "rpm"
		unitTextSize: 14
		valueTextSize: 22

		valueMax: 11000
		value: gearboxRotationIn
		font: cpMonoFont
	}

	CircularArcInstrument {

		radius: parent.width * 0.07
		x: parent.width * 0.5833 - radius
		y: parent.height * 0.75  - radius

		nameText: "Pwr Out"
		nameTextSize: 13
		unitText: "kw/h"
		unitTextSize: 14
		valueTextSize: 22

		valueMax: 500
		value: gearboxPowerOut
		font: cpMonoFont
	}

	CircularArcInstrument {

		radius: parent.width * 0.07
		x: parent.width * 0.75 - radius
		y: parent.height * 0.75  - radius

		nameText: "Rot Out"
		nameTextSize: 13
		unitText: "rpm"
		unitTextSize: 14
		valueTextSize: 22

		valueMax: 11000
		value: gearboxRotationOut
		font: cpMonoFont
	}


}
