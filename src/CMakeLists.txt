qt5_add_resources(RESOURCES
	resources.qrc
)

if (CMAKE_SYSTEM_NAME STREQUAL "Android")
	find_package(KF5Kirigami2 ${KF5_DEP_VERSION} REQUIRED)

	set(random-balls_EXTRA_LIBS
		/opt/qt/5.12.5/android_arm64_v8a/lib/libQt5Concurrent.so

		# TODO: Is this used at all?
		Qt5::AndroidExtras
	)
endif()

add_executable(random-balls main.cpp ${RESOURCES})

target_link_libraries(random-balls
	Qt5::Core
	Qt5::Quick
	Qt5::Qml
	Qt5::Gui
	Qt5::QuickControls2
	Qt5::Widgets
	KF5::Kirigami2
	${random-balls_EXTRA_LIBS}
)

install(TARGETS random-balls ${KF5_INSTALL_TARGETS_DEFAULT_ARGS})
