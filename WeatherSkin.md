# Introduction #

Weather skin is used to display the weather notification and other weather information.

It's the separate application which is called from the Weather Notification to display the updated weather.

## Main activity ##

Weather Notification application has the Main Activity which displays all weather information and configuration options.

The weather information displayed on the Main Activity is just to indicate the user that the weather is received correctly. The pretty formatted information should be provided by the skins.

The skins can start the Main Activity to show the configuration options by the user request.

## Naming ##

The main Weather Application searches skins in the Android Market by their name. So, the skin application name should contain the letters "WNS" (acronym for Weather Notification Skin) to be easy installed from the Main Activity.

Note: Before v.0.3 the search for skin is done by "Weather Notification Skin" sentence.

The "WNS" abbreviation shouldn't be internationalized.

## Configuration parameters ##

Enabling or disabling of the skin is made by the main application. The enable notification flag is passed in the intent to weather notification broadcast receiver.

Each skin can have it's own parameters:
  * text color
  * temperature units
  * display plus sign
  * wind speed units
  * etc...

The skin should take care about these parameters. The special activity with skin preferences should be created. This activity is opened from the main Weather Notification application.

# Components #

## Weather notification broadcast receiver ##

It is a `BroadcastReceiver` (usually inherited from [WeatherNotificationReceiver](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/skin/impl/WeatherNotificationReceiver.html)) which is notified by Weather Notification when a new weather information is available.

The Receiver should:
  * display the Weather passed in the start Intent extra using [NotificationManager](http://developer.android.com/reference/android/app/NotificationManager.html).
  * hide the weather notification if necessary.
  * save received Weather to be displayed later on Weather Info Activity. To save the Weather into [SharedPreferences](http://developer.android.com/reference/android/content/SharedPreferences.html) you can use [WeatherStorage](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/WeatherStorage.html).

The Intent, passed to the receiver, has action [ACTION\_WEATHER\_UPDATE\_2](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/IntentParameters.html#ACTION_WEATHER_UPDATE_2). The Weather Notification finds the broadcast receivers which accepts this intent action as weather notification skins.

Note: prior v.0.3 the action was named as ACTION\_WEATHER\_UPDATE. The format of the old and the new intents are not compatible: the Weather didn't contain wind and humidity information.

The Intent contains the extras:
  * [EXTRA\_WEATHER](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/IntentParameters.html#EXTRA_WEATHER) holds updated [Weather](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/Weather.html)
  * [EXTRA\_ENABLE\_NOTIFICATION](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/IntentParameters.html#EXTRA_ENABLE_NOTIFICATION) holds boolean flag about notification state, if `false` the weather notification should be hidden.

The Intent is sent to the Receiver each time the weather notification should be updated or cleared. This can happen not only on weather update, but also when the specified skin is enabled or disabled.

## Weather notification skin preferences activity ##

The Activity to edit the skin preferences. This Activity can be opened from the main Weather Notification application.

The Intent passed to the activity has action [ACTION\_WEATHER\_SKIN\_PREFERENCES](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/IntentParameters.html#ACTION_WEATHER_SKIN_PREFERENCES). The Weather Notification finds the activities which accepts this intent action as configurable weather notification skins.

## Weather info activity ##

The Activity which should be displayed when the notification is clicked.

It should be the default activity, or some custom activity, which can be provided by the skin. Use [Notification.contentIntent](http://developer.android.com/reference/android/app/Notification.html#contentIntent) to provide the intent to start the activity.

### Force weather update ###

Weather info activity can have a button to force weather update. Click to the button should start the [UpdateService](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/app/UpdateService.html) of the main Weather Notification application. On the weather update complete the skin's Receiver will receive the updated weather value.

To start the service, skin application should have [START\_UPDATE\_SERVICE](https://code.google.com/p/weather-notification-android/source/browse/core/AndroidManifest.xml#104) permission and use Intent with [ACTION\_START\_UPDATE\_SERVICE](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/AppUtils.html#ACTION_START_UPDATE_SERVICE) action. The easiest way to do this is to call static method `AppUtils`.[startUpdateService](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/AppUtils.html#startUpdateService(Context))()

### Start main activity ###

You can start the Main Activity with all configuration options from the Weather Info Activity. Use Intent with [ACTION\_START\_MAIN\_ACTIVITY](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/AppUtils.html#ACTION_START_MAIN_ACTIVITY) action or call `AppUtils`.[startMainActivity](http://wiki.weather-notification-android.googlecode.com/hg/javadoc/ru/gelin/android/weather/notification/AppUtils.html#startMainActivity(Context))() method.

# Libraries #

You should include two Android libraries to your project to build the skin:

[libweather](https://code.google.com/p/weather-notification-android/source/browse/libs/#libs%2Flibweather)

[libweatherskin](https://code.google.com/p/weather-notification-android/source/browse/libs/#libs%2Flibweatherskin)

# Skin examples #

[Black text skin](http://code.google.com/p/weather-notification-android/source/browse/#hg%2Fskins%2Fblack-text)

[White text skin](http://code.google.com/p/weather-notification-android/source/browse/#hg%2Fskins%2Fwhite-text)