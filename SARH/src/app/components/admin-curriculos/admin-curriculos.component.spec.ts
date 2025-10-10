import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminCurriculosComponent } from './admin-curriculos.component';

describe('AdminCurriculosComponent', () => {
  let component: AdminCurriculosComponent;
  let fixture: ComponentFixture<AdminCurriculosComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AdminCurriculosComponent]
    });
    fixture = TestBed.createComponent(AdminCurriculosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
