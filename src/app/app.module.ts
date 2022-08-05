import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { AdministradorComponent } from './components/administrador/administrador.component';
import { AlumnosComponent } from './components/alumnos/alumnos.component';
import { InstructorComponent } from './components/instructor/instructor.component';
import { Instructor1Component } from './components/instructor1/instructor1.component';
import { Instructor2Component } from './components/instructor2/instructor2.component';
import { Instructor3Component } from './components/instructor3/instructor3.component';
import { HomeComponent } from './components/home/home.component';
import { NavegacionComponent } from './components/navegacion/navegacion.component';
import { PiePaginaComponent } from './components/pie-pagina/pie-pagina.component';
import { RegistroComponent } from './components/registro/registro.component';
import { LateralComponent } from './components/lateral/lateral.component';
import { InscripcionComponent } from './components/inscripcion/inscripcion.component';
import { InscripcionSComponent } from './components/inscripcion-s/inscripcion-s.component';
import { MiscursosComponent } from './components/miscursos/miscursos.component';
import { RevisarActividadesComponent } from './components/revisar-actividades/revisar-actividades.component';
import { VerCursoComponent } from './components/ver-curso/ver-curso.component';
import { VerTemasComponent } from './components/ver-temas/ver-temas.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    AdministradorComponent,
    AlumnosComponent,
    InstructorComponent,
    Instructor1Component,
    Instructor2Component,
    Instructor3Component,
    HomeComponent,
    NavegacionComponent,
    PiePaginaComponent,
    RegistroComponent,
    LateralComponent,
    InscripcionComponent,
    InscripcionSComponent,
    MiscursosComponent,
    RevisarActividadesComponent,
    VerCursoComponent,
    VerTemasComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

