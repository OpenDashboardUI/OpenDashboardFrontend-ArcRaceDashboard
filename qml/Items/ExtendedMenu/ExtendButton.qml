// Copyright (C) 2020 twyleg
import QtQuick 2.0

import org.opendashboard.utils 0.1

Item {
	id: extendButton

	signal clicked(bool extended)
	property bool extended: false

	Svg {
		id: glow
		visible: mouseArea.pressed
		source: qwd + "/build/extracted_layers/tachometer_extend_button_glow.svg"
	}

	Svg {
		id: background
		source: qwd + "/build/extracted_layers/tachometer_extend_button.svg"
	}

	Svg {
		id: arrows
		source: qwd + "/build/extracted_layers/tachometer_extend_button_arrows.svg"

		transform: Rotation{
			id: rotateArrows

			origin.x: width * 0.5
			origin.y: height * 0.935

			PropertyAnimation on angle {
				id: rotate_arrows_animation
				to: 0
				easing.type: Easing.Linear
				duration: 500
			}
		}
	}

	Svg {
		id: moveLight
		source: qwd + "/build/extracted_layers/tachometer_extend_button_move_light.svg"

		transform: Rotation{
			id: rotate_move_light

			origin.x: moveLight.width * 0.5
			origin.y: moveLight.height * 0.9

			SequentialAnimation on angle {

				loops: Animation.Infinite
				PropertyAnimation {
					to: 85
					easing.type: Easing.InBounce
					duration: 2000
				}
				PropertyAnimation {
					to: -85
					easing.type: Easing.InBounce
					duration: 2000
				}
			}
		}
	}

	RelativeItem {

		relWidth: 0.2
		relHeight: 0.15
		relY: 0.9

		MouseArea {
			id: mouseArea
			anchors.fill: parent
			onClicked: buttonClicked()
		}
	}

	function buttonClicked(){

		if (extendButton.extended)
			rotate_arrows_animation.to = 0
		else
			rotate_arrows_animation.to = 180
		rotate_arrows_animation.start()

		extendButton.extended = !extendButton.extended
		extendButton.clicked(extendButton.extended)
	}
}
