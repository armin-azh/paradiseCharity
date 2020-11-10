from wagtail.core import hooks


@hooks.register('construct_main_menu')
def hide_image_menu_items(request, menu_items):
    menu_items[:] = [item for item in menu_items if item.name not in ['images', 'page', 'reports', 'documents']]


@hooks.register('construct_settings_menu')
def hide_settings_menu_items(request, menu_items):
    menu_items[:] = [item for item in menu_items if item.name not in ['workflows',
                                                                      'sites',
                                                                      'redirects',
                                                                      'collections',
                                                                      'workflow-tasks']]
