from wagtail.contrib.modeladmin.options import (ModelAdmin,
                                                ModelAdminGroup,
                                                modeladmin_register)

# import models
from .models import UserPerson
from .models import Needy
from .models import NeedyDetail


class UserPersonModelAdmin(ModelAdmin):
    """
        this class is for import UserPerson class and provide an access from CRM
    """
    model = UserPerson
    menu_label = 'User'
    menu_icon = 'radio-empty'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('id',
                    'national_code',
                    'first_name',
                    'last_name',
                    'email')


class NeedyModelAdmin(ModelAdmin):
    """
        this class is for import Needy class and provide an access from CRM
    """
    model = Needy
    menu_label = 'Needy'
    menu_icon = 'radio-empty'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('id',
                    'national_code',
                    'first_name',
                    'last_name',
                    'age')


class NeedyDetailModelAdmin(ModelAdmin):
    """
        this class is for import NeedyDetail class and provide an access from CRM
    """
    model = NeedyDetail
    menu_label = 'Needy Detail'
    menu_icon = 'radio-empty'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('needy',
                    'name',
                    )


class PersonModelAdminGroup(ModelAdminGroup):
    """
        this class is for put together all relative person model in one class
    """
    menu_label = 'Person'
    menu_icon = 'group'
    items = (
        UserPersonModelAdmin,
        NeedyModelAdmin,
        NeedyDetailModelAdmin

    )


modeladmin_register(PersonModelAdminGroup)  # add PersonModelAdmin to admin CRM
