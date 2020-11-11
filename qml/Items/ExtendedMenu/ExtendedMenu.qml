// Copyright (C) 2020 twyleg
import QtLocation 5.6
import QtPositioning 5.6
import QtWebEngine 1.1
import QtWebChannel 1.0

import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

import org.opendashboard.utils 0.1

import "./Subviews"

Item {
	id: extendedMenu

	property bool leftPressed: false
	property bool rightPressed: false

	property int currentView: 0

	property bool animation: false

	Svg {
		source: qwd + "/build/extracted_layers/extended_menu_frame.svg"
		fillMode: Image.Stretch
		smooth: !extendedMenu.animation
	}

	Svg {
		source: qwd + "/build/extracted_layers/extended_menu_button_left_inactive.svg"
		fillMode: Image.Stretch
		smooth: !extendedMenu.animation
	}

	Svg {
		source: qwd + "/build/extracted_layers/extended_menu_button_left_active.svg"
		visible: leftPressed
		fillMode: Image.Stretch
		smooth: !extendedMenu.animation
	}

	Svg {
		source: qwd + "/build/extracted_layers/extended_menu_button_right_inactive.svg"
		fillMode: Image.Stretch
		smooth: !extendedMenu.animation
	}

	Svg {
		source: qwd + "/build/extracted_layers/extended_menu_button_right_active.svg"
		visible: rightPressed
		fillMode: Image.Stretch
		smooth: !extendedMenu.animation
	}

	Item {
		id: navigation

		width: parent.width
		height: parent.height * 0.1
		anchors.bottom: parent.bottom

		MouseArea {
			id: leftClickArea

			width: parent.width/2
			height: parent.height
			anchors.left: parent.left
			onPressedChanged: leftPressed = pressed
			onPressed: leftClick()
		}

		MouseArea {
			id: rightClickArea

			width: parent.width/2
			height: parent.height
			anchors.right: parent.right
			onPressedChanged: rightPressed = pressed
			onPressed: rightClick()
		}
	}

	Item {
		id: content

		height: parent.height * 0.9
		width: parent.width * 0.8
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.top: parent.top

		StackView {
			id: stack
			anchors.fill: parent

			property variant items: [
				trackViewComponent.createObject(),
				engineViewComponent.createObject(),
			]

			Component{
				id: trackViewComponent

				Item {
					TrackView {
						width: stack.width * 0.9
						height: stack.height * 0.9
						anchors.centerIn: parent

						lon: dataModel.positionLon
						lat: dataModel.positionLat
					}
				}
			}

			Component{
				id: engineViewComponent

				EngineView{
					width: stack.width
					height: stack.height

					engineRpm: dataModel.engineRpm
					enginePowerOut: dataModel.enginePowerOut
					engineTorque: dataModel.engineTorque

					gearboxPowerIn: dataModel.gearboxPowerIn
					gearboxPowerOut: dataModel.gearboxPowerOut
					gearboxRotationIn: dataModel.gearboxRotationIn
					gearboxRotationOut: dataModel.gearboxRotationOut
				}
			}

			delegate: StackViewDelegate {

				pushTransition: StackViewTransition {
					PropertyAnimation {
						target: enterItem
						property: "scale"
						from: 0.0
						to: 1.0
					}
					PropertyAnimation {
						target: exitItem
						property: "scale"
						from: 1.0
						to: 0.0
					}
				}
			}

			Component.onCompleted: {
				push( { item: items[0], destroyOnPop:false })
			}
		}
	}

	function leftClick() {
		var nextView = currentView - 1;

		if (nextView < 0)
			return;

		stack.items[currentView].transformOrigin = Item.Right;
		stack.items[nextView].transformOrigin = Item.Left;

		stack.push({item: stack.items[nextView], replace: true});
		currentView = nextView;
	}

	function rightClick() {
		var nextView = currentView + 1;

		if (nextView >= stack.items.length)
			return;

		stack.items[currentView].transformOrigin = Item.Left;
		stack.items[nextView].transformOrigin = Item.Right;

		stack.push({item: stack.items[nextView], replace: true});
		currentView = nextView;
	}
}
