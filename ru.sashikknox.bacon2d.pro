TARGET = ru.sashikknox.bacon2d

include(bacon2d/src/Bacon2D-static.pri)

CONFIG += \
    auroraapp
DEFINES += AURORAOS

PKGCONFIG += zlib

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    qml/main.qml \
    qml/Context.qml \
    qml/components/* \
    qml/qmldir \
    qml/effects/* \
    qml/scenes/* \
    qml/entities/* \
    assets/background/* \
    assets/fonts/* \
    rpm/ru.sashikknox.bacon2d.spec

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.sashikknox.bacon2d.ts \
    translations/ru.sashikknox.bacon2d-ru.ts \

qml_files.files = qml
qml_fiels.path = /usr/share/$$TARGET/

assets_files.files = assets
assets_files.path = /usr/share/$$TARGET/

INSTALLS += qml_files assets_files
