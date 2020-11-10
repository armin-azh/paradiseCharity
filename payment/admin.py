from wagtail.contrib.modeladmin.options import (ModelAdmin,
                                                modeladmin_register)

# import model
from .models import Payment


class PaymentModelAdmin(ModelAdmin):
    """
        this class is for import Payment class and provide an access from CRM
    """
    model = Payment
    menu_label = 'Payment'
    menu_icon = 'radio-empty'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('donation',
                    'amount',
                    'status',
                    'created',
                    'updated')


modeladmin_register(PaymentModelAdmin)  # register PaymentModelAdmin to CRM
