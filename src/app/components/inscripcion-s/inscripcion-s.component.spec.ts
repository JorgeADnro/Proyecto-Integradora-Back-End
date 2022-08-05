import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InscripcionSComponent } from './inscripcion-s.component';

describe('InscripcionSComponent', () => {
  let component: InscripcionSComponent;
  let fixture: ComponentFixture<InscripcionSComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InscripcionSComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InscripcionSComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
