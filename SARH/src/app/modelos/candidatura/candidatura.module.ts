export class Candidatura {
  constructor(
    public id: number, // Alterado para number
    public curriculoId: number, // Alterado para number
    public vagaId: number, // Alterado para number
    public dataCandidatura: string // Data em que a candidatura foi feita
  ) {}

  public toMap(): { [key: string]: any } {
    return {
      id: this.id,
      curriculoId: this.curriculoId,
      vagaId: this.vagaId,
      dataCandidatura: this.dataCandidatura
    };
  }

  static fromMap(map: any): Candidatura {
    return new Candidatura(
      map.id,
      map.curriculoId,
      map.vagaId,
      map.dataCandidatura
    );
  }
}
