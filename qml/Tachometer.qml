// Copyright (C) 2020 twyleg
import QtQuick 2.0

Item {

	id: tachometer

	property real velocity: 0
	property real rpm: 0
	property int gear: 0

	property real ax: 0
	property real ay: 0
	property real az: 0

	property real throttle: 0
	property real brake: 0

	signal extendButtonPressed

	onGearChanged: gear_animation.start()

	Svg {
		id: tachometer_shadows
		source: qwd + "/build/extracted_layers/tachometer_shadows.svg"
	}

	ExtendButton {
		id: exten_button
		anchors.fill: parent
		onClicked: extendButtonPressed()
	}

	Item {
		id: tachometer_gear_lights
		width: parent.width
		height: parent.height

		anchors.centerIn: parent

		Svg {
			source: qwd + "/build/extracted_layers/tachometer_gear_light.svg"

			transform: Scale {
				property real scale: 1

				origin.x: tachometer_gear_lights.width * 0.5
				origin.y: tachometer_gear_lights.height * 0.7

				xScale: scale
				yScale: scale

				SequentialAnimation on scale{
					id: gear_animation
					running: true
					PropertyAnimation {
						to: 0.8
						duration: 100
					}
					PropertyAnimation {
						easing.type: Easing.OutInQuint
						to: 1.0
						duration: 200
					}
				}
			}
		}
	}

	Svg {
		id: tachometer_frame
		source: qwd + "/build/extracted_layers/tachometer_frame.svg"
	}

	Svg {
		id: tachometer_forces_throttle_light
		source: qwd + "/build/extracted_layers/tachometer_forces_throttle_light.svg"
		opacity: 0.2 + 0.8 * throttle
	}

	Svg {
		id: tachometer_forces_brake_light
		source: qwd + "/build/extracted_layers/tachometer_forces_brake_light.svg"
		opacity: 0.2 + 0.8 * brake
	}

	Svg {
		id: tachometer_forces
		source: qwd + "/build/extracted_layers/tachometer_forces.svg"
	}

	Forces {
		id: forces
		anchors.fill: parent
		ax: tachometer.ax
		ay: tachometer.ay
	}

	Svg {
		id: tachometer_text
		source: qwd + "/build/extracted_layers/tachometer_text.svg"
	}

	Text {
		id: gear
		text: tachometer.gear
		color: "white"
		font.family: cpMonoFont.name
		font.pointSize: 58
		anchors.verticalCenterOffset: parent.height * 0.21
		anchors.centerIn: parent
	}

	Text {
		id: velocityText
		text: tachometer.velocity.toFixed(0)
		color: "white"
		font.family: cpMonoFont.name
		font.pointSize: 74

		anchors.verticalCenterOffset: -parent.height * 0.25
		anchors.centerIn: parent
	}

	Text {
		id: rpmText
		text: tachometer.rpm.toFixed(0)
		color: "white"
		font.family: cpMonoFont.name
		font.pointSize: 38

		anchors.verticalCenterOffset: -parent.height * 0.17
		anchors.centerIn: parent
	}

	CircularArc {
		id: velocity_circular_arc

		anchors.centerIn: parent
		radius: parent.height * 0.395
		arcWidthRelative: 0.055

		valueMax: 360
		value: tachometer.velocity

	}

	CircularArc {
		id: rpm_circular_arc

		anchors.centerIn: parent
		radius: parent.height * 0.365
		arcWidthRelative: 0.062

		valueMax: 10000.0
		value: tachometer.rpm

	}
}
