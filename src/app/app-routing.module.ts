
import { VerTemasComponent } from './components/ver-temas/ver-temas.component';
import { VerCursoComponent } from './components/ver-curso/ver-curso.component';
import { MiscursosComponent } from './components/miscursos/miscursos.component';
import { InscripcionSComponent } from './components/inscripcion-s/inscripcion-s.component';
import { InscripcionComponent } from './components/inscripcion/inscripcion.component';
import { RegistroComponent } from './components/registro/registro.component';
import { HomeComponent } from './components/home/home.component';
import { Instructor3Component } from './components/instructor3/instructor3.component';
import { Instructor2Component } from './components/instructor2/instructor2.component';
import { Instructor1Component } from './components/instructor1/instructor1.component';
import { InstructorComponent } from './components/instructor/instructor.component';
import { AdministradorComponent } from './components/administrador/administrador.component';
import { AlumnosComponent } from './components/alumnos/alumnos.component';
import { NgModule, Component } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { RevisarActividadesComponent } from './components/revisar-actividades/revisar-actividades.component';

const routes: Routes = [
  {path:'login', component:LoginComponent},
  {path:'alumnos',component:AlumnosComponent},
  {path:'administrador',component:AdministradorComponent},
  {path:'instuctor',component:InstructorComponent},
  {path:'instructor1',component:Instructor1Component},
  {path:'instructor2',component:Instructor2Component},
  {path:'instructor3',component:Instructor3Component},
  {path:'home',component: HomeComponent},
  {path:'',component:HomeComponent},
  {path:'login',component:LoginComponent},
  {path:'registro',component:RegistroComponent},
  {path:'inscripcion',component:InscripcionComponent},
  {path:'inscripcion-s',component:InscripcionSComponent},
  {path:'miscursos',component:MiscursosComponent},
  {path:'ver-curso',component:VerCursoComponent},
  {path:'ver-temas',component:VerTemasComponent},
  {path:'revisar-actividades',component:RevisarActividadesComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
