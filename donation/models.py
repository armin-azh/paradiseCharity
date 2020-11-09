from django.db import models

from wagtail.admin.edit_handlers import FieldPanel


class DonationManager(models.Manager):
    """
        managing tool for Donation objects
    """
    pass


class Donation(models.Model):
    """
        this class implement the Donation table on database for CRUD operation
    """
    user = models.ForeignKey('person.UserPerson', on_delete=models.CASCADE)
    donation_name = models.CharField(max_length=50, null=True)
    description = models.CharField(max_length=150, null=True)
    category = models.ForeignKey('event.Category', on_delete=models.SET_NULL, null=True)
    event = models.ForeignKey('event.Event', on_delete=models.SET_NULL, null=True)
    needy = models.ForeignKey('person.Needy', on_delete=models.SET_NULL, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    panels = [
        FieldPanel('user'),
        FieldPanel('donation_name'),
        FieldPanel('description'),
        FieldPanel('category'),
        FieldPanel('event'),
        FieldPanel('needy')
    ]

    objects = DonationManager()

    class Meta:
        db_table = "donation"

    def __str__(self):
        """
            to represent Donation objects
        """

        return str(self.id)
