if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
	message(FATAL_ERROR "Only out-of-source builds are supported.")
endif()

cmake_minimum_required(VERSION 3.16)

project(random-balls)

set(KF_MIN_VERSION "5.68.0")
set(KF5_DEP_VERSION 5.68.0)
set(QT_MIN_VERSION "5.12.0")
set(REQUIRED_QT_VERSION "5.12.0")

find_package(ECM ${KF_MIN_VERSION} REQUIRED NO_MODULE)

set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH})
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(ECMSetupVersion)
include(ECMGenerateHeaders)
include(ECMPoQmTools)
include(ECMQMLModules)

find_package(Qt5 ${QT_MIN_VERSION} REQUIRED NO_MODULE COMPONENTS
	Core
	Quick
	Test
	Gui
	QuickControls2
	Widgets
)

if(CMAKE_SYSTEM_NAME STREQUAL "Android")
	find_package(Qt5AndroidExtras ${REQUIRED_QT_VERSION} REQUIRED)
endif()

find_package(KF5 ${KF_MIN_VERSION} REQUIRED COMPONENTS
	Kirigami2
)  # I18n CoreAddons

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(src)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
