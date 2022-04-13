import QtQuick 2.6
import QtQuick.Controls 2.2 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.5 as Kirigami

Kirigami.OverlaySheet {
	id: randomBallsPageAddOverlaySheet
	header: Kirigami.Heading {
		text: "Add new type of ball"
	}
	Kirigami.FormLayout {
		Controls.TextField {
			id: fieldColor
			Kirigami.FormData.label: "Color:"
			placeholderText: "CSS-like, such as #00ff00"
			onAccepted: fieldName.forceActiveFocus()
		}
		Controls.TextField {
			id: fieldName
			Kirigami.FormData.label: "Name:"
		}
		Controls.Button {
			id: addSubmitButton
			Layout.fillWidth: true
			text: "Add"
			enabled: fieldColor.text.length > 0 && fieldName.text.length > 0
			onClicked: {
				listOfBalls.append({
					color: fieldColor.text,
					humanText: fieldName.text,
					count: 0
				});
				fieldColor.text = ""
				fieldName.text = ""
				randomBallsPageAddOverlaySheet.close();
			}
		}
	}
}
