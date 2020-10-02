// Copyright (C) 2020 twyleg
import QtQuick 2.0

import "../"

Item {
	id: trackView

	property real lat: 50.33827
	property real lon: 6.9496386

	// A: Hoheneichen
	// B: Wippermann
	property point imagePointA: Qt.point(0.2490589569160998, 0.858788341606211)
	property point imagePointB: Qt.point(0.8817120181405896, 0.192185312460226)

	property point mapPointA: Qt.point(6.9329183, 50.340457)
	property point mapPointB: Qt.point(7.0031238, 50.3734083)

	Item {
		id: content

		width: parent.width
		height: parent.height

		anchors.centerIn: parent
		anchors.horizontalCenterOffset: parent.width * 0.065

		Svg {
			id: track
			source: qwd + "/build/extracted_layers/nurburgring_nordschleife_map_track.svg"
		}

		Svg {
			id: text
			source: qwd + "/build/extracted_layers/nurburgring_nordschleife_map_text.svg"
		}

		Svg {
			id: marker
			source: qwd + "/images/track_view_marker.svg"

			anchors.fill: undefined
			width: parent.width * 0.03
			height: width
		}
	}

	onWidthChanged: updatePosition()
	onHeightChanged: updatePosition()

	onLatChanged: updatePosition()
	onLonChanged: updatePosition()

	function updatePosition() {

		var mapToImageX = (imagePointB.x - imagePointA.x) / (mapPointB.x - mapPointA.x);
		var mapToImageY = (imagePointB.y - imagePointA.y) / (mapPointB.y - mapPointA.y);

		var relImageX = imagePointA.x + (lon - mapPointA.x) * mapToImageX;
		var relImageY = imagePointA.y + (lat - mapPointA.y) * mapToImageY;

		var absImageX = relImageX * content.width
		var absImageY = relImageY * content.height

		marker.x = absImageX - marker.width/2;
		marker.y = absImageY - marker.height/2;

//		console.log("mapToImage: " + mapToImageX + " " + mapToImageY);
//		console.log("relImage: " + relImageX + " " + relImageY);
//		console.log("absImage: " + absImageX + " " + absImageY);
	}
}
