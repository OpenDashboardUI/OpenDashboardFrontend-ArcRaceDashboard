// Copyright (C) 2020 twyleg
import QtQuick 2.0

Rectangle {
	id: circularArc

	property int angleOffsetDeg: 90
	property real angleMax: 360

	property real value: 0.0
	property real valueMax: 1000.0

	property real angleDeg: angleMax * (value / valueMax)
	property real angleDegDamped: 0

	property int radius: 100

	property real arcWidthRelative: 0.3

	color: "transparent"
	width: radius * 2
	height: radius * 2

	onRadiusChanged: arcCanvas.createStyle()

	Damper {
		input: angleDeg

		onOutputChanged: {
			angleDegDamped = output
			arcCanvas.requestPaint()
		}
	}

	Canvas {
		id: arcCanvas

		anchors.fill: parent
		property var arcGradientPositive
		property var arcGradientNegative

		onPaint: {
			var ctx = getContext("2d");
			ctx.reset();

			if (!arcGradientPositive){
				createStyle();
			}

			var startRad = (angleOffsetDeg) * (Math.PI / 180.0);
			var endRad = (angleOffsetDeg + Math.abs(angleDegDamped) ) * (Math.PI / 180.0);

			ctx.beginPath()
			ctx.lineWidth = radius * arcWidthRelative;
			ctx.arc(
					radius,
					radius,
					radius * (1.0 - (arcWidthRelative/2.0)), // Calculate radius of arc line center
					startRad,
					endRad,
					false
			)

			if (angleDegDamped >= 0)
				ctx.strokeStyle = arcGradientPositive
			else
				ctx.strokeStyle = arcGradientNegative
			ctx.stroke()
		}

		function createStyle(){

			if (available === false)
				return;

			var ctx = getContext("2d");

			arcGradientPositive = ctx.createRadialGradient(
					radius,
					radius,
					0,
					radius,
					radius,
					radius
			);

			arcGradientPositive.addColorStop(1.0 - arcWidthRelative, 'rgba(200,200,200,255)');
			arcGradientPositive.addColorStop(1.0 - (arcWidthRelative/2.0), 'white');
			arcGradientPositive.addColorStop(1.0, 'rgba(200,200,200,255)');

			arcGradientNegative = ctx.createRadialGradient(
					radius,
					radius,
					0,
					radius,
					radius,
					radius
			);

			arcGradientNegative.addColorStop(1.0 - arcWidthRelative, 'rgba(255,100,100,255)');
			arcGradientNegative.addColorStop(1.0 - (arcWidthRelative/2.0), 'red');
			arcGradientNegative.addColorStop(1.0, 'rgba(255,100,100,255)');
		}
	}


}

