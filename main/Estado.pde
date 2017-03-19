public class Estado {
  int N = 3; //Tamanho
  int M[][] = new int[N][N];
  int custo; 
  int f; //avalicao
  public Estado pai;

  public Estado() {
    int num =0;
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        this.M[j][i] = ++num;
      }
    }
    custo=0;
  }


  public int[][] getM() {
    return M;
  }

  public void setM(int[][] M) {
    this.M = M;
  }

  public int getCusto() {
    return custo;
  }

  public void setCusto(int custo) {
    this.custo = custo;
  }

  public Estado getPai() {
    return pai;
  }

  public void setPai(Estado pai) {
    this.pai = pai;
  }

  public boolean estadoObjetivo(int[][] M) {    
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        if (this.M[i][j]!=(j+1) && this.M[8][8]!=0) {
          return false;
        }
      }
    }
    return true;
  }
}