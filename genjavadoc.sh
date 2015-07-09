#!/bin/sh

javadoc -d javadoc \
-sourcepath ../weather-notification-android/libs/libweather/src:../weather-notification-android/libs/libweatherskin/src:../weather-notification-android/core/src \
-subpackages ru.gelin.android.weather \
-source 1.5 \
-windowtitle 'Weather API Specification' \
-group "libweather" "ru.gelin.android.weather:ru.gelin.android.weather.notification" \
-group "libweatherskin" "ru.gelin.android.weather.notification.skin:ru.gelin.android.weather.notification.skin.impl" \
-group "coreapp" "ru.gelin.android.weather.*" \
-linkoffline http://d.android.com/reference/ file:///opt/android-sdk/docs/reference

hg add
#hg ci -m "Updated Javadoc"
#hg push --insecure
