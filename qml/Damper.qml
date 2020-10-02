// Copyright (C) 2020 twyleg
import QtQuick 2.0

Item {

	id: damper

	property double input: 0
	property double output: 0

	property int interval: 10
	property double constantT: 0.1

	onInputChanged: timer.start();

	Timer {
		id: timer
		interval: damper.interval
		running: false
		repeat: true
		onTriggered: {
			var dt = interval * 0.001
			output = output + ( dt / (constantT + dt) ) * (input - output)

			if (Math.abs(input - output) < 1.0)
			{
				timer.stop();
			}
		}
	}
}
