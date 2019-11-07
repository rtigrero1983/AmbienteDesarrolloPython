# Generated by Django 2.2.5 on 2019-11-07 12:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('GestionAcademica', '0009_movestudianteasignacioncurso'),
    ]

    operations = [
        migrations.CreateModel(
            name='MovMatriculacionEstudiante',
            fields=[
                ('id_matriculacion_estudiante', models.AutoField(primary_key=True, serialize=False)),
                ('id_anio_lectivo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fk_matriculacionestudiante_aniolectivo', to='GestionAcademica.MantAnioLectivo')),
                ('id_curso', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fk_matriculacionestudiante_cabcurso', to='GestionAcademica.MovCabCurso')),
                ('id_estudiante', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fk_matriculacionestudiante_estudiante', to='GestionAcademica.MantEstudiante')),
            ],
            options={
                'verbose_name': 'Matriculacion estudiante',
                'verbose_name_plural': 'Matriculacion estudiante',
                'db_table': 'mov_matriculacion_estudiante',
            },
        ),
    ]
