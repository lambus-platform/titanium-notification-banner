# Titanium Notification Banner

A notification banner for Titanium that uses full native API's to modally present messages.
Since the iOS module 5.0.0, this library uses the Swift-based [`AlertKit`](https://github.com/sparrowcode/AlertKit) library.

## Requirements

- [x] Titanium 12.7.0+

### Android

Add the following to the app build.gradle file of your **app project**:
```
repositories {
    maven { url "https://jitpack.io" }
}
```

## Example

```js
import NotificationBanner from 'ti.notificationbanner';

NotificationBanner.show({
  title: 'Titanium rocks!',
  subtitle: 'It seriously does',
  type: 'success', // iOS-only
  duration: 2, // Android-only
  backgroundColor: 'green', // Android-only
});
```

## Methods

- `show(options)`

### Method Properties

- `title` (Required)
- `subtitle` (Optional)

#### Android-only

- `backgroundColor` (Optional)
- `duration` (Optional)
- `elevation` (Optional)
- `onClick`: callback function for banner click (Optional)

#### iOS-only

- `type` (Optional, one of `info`, `warning`, `error` and `success`)
- `image` (Optional, set the icon of the banner)

## License

MIT

## Author

Hans Knöchel, Lambus GmbH
