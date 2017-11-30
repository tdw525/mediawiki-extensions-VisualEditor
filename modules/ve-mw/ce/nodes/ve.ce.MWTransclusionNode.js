/*!
 * VisualEditor ContentEditable MWTransclusionNode class.
 *
 * @copyright 2011-2018 VisualEditor Team and others; see AUTHORS.txt
 * @license The MIT License (MIT); see LICENSE.txt
 */

/**
 * ContentEditable MediaWiki transclusion node.
 *
 * @class
 * @abstract
 * @extends ve.ce.LeafNode
 * @mixins ve.ce.GeneratedContentNode
 * @mixins ve.ce.FocusableNode
 *
 * @constructor
 * @param {ve.dm.MWTransclusionNode} model Model to observe
 * @param {Object} [config] Configuration options
 */
ve.ce.MWTransclusionNode = function VeCeMWTransclusionNode( model, config ) {
	// Parent constructor
	ve.ce.MWTransclusionNode.super.call( this, model, config );

	// Mixin constructors
	ve.ce.GeneratedContentNode.call( this );
	ve.ce.FocusableNode.call( this );
};

/* Inheritance */

OO.inheritClass( ve.ce.MWTransclusionNode, ve.ce.LeafNode );

OO.mixinClass( ve.ce.MWTransclusionNode, ve.ce.GeneratedContentNode );
OO.mixinClass( ve.ce.MWTransclusionNode, ve.ce.FocusableNode );

/* Static Properties */

ve.ce.MWTransclusionNode.static.name = 'mwTransclusion';

ve.ce.MWTransclusionNode.static.renderHtmlAttributes = false;

ve.ce.MWTransclusionNode.static.primaryCommandName = 'transclusion';

ve.ce.MWTransclusionNode.static.iconWhenInvisible = 'puzzle';

/* Static Methods */

/**
 * Get a list of descriptions of template parts in a transclusion node
 *
 * @static
 * @param {ve.dm.MWTransclusionNode} model Node model
 * @return {string[]} List of template part descriptions
 */
ve.ce.MWTransclusionNode.static.getTemplatePartDescriptions = function ( model ) {
	var i, len, part, title,
		parts = model.getPartsList(),
		words = [];

	for ( i = 0, len = parts.length; i < len; i++ ) {
		part = parts[ i ];
		// Ignore parts that are just content
		if ( part.templatePage ) {
			title = mw.Title.newFromText( part.templatePage );
			words.push( title.getRelativeText( mw.config.get( 'wgNamespaceIds' ).template ) );
		} else if ( part.template ) {
			// Not actually a template, but e.g. a parser function
			words.push( part.template );
		}
	}

	return words;
};

/**
 * @inheritdoc
 */
ve.ce.MWTransclusionNode.static.getDescription = function ( model ) {
	return this.getTemplatePartDescriptions( model )
		.join( ve.msg( 'comma-separator' ) );
};

/**
 * Filter rendering to remove auto-generated content and wrappers
 *
 * @static
 * @param {HTMLElement[]} contentNodes Rendered nodes
 * @return {HTMLElement[]} Filtered rendered nodes
 */
ve.ce.MWTransclusionNode.static.filterRendering = function ( contentNodes ) {
	var whitespaceRegex;

	if ( !contentNodes.length ) {
		return;
	}

	whitespaceRegex = new RegExp( '^[' + ve.dm.Converter.static.whitespaceList + ']+$' );

	contentNodes.forEach( ve.stripParsoidFallbackIds );

	// Filter out auto-generated items, e.g. reference lists
	contentNodes = contentNodes.filter( function ( node ) {
		var dataMw = node &&
			node.nodeType === Node.ELEMENT_NODE &&
			node.hasAttribute( 'data-mw' ) &&
			JSON.parse( node.getAttribute( 'data-mw' ) );

		return !dataMw || !dataMw.autoGenerated;
	} );

	function isWhitespaceNode( node ) {
		return node && node.nodeType === Node.TEXT_NODE && !!node.data.match( whitespaceRegex );
	}

	while ( isWhitespaceNode( contentNodes[ 0 ] ) ) {
		contentNodes.shift();
	}
	while ( isWhitespaceNode( contentNodes[ contentNodes.length - 1 ] ) ) {
		contentNodes.pop();
	}
	// HACK: if $content consists of a single paragraph, unwrap it.
	// We have to do this because the parser wraps everything in <p>s, and inline templates
	// will render strangely when wrapped in <p>s.
	if ( contentNodes.length === 1 && contentNodes[ 0 ].nodeName.toLowerCase() === 'p' ) {
		contentNodes = Array.prototype.slice.call( contentNodes[ 0 ].childNodes );
	}
	return contentNodes;
};

/* Methods */

/**
 * @inheritdoc
 */
ve.ce.MWTransclusionNode.prototype.createInvisibleIcon = function () {
	var icon = new OO.ui.ButtonWidget( {
		classes: [ 've-ce-focusableNode-invisibleIcon' ],
		framed: false,
		icon: this.constructor.static.iconWhenInvisible,
		label: this.constructor.static.getDescription( this.getModel() )
	} );
	return icon.$element;
};

/**
 * @inheritdoc
 */
