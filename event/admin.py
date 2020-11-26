from wagtail.contrib.modeladmin.options import (ModelAdmin,
                                                ModelAdminGroup,
                                                modeladmin_register)

# import models
from .models import Category
from .models import Event
from .models import EventNeedy
from .models import EventDetail


class CategoryModelAdmin(ModelAdmin):
    """
        this class is for import Category class and provide an access from CRM
    """
    model = Category
    menu_label = 'Category'
    menu_icon = 'arrow-right'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('cat_name', 'cat_description')


class EventModelAdmin(ModelAdmin):
    """
        this class is for import Event class and provide an access from CRM
    """
    model = Event
    menu_label = 'Event'
    menu_icon = 'arrow-right'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('event_name',
                    'category',
                    'created',)


class EventDetailModelAdmin(ModelAdmin):
    """
        this class is for import EventDetail class and provide an access from CRM
    """
    model = EventDetail
    menu_label = 'Event Detail'
    menu_icon = 'arrow-right'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('event',
                    'name')


class EventNeedyModelAdmin(ModelAdmin):
    """
        this class is for import EventNeedy class and provide an access from CRM
    """
    model = EventNeedy
    menu_label = 'Event Needy'
    menu_icon = 'arrow-right'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('event',
                    'needy')


class EventModelAdminGroup(ModelAdminGroup):
    """
        this class is for put together all event relative classes in one class
    """
    menu_label = 'Event'
    menu_icon = 'group'
    items = (
        CategoryModelAdmin,
        EventModelAdmin,
        EventDetailModelAdmin,
        EventNeedyModelAdmin
    )


modeladmin_register(EventModelAdminGroup)   # register EventModelAdminGroup to the CRM
