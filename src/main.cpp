#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QUrl>
// #include <KLocalizedContext>
// #include <KLocalizedString>

int main(int argc, char *argv[]) {
	QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QApplication app(argc, argv);
	// KLocalizedString::setApplicationDomain("random-balls");
	QCoreApplication::setOrganizationName(QStringLiteral("Unorganized"));
	QCoreApplication::setOrganizationDomain(QStringLiteral("kde.org"));
	QCoreApplication::setApplicationName(QStringLiteral("Random Balls"));

	QQmlApplicationEngine engine;

	// engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	if (engine.rootObjects().isEmpty()) {
		return -1;
	}

	return app.exec();
}