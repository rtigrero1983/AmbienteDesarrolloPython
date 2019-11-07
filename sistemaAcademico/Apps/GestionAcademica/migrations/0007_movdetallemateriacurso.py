# Generated by Django 2.2.5 on 2019-11-07 12:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('GestionAcademica', '0006_movdetalleempleado'),
    ]

    operations = [
        migrations.CreateModel(
            name='MovDetalleMateriaCurso',
            fields=[
                ('id_detalle_curso', models.AutoField(primary_key=True, serialize=False)),
                ('anio', models.IntegerField()),
                ('estado', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fk_detallemateriacurso_estado', to='GestionAcademica.GenrGeneral')),
                ('id_curso', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fk_detallemateriacurso_cabcurso', to='GestionAcademica.MovCabCurso')),
                ('id_genr_materias', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fk_detallemateriacurso_materias', to='GestionAcademica.GenrGeneral')),
            ],
            options={
                'verbose_name': 'Detalle Materia Curso',
                'verbose_name_plural': 'Detalle Materia Curso',
                'db_table': 'mov_detalle_materia_curso',
            },
        ),
    ]
