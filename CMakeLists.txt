cmake_minimum_required(VERSION 3.1.0)

project(OpenDashboardFrontend-ArcRaceDashboard)

include(external/SvgLayerExtractor/cmake/svg_layer_extractor.cmake)
include(external/OpenDashboardQmlModules/cmake/open_dashboard_qml_modules.cmake)

EXTRACT_SVG_LAYERS(
	INPUT_FILES
	${CMAKE_CURRENT_SOURCE_DIR}/images/tachometer.svg
	${CMAKE_CURRENT_SOURCE_DIR}/images/extended_menu.svg
	${CMAKE_CURRENT_SOURCE_DIR}/images/external/nurburgring_nordschleife_map.svg
	OUTPUT_DIR
	${CMAKE_BINARY_DIR}/extracted_layers
)
