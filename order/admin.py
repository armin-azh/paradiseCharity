from wagtail.contrib.modeladmin.options import (ModelAdmin,
                                                modeladmin_register)

# import model
from .models import Order


class OrderModelAdmin(ModelAdmin):
    """
        this class is for import Order class and provide an access from CRM
    """
    model = Order
    menu_label = 'Order'
    menu_icon = 'radio-empty'
    add_to_settings_menu = False
    exclude_from_explorer = False
    list_display = ('donation', 'order_name', 'status', 'created')


modeladmin_register(OrderModelAdmin)  # register OrderModelAdmin to CRM
