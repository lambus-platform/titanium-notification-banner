# Titanium Notification Banner

A notification banner for Titanium that uses full native API's to modally present messages.

## Requirements

- [x] Titanium 9.0.0+

## Android

Add
```
repositories {
    maven { url "https://jitpack.io" }
}
```
to the app build.gradle file.

## Example

```js
import NotificationBanner from 'ti.notificationbanner';

NotificationBanner.show({
  title: 'Titanium rocks!',
  duration: 2,
  subtitle: 'It seriously does',
  backgroundColor: 'green',
});
```

## Methods

- `show(options)`

## Properties

- `title` (Required)
- `subtitle` (Optional)
- `backgroundColor` (Optional)
- `duration` (Optional)
- `elevation` (Optional)

## License

MIT

## Author

Hans Knöchel, Lambus GmbH
