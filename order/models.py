from django.db import models

from wagtail.admin.edit_handlers import FieldPanel


class OrderManager(models.Manager):
    """
        managing tool for Order objects
    """
    pass


class Order(models.Model):
    """
       this class implement the Order table on database for CRUD operation
    """
    RECEIVE = 'receive'
    SUSPEND = 'suspend'
    CANCELED = 'canceled'
    IN_PROGRESS = 'progress'
    StatusChoice = (
        ('Receive', RECEIVE),
        ('Suspend', SUSPEND),
        ('In Progress', IN_PROGRESS),
        ('Canceled', CANCELED)
    )
    donation = models.ForeignKey('donation.Donation', on_delete=models.CASCADE)
    order_name = models.CharField(max_length=255, null=False)
    order_description = models.CharField(max_length=255, null=True)
    status = models.CharField(max_length=20, choices=StatusChoice)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    panels = [
        FieldPanel('donation'),
        FieldPanel('order_name'),
        FieldPanel('order_description'),
        FieldPanel('status')
    ]

    objects = OrderManager()

    class Meta:
        db_table = 'order'

    def __str__(self):
        """
            to represent Order objects
        """
        return self.order_name
