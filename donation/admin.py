from wagtail.contrib.modeladmin.options import (ModelAdmin,
                                                modeladmin_register)

# import model
from .models import Donation


class DonationModelAdmin(ModelAdmin):
    """
        this class is for import Donation class and provide an access from CRM
    """
    model = Donation
    menu_label = "Donation List"
    menu_icon = 'radio-empty'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = (
        'user',
        'donation_name',
        'category',
        'event',
        'needy',
        'created',
        'updated'
    )


modeladmin_register(DonationModelAdmin)  # register DonationModelAdmin to the decorator
