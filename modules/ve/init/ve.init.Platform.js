/*!
 * VisualEditor Initialization Platform class.
 *
 * @copyright 2011-2013 VisualEditor Team and others; see AUTHORS.txt
 * @license The MIT License (MIT); see LICENSE.txt
 */

/**
 * Generic Initialization platform.
 *
 * @abstract
 * @extends ve.EventEmitter
 *
 * @constructor
 */
ve.init.Platform = function VeInitPlatform() {
	// Parent constructor
	ve.EventEmitter.call( this );
};

/* Inheritance */

ve.inheritClass( ve.init.Platform, ve.EventEmitter );

/* Methods */

/**
 * Get a regular expression that matches allowed external link URLs.
 *
 * @method
 * @abstract
 * @returns {RegExp} Regular expression object
 */
ve.init.Platform.prototype.getExternalLinkUrlProtocolsRegExp = function () {
	throw new Error( 've.init.Platform.getExternalLinkUrlProtocolsRegExp must be overridden in subclass' );
};

/**
 * Get a remotely accessible URL to the modules directory.
 *
 * @method
 * @abstract
 * @returns {string} Remote modules URL
 */
ve.init.Platform.prototype.getModulesUrl = function () {
	throw new Error( 've.init.Platform.getModulesUrl must be overridden in subclass' );
};

/**
 * Check whether to use change markers.
 *
 * @method
 * @returns {boolean}
 */
ve.init.Platform.prototype.useChangeMarkers = function () {
	return true;
};

/**
 * Add multiple messages to the localization system.
 *
 * @method
 * @abstract
 * @param {Object} messages Containing plain message values.
 */
ve.init.Platform.prototype.addMessages = function () {
	throw new Error( 've.init.Platform.addMessages must be overridden in subclass' );
};

/**
 * Get a message from the localization system.
 *
 * @method
 * @abstract
 * @param {string} key Message key
 * @param {Mixed...} [args] List of arguments which will be injected at $1, $2, etc. in the messaage
 * @returns {string} Localized message
 */
ve.init.Platform.prototype.getMessage = function () {
	throw new Error( 've.init.Platform.getMessage must be overridden in subclass' );
};

/**
 * Add multiple parsed messages to the localization system.
 *
 * @method
 * @abstract
 * @param {Object} messages Containing parsed html strings
 */
ve.init.Platform.prototype.addParsedMessages = function () {
	throw new Error( 've.init.Platform.addParsedMessages must be overridden in subclass' );
};

/**
 * Get a parsed message as HTML string.
 * Does not support $# replacements.
 *
 * @method
 * @abstract
 * @param {string} key Message key
 * @returns {string} Parsed localized message as HTML string.
 */
ve.init.Platform.prototype.getParsedMessage = function () {
	throw new Error( 've.init.Platform.getParsedMessage must be overridden in subclass' );
};

/**
 * Gets client platform string from browser.
 *
 * @method
 * @abstract
 * @returns {string} Client platform string.
 */
ve.init.Platform.prototype.getSystemPlatform = function () {
	throw new Error( 've.init.Platform.getSystemPlatform must be overridden in subclass' );
};

/**
 * Gets the user language from the browser.
 *
 * @method
 * @abstract
 * @returns {string} User language string.
 */
ve.init.Platform.prototype.getUserLanguage = function () {
	throw new Error( 've.init.Platform.getUserLanugage must be overridden in subclass' );
};
