# react-native-unity-ads-module

`react-native-unity-ads-module` enables you to show Unity ADS in your React Native based app using Unity Ads SDK 2.0 ([Android](https://github.com/Unity-Technologies/unity-ads-android), [iOS](https://github.com/Unity-Technologies/unity-ads-ios)).

# Author

`react-native-unity-ads-module` is Forked from [`react-native-unity-ads`](https://github.com/th0th/react-native-unity-ads) created by [Gökhan Sarı](meisth0th@gmail.com). 

## Installation

### Quick

For quick installation, you can install the npm package and then let react-native do the hard work.

```sh
$ npm install --save react-native-unity-ads-module
$ react-native link
```

### Manual

#### Android

##### android/settings.gradle

```
include ':app', ':react-native-unity-ads-module'
project(':react-native-unity-ads-module').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-unity-ads-module/android')
```

##### android/app/build.gradle

```
dependencies {
  compile project(':react-native-unity-ads-module')
  ...
}
```

##### android/app/src/main/java/YOUR/PACKAGE/PATH/MainApplication.java

```java
// Add after other com.facebook imports
import com.rnunityads.RNUnityAdsPackage;

...
@Override
protected List<ReactPackage> getPackages() {
  return Arrays.<ReactPackage>asList(
    new MainReactPackage(),
    // The part that comes from your other native modules goes here.
    new RNUnityAdsModulePackage()
  );
}
...
```

## Usage

Hopefully, a nice API documentation will be available soon, but until then, you can see the [example application RNUnityAdsExample](https://github.com/Coco-77/ReactNativeUnityAdsExample.git).
## License

This library is made available under [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).
