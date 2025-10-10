//arquivo responsável pela modelagem de dados para vagas
export class Vaga {
  constructor(
    private _id: number, // Alterado para number
    private _nome: string,
    private _foto: string,
    private _descricao: string,
    private _salario: number
  ) {}

  public get id(): number {
    return this._id;
  }
  public set id(id: number) {
    this._id = id;
  }
  public get nome(): string {
    return this._nome;
  }
  public set nome(nome: string) {
    this._nome = nome;
  }
  public get foto(): string {
    return this._foto;
  }
  public set foto(value: string) {
    this._foto = value;
  }
  public get descricao(): string {
    return this._descricao;
  }
  public set descricao(value: string) {
    this._descricao = value;
  }
  public get salario(): number {
    return this._salario;
  }
  public set salario(value: number) {
    this._salario = value;
  }

  public toMap():{[key:string]:any}{
    return{
      id: this._id,
      nome: this._nome,
      foto: this._foto,
      descricao: this._descricao,
      salario: this._salario
    }
  }

  static fromMap(map:any): Vaga{
    return new Vaga(
      map.id,
      map.nome,
      map.foto,
      map.descricao,
      map.salario
    )
  }
}
