class NotificationBannerError extends Error {}

const NotificationBannerType = {
	SUCCESS: '#41cc78',
	WARNING: '#fca83b',
	DANGER: '#e25146',
	INFO: '#429ad8',
	NONE: 'transparent'
};

const NotificationBannerPosition = {
	TOP: 'top',
	BOTTOM: 'bottom'
};

const NotificationBannerSizing = {
	HEIGHT: 46
};

class NotificationBanner {

	constructor(opts = {}) {
		this.title = opts.title;
		if (!this.title) {
			throw new NotificationBannerError('Missing required \'title\' property!');
		}

		this.view = opts.view;
		if (!this.view) {
			throw new NotificationBannerError('Missing required \'view\' property!');
		}

		this.type = opts.type || NotificationBannerType.INFO;
		this.position = opts.position || NotificationBannerPosition.BOTTOM;

		this.bannerView = Ti.UI.createView({
			backgroundColor: this.type,
			height: NotificationBannerSizing.HEIGHT,
			viewShadowColor: 'rgba(0, 0, 0, 0.3)',
			viewShadowRadius: 7,
			viewShadowOffset: { x: 0, y: -7 }
		});
		this.bannerView.addEventListener('click', () => { this._handleNotificationClick(); });
		this.bannerView.add(Ti.UI.createLabel({
			text: this.title,
			color: '#fff'
		}));

		this.bannerView[this.position] = -(NotificationBannerSizing.HEIGHT);
	}

	show(opts = { dismissAfterDelay: undefined }) {
		this.showing = true;

		const animationOptions = {};
		animationOptions[this.position] = 0;

		this.view.add(this.bannerView);
		this.bannerView.animate(animationOptions, () => {
			if (opts.dismissAfterDelay) {
				setTimeout(() => {
					this.hide();
				}, opts.dismissAfterDelay);
			}
		});
	}

	hide() {
		const animationOptions = {};
		animationOptions[this.position] = -(NotificationBannerSizing.HEIGHT);

		this.bannerView.animate(animationOptions, () => {
			this.showing = false;
			this.view.remove(this.bannerView);
		});
	}

	flash() {
		this.show({ dismissAfterDelay: 1000 });
	}

	_handleNotificationClick() {
		this.hide();
	}
}

export {
	NotificationBanner,
	NotificationBannerType,
	NotificationBannerPosition,
	NotificationBannerError
};
