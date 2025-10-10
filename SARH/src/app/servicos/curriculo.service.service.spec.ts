import { TestBed } from '@angular/core/testing';

import { CurriculoServiceService } from './curriculo.service.service';

describe('CurriculoServiceService', () => {
  let service: CurriculoServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CurriculoServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
