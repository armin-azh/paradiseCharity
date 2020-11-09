from django.db import models

from wagtail.admin.edit_handlers import (FieldPanel,
                                         MultiFieldPanel)
from wagtail.images.edit_handlers import ImageChooserPanel


class UserPersonManager(models.Manager):
    """
        managing tool for UserPerson objects
    """
    pass


class UserPerson(models.Model):
    """
        this class implement the User table on database for CRUD operation
    """
    first_name = models.CharField(max_length=50, null=False)
    last_name = models.CharField(max_length=50, null=False)
    national_code = models.CharField(max_length=11, null=False, unique=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255, unique=True, null=True)  # hash value will be store
    city = models.CharField(max_length=50, null=True)
    country = models.CharField(max_length=50, null=True)
    street = models.CharField(max_length=50, null=True)
    state = models.CharField(max_length=50, null=True)
    postal_code = models.CharField(max_length=13, null=True)
    created = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now=True, null=True)

    objects = UserPersonManager()

    panels = [
        FieldPanel('first_name'),
        FieldPanel('last_name'),
        FieldPanel('national_code'),
        FieldPanel('email'),
        MultiFieldPanel([
            FieldPanel('city'),
            FieldPanel('country'),
            FieldPanel('street'),
            FieldPanel('state'),
            FieldPanel('postal_code'),
        ],
            heading="User Address")
    ]

    class Meta:
        db_table = 'userperson'  # table name on database

    def __str__(self):
        """
        represent object
        """
        return self.first_name + " " + self.last_name


class NeedyManger(models.Manager):
    """
        managing tool for Needy objects
    """
    pass


class Needy(models.Model):
    """
        this class implement the Needy table on database
    """
    SUSPEND = "suspend"
    ACTIVATED = "active"
    DEACTIVATED = "deactivate"

    StatusChoice = (
        ("Suspend", SUSPEND),
        ("Activated", ACTIVATED),
        ("Deactivated", DEACTIVATED)
    )

    first_name = models.CharField(max_length=50, null=False)
    last_name = models.CharField(max_length=50, null=False)
    age = models.CharField(max_length=3, null=False)
    national_code = models.CharField(max_length=11, null=False, unique=True)
    password = models.CharField(max_length=255, unique=True)  # hash value will be store
    created = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=50, choices=StatusChoice, null=False)
    city = models.CharField(max_length=50, null=True)
    country = models.CharField(max_length=50, null=True)
    street = models.CharField(max_length=50, null=True)
    state = models.CharField(max_length=50, null=True)
    postal_code = models.CharField(max_length=13, null=True)
    updated = models.DateTimeField(auto_now=True)

    objects = NeedyManger()

    panels = [
        FieldPanel('first_name'),
        FieldPanel('last_name'),
        FieldPanel('age'),
        FieldPanel('national_code'),
        FieldPanel('status'),
        MultiFieldPanel([
            FieldPanel('city'),
            FieldPanel('country'),
            FieldPanel('street'),
            FieldPanel('state'),
            FieldPanel('postal_code'),
        ],
            heading="User Address")
    ]

    class Meta:
        db_table = "needy"  # table name on database

    def __str__(self):
        """
            represent object
        """
        return self.national_code


class NeedyDetailManager(models.Manager):
    """
        managing tool for Needy objects
    """
    pass


class NeedyDetail(models.Model):
    """
        this class implement the Needy table on database
    """
    needy = models.ForeignKey(Needy, on_delete=models.CASCADE)
    name = models.CharField(max_length=50, null=False)  # detail name
    intro = models.CharField(max_length=100, null=True)
    image = models.ForeignKey('wagtailimages.Image',
                              on_delete=models.SET_NULL,
                              blank=True, null=True,
                              related_name='+')  # image field

    panels = [
        FieldPanel('needy'),
        FieldPanel('name'),
        FieldPanel('intro'),
        ImageChooserPanel('image')
    ]

    objects = NeedyDetailManager()

    class Meta:
        db_table = 'needydetail'    # table name on database
        unique_together = (('id', 'name'),)

    def __str__(self):
        """
            represent object
        """
        return self.name
