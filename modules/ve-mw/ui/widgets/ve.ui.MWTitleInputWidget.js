/*!
 * VisualEditor UserInterface MWTitleInputWidget class.
 *
 * @copyright 2011-2014 VisualEditor Team and others; see AUTHORS.txt
 * @license The MIT License (MIT); see LICENSE.txt
 */

/**
 * Creates an ve.ui.MWTitleInputWidget object.
 *
 * @class
 * @extends OO.ui.TextInputWidget
 * @mixins OO.ui.LookupInputWidget
 *
 * @constructor
 * @param {Object} [config] Configuration options
 * @cfg {number} [namespace] Namespace to prepend to queries
 */
ve.ui.MWTitleInputWidget = function VeUiMWTitleInputWidget( config ) {
	// Config intialization
	config = config || {};

	// Parent constructor
	OO.ui.TextInputWidget.call( this, config );

	// Mixin constructors
	OO.ui.LookupInputWidget.call( this, this, config );

	// Properties
	this.namespace = config.namespace || null;

	// Events
	this.lookupMenu.connect( this, { choose: 'onLookupMenuItemChoose' } );

	// Initialization
	this.$element.addClass( 've-ui-mwTitleInputWidget' );
	this.lookupMenu.$element.addClass( 've-ui-mwTitleInputWidget-menu' );
};

/* Inheritance */

OO.inheritClass( ve.ui.MWTitleInputWidget, OO.ui.TextInputWidget );

OO.mixinClass( ve.ui.MWTitleInputWidget, OO.ui.LookupInputWidget );

/* Methods */

/**
 * Handle menu item select event.
 *
 * @method
 * @param {OO.ui.MenuItemWidget} item Selected item
 */
ve.ui.MWTitleInputWidget.prototype.onLookupMenuItemChoose = function ( item ) {
	if ( item ) {
		this.setValue( item.getData() );
	}
};

/**
 * Gets a new request object of the current lookup query value.
 *
 * @method
 * @returns {jQuery.Deferred} Deferred object with success and fail handlers already attached
 */
ve.ui.MWTitleInputWidget.prototype.getLookupRequest = function () {
	var value = this.value;

	// Prefix with default namespace name
	if ( this.namespace !== null && mw.Title.newFromText( value, this.namespace ) ) {
		value = mw.Title.newFromText( value, this.namespace ).getPrefixedText();
	}

	// Dont send leading ':' to open search
	if ( value.charAt( 0 ) === ':' ) {
		value = value.substr( 1 );
	}

	return ve.init.target.constructor.static.apiRequest( {
		action: 'opensearch',
		search: value,
		suggest: ''
	} );
};

/**
 * Get lookup cache item from server response data.
 *
 * @method
 * @param {Mixed} data Response from server
 */
ve.ui.MWTitleInputWidget.prototype.getLookupCacheItemFromData = function ( data ) {
	return data[1] || [];
};

/**
 * Get list of menu items from a server response.
 *
 * @param {Object} data Query result
 * @returns {OO.ui.MenuItemWidget[]} Menu items
 */
ve.ui.MWTitleInputWidget.prototype.getLookupMenuItemsFromData = function ( data ) {
	var i, len, title, value,
		menu$ = this.lookupMenu.$,
		items = [],
		matchingPages = data,
		linkCacheUpdate = {};

	// Matching pages
	if ( matchingPages && matchingPages.length ) {
		for ( i = 0, len = matchingPages.length; i < len; i++ ) {
			title = new mw.Title( matchingPages[i] );
			linkCacheUpdate[matchingPages[i]] = { missing: false };
			if ( this.namespace !== null ) {
				value = title.getRelativeText( this.namespace );
			} else {
				value = title.getPrefixedText();
			}
			items.push( new OO.ui.MenuItemWidget(
				value, { $: menu$, label: value }
			) );
		}
		ve.init.platform.linkCache.set( linkCacheUpdate );
	}

	return items;
};
