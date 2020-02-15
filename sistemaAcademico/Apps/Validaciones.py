from django.core.exceptions import ValidationError
from django.db.models import Q
from django.utils.translation import ugettext_lazy as _
from django.core.exceptions import ValidationError


def validate_codigo(value):
    if value == "":
        raise ValidationError(
        	_('{0} No se puede crear un modulo sin codigo. porfavor ingrese uno'.format(value)))
    return value



def validate_nombre(value):
    if " " in value or value == "":
        raise ValidationError(
        	_('{0} No se puede crear un modulo sin codigo. porfavor ingrese uno'.format(value)))
    return value
    