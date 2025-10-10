// FileName: MultipleFiles/usuario.module.ts
export class Usuario {
  constructor(
    public id: number, // Alterado para number
    public email: string,
    public senha: string,
    public tipo: 'admin' | 'comum',
    public curriculoId?: number | null // ADICIONADO/CONFIRMADO
  ) {}

  // Método para converter o objeto para um mapa (útil para requisições HTTP)
  public toMap(): { [key: string]: any } {
    return {
      id: this.id,
      email: this.email,
      senha: this.senha,
      tipo: this.tipo,
      curriculoId: this.curriculoId // Incluir no toMap
    };
  }

  // Método estático para criar uma instância de Usuario a partir de um mapa
  static fromMap(map: any): Usuario {
    return new Usuario(
      map.id,
      map.email,
      map.senha,
      map.tipo,
      map.curriculoId !== undefined ? map.curriculoId : null // Garante que seja null se não existir
    );
  }

  // Método para verificar se o usuário é administrador
  isAdmin(): boolean {
    return this.tipo === 'admin';
  }

  // Método para verificar se o usuário é comum
  isComum(): boolean {
    return this.tipo === 'comum';
  }

  // Método para obter informações do usuário (sem a senha, para segurança)
  getInfo(): { id: number; email: string; tipo: string, curriculoId?: number | null } {
    return {
      id: this.id,
      email: this.email,
      tipo: this.tipo,
      curriculoId: this.curriculoId
    };
  }
}
