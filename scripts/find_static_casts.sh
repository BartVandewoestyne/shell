#!/usr/bin/env bash
#
# This is a script I used when working for TrealitySVS.
#
# TODO: remove hardcoded paths and make it more flexible and more generally
# applicable.

find . \( -name "*.cpp" -o -name "*.h" \) \
         -a -not \( -name "*moc_*" -o -name "*ui_*" -o -name "*qrc_*" \
                    -o -path "*/Libraries/ICCommon/Qt/*" \
                    -o -path "*/Libraries/googletest/*" \
                    -o -path "*/CryptoPP/*" \
                    -o -path "*/IntelTBB/*" \
                    -o -path "*/OpenCV/*" \
                    -o -path "*/MatrixVisionSDK/*" \
                 \) \
  -exec grep -Hl 'static_cast' {} \;
