# This is the main page for VisualEditor
class VisualEditorPage
  include PageObject
  include URL
  page_url URL.url("User:#{ENV['MEDIAWIKI_USER']}/#{ENV['BROWSER']}?vehidebetadialog=true&veaction=edit")

  div(:add_a_template_title, class: 'oo-ui-processDialog-location', text: /Add a template/)
  span(:add_template, text: 'Add template')
  span(:apply_changes_button, text: 'Apply changes')
  span(:basic_reference, class: 'oo-ui-iconElement-icon oo-ui-icon-reference')
  span(:bullet_number_selector, class: 'oo-ui-iconElement-icon oo-ui-icon-bullet-list')
  span(:category_link, class: 'oo-ui-iconElement-icon oo-ui-icon-tag')
  text_area(:cite_first_textarea, index: 0)
  text_area(:cite_second_textarea, index: 2)
  text_area(:cite_third_textarea, index: 4)
  text_area(:cite_fourth_textarea, index: 6)
  text_area(:cite_fifth_textarea, index: 8)
  text_area(:cite_sixth_textarea, index: 10)
  text_area(:cite_seventh_textarea, index: 12)
  text_area(:cite_eighth_textarea, index: 14)
  a(:cite_add_more_information_button, css: '.ve-ui-mwParameterPage-more a', index: 7)
  div(:cite_basic_options_area, class: 'oo-ui-layout oo-ui-iconElement oo-ui-labelElement oo-ui-fieldsetLayout')
  span(:cite_basic_reference, css: '.oo-ui-icon-reference')
  a(:cite_book, css: '.oo-ui-tool-name-cite-book > a:nth-child(1)')
  span(:cite_button, css: '.ve-test-toolbar-cite .oo-ui-labelElement-label')
  text_field(:cite_custom_field_name, css: '.oo-ui-searchWidget-query > div:nth-child(1) > input:nth-child(1)')
  div(:cite_group_name_textarea, class: 'oo-ui-widget oo-ui-widget-enabled oo-ui-inputWidget oo-ui-indicatorElement oo-ui-textInputWidget')
  a(:cite_journal, css: '.oo-ui-tool-name-cite-journal > a:nth-child(1)')
  span(:cite_menu, css: '.ve-test-toolbar-cite .oo-ui-indicator-down')
  div(:cite_new_field_label, css: '.oo-ui-optionWidget')
  text_area(:cite_new_website_field, css: 'div.oo-ui-layout:nth-child(10) > div:nth-child(3) > div:nth-child(1) > textarea:nth-child(1)')
  a(:cite_news, css: '.oo-ui-tool-name-cite-news > a:nth-child(1)')
  div(:cite_pull_down, css: '.ve-test-toolbar-cite .oo-ui-clippableElement-clippable')
  div(:cite_select, css: 'div.oo-ui-widget:nth-child(5) > div:nth-child(2)')
  div(:cite_show_more_fields, class: 've-ui-mwMoreParametersResultWidget-label')
  div(:cite_ui, class: 'oo-ui-window-frame')
  div(:cite_visualeditor_user_interface, css: '.ve-ui-surfaceWidget')
  span(:cite_website, css: '.oo-ui-icon-ref-cite-web')
  span(:confirm_switch, text: 'Keep changes')
  span(:confirm_switch_cancel, text: 'Resume editing')
  span(:confirm_switch_cancel_on_switch, text: 'Cancel')
  span(:confirm_switch_discard, text: 'Discard changes')
  span(:option_to_always_show_TOC, css: 'div.oo-ui-fieldLayout-align-top:nth-child(4) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2)')
  div(:content, class: 've-ce-branchNode')
  span(:decrease_indentation, class: 'oo-ui-iconElement-icon oo-ui-icon-outdent-list')
  text_area(:describe_change, index: 0)
  div(:diff_view, class: 've-ui-mwSaveDialog-viewer')
  div(:disabled_save_button, class: 'oo-ui-widget oo-ui-widget-disabled oo-ui-buttonElement oo-ui-buttonElement-framed oo-ui-labelElement oo-ui-flaggedElement-constructive oo-ui-flaggedElement-primary oo-ui-buttonWidget ve-ui-toolbar-saveButton oo-ui-image-constructive')
  text_field(:display_title_textbox, css: 'div.oo-ui-fieldLayout-align-inline:nth-child(4) > label:nth-child(1) > div:nth-child(1) > div:nth-child(1) > input:nth-child(1)')
  text_field(:redirect_page_name_textbox, css: '.oo-ui-flaggedElement-invalid > input:nth-child(1)')
  span(:toolbar_format, css: '.ve-test-toolbar-format .oo-ui-indicator-down')
  a(:edit_ve, title: /Edit this page with VisualEditor/)
  a(:edit_wikitext, title: /You can edit this page\./)
  span(:ex, text: 'Return to save form')
  a(:first_reference, text: '[1]', index: 1)
  div(:formatting_option_menus, class: 'oo-ui-toolGroup-tools oo-ui-clippableElement-clippable', index: 2)
  img(:formula_image, class: 'mwe-math-fallback-png-inline')
  span(:formula_insert_menu, class: 'oo-ui-tool-name-math')
  a(:formula_link, css: 'span.oo-ui-tool-name-math > a.oo-ui-tool-link')
  span(:heading, class: 'oo-ui-tool-title', text: /Heading/)
  span(:hamburger_menu, class: 'oo-ui-iconElement-icon oo-ui-icon-menu')
  div(:heading_dropdown_menus, class: 'oo-ui-toolGroup-tools oo-ui-clippableElement-clippable', index: 1)
  div(:iframe, css: 'div.oo-ui-window-setup > div.oo-ui-window-frame')
  span(:increase_indentation, class: 'oo-ui-iconElement-icon oo-ui-icon-indent-list')
  div(:indentation_pull_down, class: 'oo-ui-toolGroup-tools oo-ui-clippableElement-clippable', index: 3)
  span(:insert_citation, css: '.ve-ui-nodeDialog > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > a:nth-child(1) > span:nth-child(2)
')
  span(:insert_menu, css: '.ve-test-toolbar-insert .oo-ui-indicator-down')
  a(:insert_more_fewer, css: '.ve-test-toolbar-insert .oo-ui-tool-name-more-fewer .oo-ui-tool-link')
  div(:insert_pull_down, class: 've-test-toolbar-insert')
  div(:insert_references, class: 'oo-ui-processDialog-location')
  span(:insert, text: 'Insert')
  a(:internal_link, class: 've-ce-linkAnnotation ve-ce-mwInternalLinkAnnotation')
  div(:ip_warning, class: 've-ui-mwNoticesPopupTool-item', text: /Your IP address/)
  div(:language_notification, class: 'tipsy-inner')
  div(:left_navigation, id: 'left-navigation')
  unordered_list(:link_list, class: 'oo-ui-widget oo-ui-widget-enabled oo-ui-selectWidget oo-ui-selectWidget-depressed oo-ui-clippableElement-clippable oo-ui-menuWidget oo-ui-textInputMenuWidget oo-ui-lookupWidget-menu ve-ui-mwLinkTargetInputWidget-menu')
  div(:link_overlay_does_not_exist, text: /New page/)
  div(:link_overlay_external_link, text: /External link.+New page/m)
  div(:link_overlay_wiki_page, text: /Matching page/)
  text_field(:link_textfield, index: 0)
  span(:links_done, text: 'Done')
  unordered_list(:media_caption, class: 've-ui-contextSelectWidget')
  span(:media_exit, text: 'Return to save form')
  figure(:media_image, index: 0)
  span(:media_insert_menu, class: 'oo-ui-tool-name-media')
  text_field(:media_search, css: 'div.oo-ui-textInputWidget > input')
  div(:media_select, class: 've-ui-mwMediaResultWidget-overlay')
  div(:medium_dialog, class: 'oo-ui-window oo-ui-dialog oo-ui-dialog-open oo-ui-dialog-medium')
  checkbox(:minor_edit, id: 'wpMinoredit')
  div(:no_unused_fields, text: 'No unused fields')
  a(:new_link, class: 've-ce-linkAnnotation ve-ce-mwInternalLinkAnnotation new')
  span(:options_categories, class: 'oo-ui-tool-title', text: 'Categories')
  span(:options_in_hamburger, class: 'oo-ui-tool-title', text: 'Options')
  span(:option_advanced_settings, class: 'oo-ui-tool-title', text: 'Advanced settings')
  span(:option_page_settings, class: 'oo-ui-tool-title', text: 'Page settings')
  div(:options_page_title, class: 'oo-ui-processDialog-location', text: 'Options')
  div(:options_settings_content_advanced, class: 'oo-ui-layout oo-ui-iconElement oo-ui-labelElement oo-ui-fieldsetLayout', text: /Advanced settings/)
  div(:options_settings_content_categories, class: 'oo-ui-layout oo-ui-iconElement oo-ui-labelElement oo-ui-fieldsetLayout', text: /Categories/)
  div(:options_settings_content_page_settings, class: 'oo-ui-layout oo-ui-iconElement oo-ui-labelElement oo-ui-fieldsetLayout', text: /Page settings/)
  checkbox(:option_to_enable_display_title, index: 4)
  checkbox(:option_to_redirect_the_page, index: 0)
  checkbox(:option_to_prevent_redirect_being_updated, index: 1)
  checkbox(:option_to_disable_edit_links, index: 2)
  checkbox(:option_to_refer_as_disambiguation_page, index: 3)
  span(:option_to_set_index_by_search, class: 'oo-ui-labelElement-label', text: 'Yes', index: 0)
  span(:option_to_show_new_section_tab, class: 'oo-ui-labelElement-label', text: 'Yes', index: 1)
  div(:page_option_menu, class: 'oo-ui-toolGroup-tools oo-ui-clippableElement-clippable', index: 6)
  span(:page_settings, class: 'oo-ui-iconElement-icon oo-ui-icon-settings')
  label(:page_settings_editlinks, class: 'oo-ui-layout oo-ui-labelElement oo-ui-fieldLayout oo-ui-fieldLayout-align-inline', index: 4)
  span(:page_settings_icon, class: 'oo-ui-iconElement-icon oo-ui-icon-settings', index: 2)
  div(:page_text, id: 'mw-content-text')
  a(:page_title, text: /Page title/)
  a(:paragraph, text: /Paragraph/)
  div(:parameter_icon, text: 'q')
  unordered_list(:popup_icon, class: 've-ui-contextSelectWidget')
  a(:preformatted, text: /Preformatted/)
  label(:prevent_redirect, class: 'oo-ui-layout oo-ui-labelElement oo-ui-fieldLayout oo-ui-fieldLayout-align-inline oo-ui-fieldLayout-disabled')
  span(:ref_list_insert_menu, class: 'oo-ui-tool-name-referencesList')
  span(:refs_link, text: 'Reference')
  div(:references_title, class: 'oo-ui-processDialog-location', text: /References/)
  a(:remove_parameter, css: '.ve-ui-mwParameterPage-removeButton > a:nth-child(1)')
  span(:return_to_save, class: 'oo-ui-labelElement-label', text: 'Return to save form')
  a(:review_changes, css: '.oo-ui-processDialog-actions-other > div:nth-child(1) > a:nth-child(1)')
  span(:review_failed, text: 'No changes to review')
  div(:right_navigation, id: 'p-views')
  span(:save_page, class: 'oo-ui-labelElement-label', text: 'Save page')
  div(:save_enabled, css: 'div.ve-init-mw-viewPageTarget-toolbar-actions > div.oo-ui-flaggedElement-constructive.oo-ui-widget-enabled')
  a(:second_reference, text: '[1]', index: 2)
  span(:second_save_page, css: '.oo-ui-processDialog-actions-primary > div:nth-child(1) > a:nth-child(1) > span:nth-child(2)')
  div(:settings_apply_button, class: 'oo-ui-widget oo-ui-widget-enabled oo-ui-buttonElement oo-ui-labelElement oo-ui-flaggedElement-primary oo-ui-buttonWidget oo-ui-actionWidget oo-ui-buttonElement-framed')
  span(:special_character, class: 'oo-ui-iconElement-icon oo-ui-icon-special-character')
  a(:subheading1, text: /Sub-heading 1/)
  a(:subheading2, text: /Sub-heading 2/)
  a(:subheading3, text: /Sub-heading 3/)
  a(:subheading4, text: /Sub-heading 4/)
  span(:switch_to_source_editing, class: 'oo-ui-iconElement-icon oo-ui-icon-source')
  label(:table_of_contents, class: 'oo-ui-layout oo-ui-labelElement oo-ui-fieldLayout oo-ui-fieldLayout-align-top', index: 1)
  span(:template_insert_menu, class: 'oo-ui-tool-name-transclusion')
  div(:toolbar, class: 've-init-mw-viewPageTarget-toolbar')
  div(:toolbar_actions, class: 'oo-ui-toolbar-actions')
  if ENV['BROWSER'] == 'chrome'
    div(:tools_menu, class: 'oo-ui-widget oo-ui-widget-enabled oo-ui-toolGroup oo-ui-iconElement oo-ui-popupToolGroup oo-ui-listToolGroup')
  else
    span(:tools_menu, class: 'oo-ui-iconElement-icon oo-ui-icon-menu')
  end
  a(:transclusion, css: 'span.oo-ui-widget.oo-ui-iconElement.oo-ui-tool.oo-ui-tool-name-transclusion.oo-ui-widget-enabled > a')
  text_field(:transclusion_description, css: '.oo-ui-inputWidget > input:nth-child(1)')
  text_field(:transclusion_textfield, css: 'div.oo-ui-widget-enabled:nth-child(4) > input:nth-child(1)')
  span(:ve_bold_text, class: 'oo-ui-iconElement-icon oo-ui-icon-bold-b')
  span(:ve_bullets, class: 'oo-ui-iconElement-icon oo-ui-icon-bullet-list', index: 1)
  span(:ve_computer_code, class: 'oo-ui-iconElement-icon oo-ui-icon-code')
  div(:ve_heading_menu, class: 'oo-ui-iconElement-icon oo-ui-icon-down')
  span(:ve_italics, class: 'oo-ui-iconElement-icon oo-ui-icon-italic-i')
  span(:ve_link_icon, class: 'oo-ui-iconElement-icon oo-ui-icon-link')
  span(:ve_link_ui, class: 'oo-ui-widget oo-ui-widget-enabled oo-ui-labelElement-label oo-ui-labelWidget oo-ui-processDialog-title oo-ui-labelElement', text: 'Link')
  span(:ve_media_menu, class: 'oo-ui-iconElement-icon oo-ui-icon-picture')
  span(:ve_more_markup_options, css: 'span.oo-ui-tool-name-more-fewer:nth-child(10) > a:nth-child(1) > span:nth-child(2)')
  a(:ve_more_references_options, css: 'span.oo-ui-tool-name-more-fewer:nth-child(9) > a:nth-child(1)')
  span(:ve_numbering, class: 'oo-ui-iconElement-icon oo-ui-icon-number-list')
  span(:ve_references, class: 'oo-ui-iconElement-icon oo-ui-icon-references')
  span(:ve_strikethrough, class: 'oo-ui-iconElement-icon oo-ui-icon-strikethrough-s')
  span(:ve_subscript, class: 'oo-ui-iconElement-icon oo-ui-icon-subscript')
  span(:ve_superscript, class: 'oo-ui-iconElement-icon oo-ui-icon-superscript')
  span(:ve_text_style, class: 'oo-ui-iconElement-icon oo-ui-icon-text-style')
  span(:ve_underline, class: 'oo-ui-iconElement-icon oo-ui-icon-underline-u')
  div(:visual_editor_toolbar, class: 'oo-ui-toolbar-tools')
  text_area(:wikitext_editor, id: 'wpTextbox1')

  in_iframe(index: 0) do |frame|
    div(:extension_reference, class: 've-ui-mwReferenceResultWidget-shield', frame: frame)
    span(:existing_reference, text: 'Use an existing reference', frame: frame)
    a(:remove_template, title: 'Remove template', frame: frame)
    div(:suggestion_list, class: 've-ui-mwTitleInputWidget-menu')
    span(:another_save_page, class: 'oo-ui-labelElement-label', text: 'Save page', frame: frame)
    div(:content_box, class: 've-ce-documentNode ve-ce-branchNode', frame: frame) # ALSO USED IN LANGUAGE SCREENSHOT

    # USED IN LANGUAGE SCREENSHOT TEST:
    text_field(:media_alternative_text, css: 'div.oo-ui-widget.oo-ui-widget-enabled.oo-ui-inputWidget.oo-ui-textInputWidget.ve-ui-mwMediaDialog-altText > input', frame: frame)
    div(:media_alternative_block, class: 'oo-ui-layout oo-ui-iconElement oo-ui-labelElement oo-ui-fieldsetLayout', index: 1, frame: frame)
    list_item(:media_advanced_settings, class: 'oo-ui-widget oo-ui-widget-enabled oo-ui-optionWidget oo-ui-decoratedOptionWidget oo-ui-outlineItemWidget oo-ui-outlineItemWidget-level-0 oo-ui-iconElement oo-ui-labelElement', frame: frame)
    a(:insert_media, css: 'div.oo-ui-processDialog-actions-primary > div.oo-ui-buttonElement-frameless > a', frame: frame)
    text_area(:formula_area, class: 'oo-ui-ltr', frame: frame)
  end
end