ve.ce.MWTransclusionNode.prototype.generateContents = function ( config ) {
	var xhr, deferred = $.Deferred();
	xhr = new mw.Api().post( {
		action: 'visualeditor',
		paction: 'parsefragment',
		page: ve.init.target.pageName,
		wikitext: ( config && config.wikitext ) || this.model.getWikitext(),
		pst: 1
	} )
		.done( this.onParseSuccess.bind( this, deferred ) )
		.fail( this.onParseError.bind( this, deferred ) );

	return deferred.promise( { abort: xhr.abort } );
};

/**
 * Handle a successful response from the parser for the wikitext fragment.
 *
 * @param {jQuery.Deferred} deferred The Deferred object created by #generateContents
 * @param {Object} response Response data
 */
ve.ce.MWTransclusionNode.prototype.onParseSuccess = function ( deferred, response ) {
	var contentNodes;

	if ( ve.getProp( response, 'visualeditor', 'result' ) !== 'success' ) {
		return this.onParseError( deferred );
	}

	// Work around https://github.com/jquery/jquery/issues/1997
	contentNodes = $.parseHTML( response.visualeditor.content, this.model && this.getModelHtmlDocument() ) || [];
	deferred.resolve( this.constructor.static.filterRendering( contentNodes ) );
};

/**
 * Extend the ve.ce.GeneratedContentNode render method to check for hidden templates.
 *
 * Check if the final result of the imported template is empty.
 *
 * @inheritdoc ve.ce.GeneratedContentNode
 */
ve.ce.MWTransclusionNode.prototype.render = function ( generatedContents ) {
	// Call parent mixin
	ve.ce.GeneratedContentNode.prototype.render.call( this, generatedContents );
};

/**
 * @inheritdoc
 */
ve.ce.MWTransclusionNode.prototype.onSetup = function () {
	// Parent method
	ve.ce.MWTransclusionNode.super.prototype.onSetup.apply( this, arguments );

	// Render replaces this.$element with a new node so re-add classes
	this.$element.addClass( 've-ce-mwTransclusionNode' );
};

/**
 * @inheritdoc
 */
ve.ce.MWTransclusionNode.prototype.getRenderedDomElements = function () {
	// Parent method
	var elements = ve.ce.GeneratedContentNode.prototype.getRenderedDomElements.apply( this, arguments );

	if ( this.model && this.getModelHtmlDocument() ) {
		ve.init.platform.linkCache.styleParsoidElements(
			$( elements ),
			this.getModelHtmlDocument()
		);
	}
	return elements;
};

/**
 * Handle an unsuccessful response from the parser for the wikitext fragment.
 *
 * @param {jQuery.Deferred} deferred The promise object created by #generateContents
 * @param {Object} response Response data
 */
ve.ce.MWTransclusionNode.prototype.onParseError = function ( deferred ) {
	deferred.reject();
};

/* Concrete subclasses */

/**
 * ContentEditable MediaWiki transclusion block node.
 *
 * @class
 * @extends ve.ce.MWTransclusionNode
 * @constructor
 * @param {ve.dm.MWTransclusionBlockNode} model Model to observe
 */
ve.ce.MWTransclusionBlockNode = function VeCeMWTransclusionBlockNode( model ) {
	// Parent constructor
	ve.ce.MWTransclusionBlockNode.super.call( this, model );
};

/* Inheritance */

OO.inheritClass( ve.ce.MWTransclusionBlockNode, ve.ce.MWTransclusionNode );

/* Static Properties */

ve.ce.MWTransclusionBlockNode.static.name = 'mwTransclusionBlock';

ve.ce.MWTransclusionBlockNode.static.tagName = 'div';

/**
 * ContentEditable MediaWiki transclusion inline node.
 *
 * @class
 * @extends ve.ce.MWTransclusionNode
 * @constructor
 * @param {ve.dm.MWTransclusionInlineNode} model Model to observe
 */
ve.ce.MWTransclusionInlineNode = function VeCeMWTransclusionInlineNode( model ) {
	// Parent constructor
	ve.ce.MWTransclusionInlineNode.super.call( this, model );
};

/* Inheritance */

OO.inheritClass( ve.ce.MWTransclusionInlineNode, ve.ce.MWTransclusionNode );

/* Static Properties */

ve.ce.MWTransclusionInlineNode.static.name = 'mwTransclusionInline';

ve.ce.MWTransclusionInlineNode.static.tagName = 'span';

/**
 * ContentEditable MediaWiki transclusion table cell node.
 *
 * @class
 * @extends ve.ce.MWTransclusionNode
 * @constructor
 * @mixins ve.ce.TableCellableNode
 * @param {ve.dm.MWTransclusionTableCellNode} model Model to observe
 */
ve.ce.MWTransclusionTableCellNode = function VeCeMWTransclusionTableCellNode( model ) {
	// Parent constructor
	ve.ce.MWTransclusionTableCellNode.super.call( this, model );

	// Mixin constructors
	ve.ce.TableCellableNode.call( this );
};

/* Inheritance */

OO.inheritClass( ve.ce.MWTransclusionTableCellNode, ve.ce.MWTransclusionNode );

OO.mixinClass( ve.ce.MWTransclusionTableCellNode, ve.ce.TableCellableNode );

/* Static Properties */

ve.ce.MWTransclusionTableCellNode.static.name = 'mwTransclusionTableCell';

/* Registration */

ve.ce.nodeFactory.register( ve.ce.MWTransclusionNode );
ve.ce.nodeFactory.register( ve.ce.MWTransclusionBlockNode );
ve.ce.nodeFactory.register( ve.ce.MWTransclusionInlineNode );
ve.ce.nodeFactory.register( ve.ce.MWTransclusionTableCellNode );
