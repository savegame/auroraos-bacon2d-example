#include <auroraapp.h>
#include <QtQuick>
#include <QQmlApplicationEngine>

#include <private/plugins.h>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("ru.sashikknox"));
    application->setApplicationName(QStringLiteral("bacon2d"));

    Plugins plugin;
    plugin.registerTypes("Bacon2D");

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/main.qml")));
    view->show();
//    QQmlApplicationEngine engine;
//    engine.rootContext()->setContextProperty("standardmodel", &model);
//    engine.rootContext()->setContextProperty("stringmodel", strings);
//    engine.load(Aurora::Application::pathTo(QStringLiteral("qml/main.qml")));

    return application->exec();
}
