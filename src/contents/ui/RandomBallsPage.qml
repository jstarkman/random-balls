import QtQuick 2.6
import QtQuick.Controls 2.2 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.5 as Kirigami

// Kirigami Pages are analogous to Android Activities
Kirigami.ScrollablePage {
	id: randomBalls
	title: i18n("Contents of the bag/urn")
	Layout.fillWidth: true

	actions.main: Kirigami.Action {
		id: actionAdd
		text: "Add new ball"
		onTriggered: randomBallsPageAddOverlaySheet.open()
	}

	RandomBallsPageAddOverlaySheet {
		id: randomBallsPageAddOverlaySheet
	}

	RandomBallsPageDrawModal {
		id: randomBallsPageDrawModal
	}

	Kirigami.CardsListView {
		id: ballList
		model: listOfBalls
		delegate: BallEntryCard {
			// This must be an exact string match.
			id: delegateLayout
		}
		headerPositioning: ListView.InlineHeader
		header: RowLayout {
			id: delegateLayout
			anchors {
				left: parent.left
				top: parent.top
				right: parent.right
				//IMPORTANT: never put the bottom margin
			}
			Controls.SpinBox {
				id: spinBoxDrawingSampleSize
				value: 0
				editable: true
				from: 0
				to: 999999
				Kirigami.FormData.label: "Draw this many balls:"
				Layout.alignment: Qt.AlignVCenter
				Layout.fillWidth: true
			}
			Controls.Button {
				Layout.alignment: Qt.AlignVCenter
				text: "Draw"
				onClicked: {
					let sampleSize = 0 + spinBoxDrawingSampleSize.value;
					if (!sampleSize) return;
					// https://stackoverflow.com/a/11935263
					function getRandomSubarray(arr, size) {
						var shuffled = arr.slice(0), i = arr.length, min = i - size, temp, index;
						while (i-- > min) {
							index = Math.floor((i + 1) * Math.random());
							temp = shuffled[index];
							shuffled[index] = shuffled[i];
							shuffled[i] = temp;
						}
						return shuffled.slice(min);
					}
					// poor man's flatMap
					let bag = [];
					for (let i = 0; i < listOfBalls.count; i++) {
						let el = listOfBalls.get(i);
						for (let j = 0; j < el.count; j++) {
							bag.push(el);
						}
					}
					if (bag.length == 0) return;
					sampleSize = Math.min(sampleSize, bag.length);
					let sample = getRandomSubarray(bag, sampleSize);
					sample.sort((a,b) => a.color < b.color ? -1 : a.color > b.color ? 1 : 0);
					randomBallsPageDrawModal.ballColorsDrawn = sample;
					randomBallsPageDrawModal.open()
				}
			}
		}
	}

	ListModel {
		id: listOfBalls
		ListElement { color: "#ff0000"; humanText: "foo"; count: 24 }
		ListElement { color: "#00ff00"; humanText: "bar"; count: 12 }
		ListElement { color: "#0000ff"; humanText: "baz"; count: 6 }
	}
}
