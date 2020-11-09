from django.db import models

from wagtail.admin.edit_handlers import FieldPanel

from wagtail.images.edit_handlers import ImageChooserPanel


class CategoryManager(models.Manager):
    """
        managing tool for Category objects
    """
    pass


class Category(models.Model):
    """
        this class implement the Category table on database for CRUD operation
    """
    cat_name = models.CharField(max_length=50, unique=True)
    cat_description = models.CharField(max_length=100, null=True)

    panels = [
        FieldPanel('cat_name'),
        FieldPanel('cat_description')
    ]

    objects = CategoryManager()

    class Meta:
        db_table = "category"

    def __str__(self):
        """
            to represent Category objects
        """
        return self.cat_name


class EventManager(models.Manager):
    """
        managing tool for Event objects
    """
    pass


class Event(models.Model):
    """
        this class implement the Event table on database for CRUD operation
    """
    event_name = models.CharField(max_length=50)
    event_description = models.TextField(null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    panels = [
        FieldPanel('event_name'),
        FieldPanel('event_description'),
        FieldPanel('category'),
    ]

    objects = EventManager()

    def __str__(self):
        """
            to represent Event objects
        """
        return self.event_name


class EventDetailManager(models.Manager):
    """
        managing tool for EventDetail objects
    """
    pass


class EventDetail(models.Model):
    """
        this class implement the EventDetail table on database for CRUD operation
    """
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    name = models.CharField(max_length=50, null=False)  # detail name
    intro = models.CharField(max_length=100, null=True)
    image = models.ForeignKey('wagtailimages.Image',
                              on_delete=models.SET_NULL,
                              blank=True, null=True,
                              related_name='+')  # image field

    panels = [
        FieldPanel('name'),
        FieldPanel('intro'),
        ImageChooserPanel('image')
    ]

    objects = EventDetailManager()

    class Meta:
        db_table = 'eventdetail'

    def __str__(self):
        """
            to represent EventDetail objects
        """
        return self.name


class EventNeedyManager(models.Manager):
    """
        managing tool for EventNeedy class
    """
    pass


class EventNeedy(models.Model):
    """
        this model is for keep attach Needy objects to Event objects
    """

    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    needy = models.ForeignKey('person.Needy', on_delete=models.CASCADE)

    panels = [
        FieldPanel('event'),
        FieldPanel('needy')
    ]

    objects = EventNeedyManager()

    def __str__(self):
        """
            to represent EventNeedy objects
        """
        return "Event = {}    ,Needy = {}".format(self.event.event_name, self.needy.national_code)
