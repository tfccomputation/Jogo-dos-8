  int N=3;
  int flag=0;
  Estado EI = new Estado();                 
  Estado EF = new Estado();
  int num=1;
  
  for(int i=0; i<N; i++){
        for(int j=0; j<N; j++){
          EF.getM()[i][j] =num++;
        }
  }
  
  int h(x0, y0, x1, y1){ //Heuristica
    return (pow(sqrt((x0-x1)),2) + pow(sqrt((y0-y1)),2));
  }
  //Move a peça para esquerda, direita, cima, baixo
  Estado move(int x, int y, Estado e){
    int[][]M = e.getM(); 
    if(M[x+1][y]==0 && (x+1)<N){
      int aux = M[x][y];
      M[x][y]=0;
      M[x+1][y]=aux;
      flag=1;
    }
    else if(M[x-1][y]==0 && (x-1)>0){
      int aux = M[x][y];
      M[x][y]=0;
      M[x-1][y]=aux;
      flag=1;
    }
    else if(M[x][y+1]==0 && (y+1)<N){
      int aux = M[x][y];
      M[x][y]=0;
      M[x][y+1]=aux;
      flag=1;
    }
    else if(M[x][y-1]==0 && (y-1)>0){
      int aux = M[x][y];
      M[x][y]=0;
      M[x][y-1]=aux;
      flag=1;
    }
    e.setM(M);
    e.setCusto(getPai().getCusto()+1);
    return e;
 }

  ArrayList<Estado> expande(Estado e){
  ArrayList<Estado> filhos = new ArrayList<Estado>();
  String est = "";
  Estado temp = new Estado();
   for(int i=0; i<N; i++){
        for(int j=0; j<N; j++){
        temp =move(i, j,temp);
        if(flag==1){
          filhos.add(temp);
        }
         flag=0;
        }
   }
   return filhos;
  }
 
}