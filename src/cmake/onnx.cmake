if(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
  set(ONNX_URL "https://github.com/microsoft/onnxruntime/releases/download/v1.12.0/onnxruntime-win-x64-1.12.0.zip")
  set(URL_HASH "SHA256=8b5d61204989350b7904ac277f5fbccd3e6736ddbb6ec001e412723d71c9c176")
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    set(ONNX_URL "https://github.com/microsoft/onnxruntime/releases/download/v1.12.0/onnxruntime-linux-x64-1.12.0.tgz")
    set(URL_HASH "SHA256=5d503ce8540358b59be26c675e42081be14a3e833a5301926f555451046929c5")
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
  set(ONNX_URL "https://github.com/microsoft/onnxruntime/releases/download/v1.12.0/onnxruntime-osx-x86_64-1.12.0.tgz")
  set(URL_HASH "SHA256=09b17f712f8c6f19bb63da35d508815b443cbb473e16c6192abfaa297c02f600")
else()
  message(FATAL_ERROR "Unsupported CMake System Name '${CMAKE_SYSTEM_NAME}' (expected 'Windows', 'Linux' or 'Darwin')")
endif()

FetchContent_Declare(onnxruntime
  URL ${ONNX_URL}
  URL_HASH ${URL_HASH}
)
FetchContent_MakeAvailable(onnxruntime)
include_directories(${onnxruntime_SOURCE_DIR}/include)
link_directories(${onnxruntime_SOURCE_DIR}/lib)

if(MSVC)
  file(GLOB ONNX_DLLS "${onnxruntime_SOURCE_DIR}/lib/*.dll")
  if(CMAKE_BUILD_TYPE)
    file(COPY ${ONNX_DLLS} DESTINATION ${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE})
  else()
    file(COPY ${ONNX_DLLS} DESTINATION ${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE_INIT})
  endif()
endif()