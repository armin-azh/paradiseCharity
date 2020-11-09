from django.db import models

from wagtail.admin.edit_handlers import FieldPanel


class PaymentManager(models.Manager):
    """
        managing tool for UserPerson objects
    """
    pass


class Payment(models.Model):
    """
    this class implement the Payment table on database for CRUD operation
    """
    donation = models.ForeignKey('donation.Donation', on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.CharField(max_length=255, null=True)
    status = models.CharField(max_length=255, null=True)
    hash_card_number = models.CharField(max_length=255, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    panels = [
        FieldPanel('donation'),
        FieldPanel('amount'),
        FieldPanel('description'),
        FieldPanel('status'),
        FieldPanel('hash_card_number'),
    ]

    objects = PaymentManager()

    class Meta:
        db_table = 'payments'

    def __str__(self):
        """
            to represent Payment objects
        """
        return str(self.id)
