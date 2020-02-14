from django.core.exceptions import ValidationError
from django.db.models import Q
from django.utils.translation import gettext_lazy as _




from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


def validate_codigo(value):
    if value == 'luis':
        raise ValidationError(
            _('%(value)s no es una cédula válida'),
            code="invalid",
            params={'value': value},)