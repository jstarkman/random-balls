import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.5 as Kirigami

// Kirigami Pages are analogous to Android Activities
Kirigami.ApplicationWindow {
	id: root
	title: i18nc("@title:window", "Randomly pull balls from an urn or bag")
	pageStack.initialPage: Qt.resolvedUrl("RandomBallsPage.qml")
}
