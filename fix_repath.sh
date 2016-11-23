PROJECT_DIR=`pwd`
BUILD_DIR=$PROJECT_DIR/FFmpeg-iOS
if [ ! -d "$BUILD_DIR" ]; then
  echo "run directory: $BUILD_DIR is invalid! must have a directory named FFmpeg-iOS"
  exit 1
fi

cp FFmpeg-iOS/lib/libavutil.dylib FFmpeg-iOS/lib/libavutil
cp FFmpeg-iOS/lib/libavformat.dylib FFmpeg-iOS/lib/libavformat
cp FFmpeg-iOS/lib/libavcodec.dylib FFmpeg-iOS/lib/libavcodec
cp FFmpeg-iOS/lib/libswscale.dylib FFmpeg-iOS/lib/libswscale

install_name_tool -id  @rpath/../Frameworks/libavutil.framework/libswscale FFmpeg-iOS/lib/libswscale
install_name_tool -id  @rpath/../Frameworks/libswscale.framework/libswscale FFmpeg-iOS/lib/libswscale

install_name_tool -change $BUILD_DIR/thin/x86_64/lib/libavutil.54.dylib @rpath/../Frameworks/libavutil.framework/libavutil FFmpeg-iOS/lib/libswscale
install_name_tool -change $BUILD_DIR/thin/arm64/lib/libavutil.54.dylib @rpath/../Frameworks/libavutil.framework/libavutil FFmpeg-iOS/lib/libswscale
install_name_tool -change $BUILD_DIR/thin/i386/lib/libavutil.54.dylib @rpath/../Frameworks/libavutil.framework/libavutil FFmpeg-iOS/lib/libswscale
install_name_tool -change $BUILD_DIR/thin/armv7/lib/libavutil.54.dylib @rpath/../Frameworks/libavutil.framework/libavutil FFmpeg-iOS/lib/libswscale

install_name_tool -id "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavutil
install_name_tool -id "@rpath/../Frameworks/libavformat.framework/libavformat" FFmpeg-iOS/lib/libavformat

install_name_tool -change "$BUILD_DIR/thin/x86_64/lib/libavcodec.56.dylib" "@rpath/../Frameworks/libavcodec.framework/libavcodec" FFmpeg-iOS/lib/libavformat
install_name_tool -change "$BUILD_DIR/thin/armv7/lib/libavcodec.56.dylib" "@rpath/../Frameworks/libavcodec.framework/libavcodec" FFmpeg-iOS/lib/libavformat
install_name_tool -change "$BUILD_DIR/thin/i386/lib/libavcodec.56.dylib" "@rpath/../Frameworks/libavcodec.framework/libavcodec" FFmpeg-iOS/lib/libavformat
install_name_tool -change "$BUILD_DIR/thin/arm64/lib/libavcodec.56.dylib" "@rpath/../Frameworks/libavcodec.framework/libavcodec" FFmpeg-iOS/lib/libavformat

install_name_tool -id "@rpath/../Frameworks/libavcodec.framework/libavcodec" FFmpeg-iOS/lib/libavcodec

install_name_tool -change "$BUILD_DIR/thin/x86_64/lib/libavutil.54.dylib" "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavformat
install_name_tool -change "$BUILD_DIR/thin/armv7/lib/libavutil.54.dylib" "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavformat
install_name_tool -change "$BUILD_DIR/thin/i386/lib/libavutil.54.dylib" "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavformat
install_name_tool -change "$BUILD_DIR/thin/arm64/lib/libavutil.54.dylib" "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavformat

install_name_tool -change "$BUILD_DIR/thin/x86_64/lib/libavutil.54.dylib" "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavcodec
install_name_tool -change "$BUILD_DIR/thin/armv7/lib/libavutil.54.dylib" "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavcodec
install_name_tool -change "$BUILD_DIR/thin/i386/lib/libavutil.54.dylib" "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavcodec
install_name_tool -change "$BUILD_DIR/thin/arm64/lib/libavutil.54.dylib" "@rpath/../Frameworks/libavutil.framework/libavutil" FFmpeg-iOS/lib/libavcodec
