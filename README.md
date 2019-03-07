# Titanium Notification Banner

A notification banner for Titanium that uses full native API's to modally present messages.

## Requirements

- [x] Titanium 7.0.0+

## Example

```js
import NotificationBanner from 'ti.notificationbanner';

NotificationBanner.show({
  title: 'Titanium rocks!',
  duration: 2,
  
  // iOS only for now
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

## License 

MIT

## Author

Hans Knöchel, Lambus GmbH
