// Copyright (C) 2020 twyleg
import QtQuick 2.0

import org.opendashboard.utils 0.1

Item {
	id: forces

	property real ax: 0
	property real ay: 0
	property real radius: 0.2 * width

	onAxChanged: updateForces()
	onAyChanged: updateForces()

	Svg {
		id: background
		source: qwd + "/build/extracted_layers/tachometer_forces.svg"
	}

	Item {
		id: circle

		width: parent.width
		height: parent.height

		Svg {
			source: qwd + "/build/extracted_layers/tachometer_forces_circle.svg"
		}
	}

	function updateForces()
	{
		circle.x = (forces.ay / 9.81) * (radius / 5.0)
		circle.y = (forces.ax / 9.81) * (radius / 5.0)
	}
}
