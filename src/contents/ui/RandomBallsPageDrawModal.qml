import QtQuick 2.6
import QtQuick.Controls 2.2 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.5 as Kirigami

Kirigami.OverlaySheet {
	id: randomBallsPageDrawModal
	property var ballColorsDrawn: []
	header: Kirigami.Heading {
		text: "Balls drawn"
	}
	ListView {
		model: ballColorsDrawn
		implicitWidth: Kirigami.Units.gridUnit * 30
		highlight: Item {}
		delegate: Kirigami.BasicListItem {
			label: modelData.humanText
			// Need both properties to break the highlighter.
			activeTextColor: modelData.color
			textColor: modelData.color
		}
	}

	// GridView {
	// 	model: ballColorsDrawn
	// 	implicitWidth: Kirigami.Units.gridUnit * 30
	// 	width: Kirigami.Units.gridUnit * 30
	// 	cellWidth: Kirigami.Units.iconSizes.huge
	// 	cellHeight: Kirigami.Units.iconSizes.huge
	// 	anchors.fill: parent
	// 	// Layout.minimumHeight: Kirigami.Units.iconSizes.huge
	// 	// Layout.maximumHeight: Kirigami.Units.iconSizes.huge * 10
	// 	delegate: Rectangle {
	// 		color: modelData.color
	// 		Layout.fillHeight: true
	// 		Layout.maximumHeight: Kirigami.Units.iconSizes.huge
	// 		Layout.preferredWidth: height
	// 		Text {
	// 			anchors.centerIn: parent
	// 			text: modelData.humanText
	// 		}
	// 	}
	// }

	footer: RowLayout {
		Controls.ToolButton {
			id: buttonReplace
			text: "Replace"
			onClicked: randomBallsPageDrawModal.close()
			Layout.alignment: Qt.AlignLeft
		}
		Item {
			Layout.fillWidth: true
		}
		Controls.ToolButton {
			id: buttonRemove
			text: "Remove"
			onClicked: {
				let freq = new Map();
				for (let i = 0; i < ballColorsDrawn.length; i++) {
					let v = ballColorsDrawn[i];
					freq.set(v.color, 1 + (freq.get(v.color) || 0));
				}
				for (let i = 0; i < listOfBalls.count; i++) {
					let el = listOfBalls.get(i);
					el.count -= freq.get(el.color) || 0;
				}
				randomBallsPageDrawModal.close();
			}
			Layout.alignment: Qt.AlignRight
		}
	}
}
