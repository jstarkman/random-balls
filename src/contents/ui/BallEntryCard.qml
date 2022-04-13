import QtQuick 2.6
import QtQuick.Controls 2.2 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.5 as Kirigami

// Adapted from:
// https://invent.kde.org/sdk/kirigami-gallery/-/blob/master/src/data/contents/ui/gallery/CardsListViewGallery.qml

Kirigami.AbstractCard {
	contentItem: Item {  // bug: cannot be `Layout` directly
		implicitWidth: delegateLayout.implicitWidth
		implicitHeight: delegateLayout.implicitHeight
		RowLayout {
			id: delegateLayout
			anchors {
				left: parent.left
				top: parent.top
				right: parent.right
				//IMPORTANT: never put the bottom margin
			}
			spacing: Kirigami.Units.smallSpacing

			Rectangle {
				color: model.color
				Layout.fillHeight: true
				Layout.maximumHeight: Kirigami.Units.iconSizes.huge
				Layout.preferredWidth: height
			}
			Kirigami.Heading {
				level: 1
				text: model.humanText
				Layout.fillHeight: true
				Layout.fillWidth: true
				Layout.alignment: Qt.AlignLeft|Qt.AlignVCenter
			}

			Controls.SpinBox {
				id: qtyBallsSpinBox
				value: model.count
				editable: true
				from: 0
				to: 999999
				onValueModified: {
					for (let i = 0; i < listOfBalls.count; i++) {
						let el = listOfBalls.get(i);
						if (el.color == model.color) {
							el.count = qtyBallsSpinBox.value;
							break;
						}
					}
				}
				Layout.alignment: Qt.AlignVCenter
			}
			Controls.Button {
				Layout.alignment: Qt.AlignRight|Qt.AlignVCenter
				text: "Delete"
				onClicked: listOfBalls.remove(index, 1)
			}
		}
	}
}
