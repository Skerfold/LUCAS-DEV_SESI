import { ComponentFixture, TestBed } from '@angular/core/testing';
import { AdminVagasComponent } from './admin-vagas.component'; // Corrigido o nome do componente

describe('AdminVagasComponent', () => { // Corrigido o nome do describe
  let component: AdminVagasComponent; // Corrigido o tipo do componente
  let fixture: ComponentFixture<AdminVagasComponent>; // Corrigido o tipo do fixture

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AdminVagasComponent] // Corrigido o nome do componente
    });
    fixture = TestBed.createComponent(AdminVagasComponent); // Corrigido o nome do componente
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});