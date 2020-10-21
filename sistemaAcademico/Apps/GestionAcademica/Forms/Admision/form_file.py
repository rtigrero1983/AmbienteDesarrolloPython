from django import forms

class UploadFileForm(forms.Form):
    curso= forms.CharField(required=True,max_length=25,min_length=5)
    file = forms.FileField(required=True)