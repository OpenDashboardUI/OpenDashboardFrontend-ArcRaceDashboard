import QtQuick 2.0

import "./Instruments"

Rectangle {

	property real tachometerFontSizeFactor: 1
	property real textInstrumentFontSizeFactor: 1

	property alias tachometerRotation: tachometer.rotation

	Tachometer {
		id: tachometer

		extendButtonVisible: false

		fontSizeFactor: tachometerFontSizeFactor

		anchors.centerIn: parent
		height: parent.height * 1.2
		width: height

		rpm: dataModel.engineRpm
		gear: dataModel.gearboxGear

		velocity: dataModel.vehicleVelocity
		ax: dataModel.vehicleAx
		ay: dataModel.vehicleAy
		az: dataModel.vehicleAz

		throttle: dataModel.inputThrottle
		brake: dataModel.inputBrake
	}

	Item {

		height: parent.height
		width: parent.width * 0.21
		anchors.left: parent.left

		TextInstrument {

			anchors.horizontalCenter: parent.horizontalCenter
			font: cpMonoFont
			fontSizeFactor: textInstrumentFontSizeFactor

			nameText: "Torque"
			unitText: "Nm"

			value: dataModel.engineTorque
		}

		TextInstrument {

			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			font: cpMonoFont
			fontSizeFactor: textInstrumentFontSizeFactor

			nameText: "Rot In"
			unitText: "RPM"

			value: dataModel.gearboxRotationIn
		}
	}

	Item {

		height: parent.height
		width: parent.width * 0.21
		anchors.right: parent.right

		TextInstrument {

			anchors.horizontalCenter: parent.horizontalCenter
			font: cpMonoFont
			fontSizeFactor: textInstrumentFontSizeFactor

			nameText: "Power"
			unitText: "Kw"

			value: dataModel.engineTorque
		}

		TextInstrument {

			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			font: cpMonoFont
			fontSizeFactor: textInstrumentFontSizeFactor

			nameText: "Rot Out"
			unitText: "RPM"

			value: dataModel.gearboxRotationOut
		}
	}
}
