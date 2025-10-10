export class Curriculo {
  constructor(
    public id: number, // Alterado para number
    public nomeCompleto: string,
    public email: string,
    public telefone: string,
    public experiencia: string,
    public formacao: string,
    public habilidades: string,
    public usuarioId: number // Adicionado para vincular o currículo a um usuário
  ) {}

  public toMap(): { [key: string]: any } {
    return {
      id: this.id,
      nomeCompleto: this.nomeCompleto,
      email: this.email,
      telefone: this.telefone,
      experiencia: this.experiencia,
      formacao: this.formacao,
      habilidades: this.habilidades,
      usuarioId: this.usuarioId // Incluído no toMap
    };
  }

  static fromMap(map: any): Curriculo {
    return new Curriculo(
      map.id,
      map.nomeCompleto,
      map.email,
      map.telefone,
      map.experiencia,
      map.formacao,
      map.habilidades,
      map.usuarioId // Incluído no fromMap
    );
  }
}
