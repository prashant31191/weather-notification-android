# Visibility #

The notification bar icon displays the current temperature. See [omsk-air-android](http://code.google.com/p/omsk-air-android/) project.

Other information is displayed on the notification view (which appears after tap-down the notification bar):
  * location (city, province...)
  * current temperature
  * weather condition (clouds...)
  * humidity
  * wind
  * last update time ?
  * icon ?

# Technical details #

## Location ##

Current location can be detected.
[android.location](http://developer.android.com/reference/android/location/package-summary.html) package is enough.

## Weather ##

Weather conditions can be taken from "unofficial" Google Weather API.
See http://blog.kron0s.com/google-weather-api, http://stackoverflow.com/questions/951839/api-to-get-weather-based-on-longitude-and-latitude-coordinates

May be other weather sources can be added in future (for Chinese users ;)