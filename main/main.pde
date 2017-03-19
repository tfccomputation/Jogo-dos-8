int N = 3;
int flag=0;
Estado EI = new Estado();                 
Estado EF = new Estado();
int num=1;


Peca mp[][]= new Peca[3][3];

void criar() {
  int k = 1;
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      Peca p = new Peca(k++, j*width/N, i*height/N, width/N, height/N);
      mp[i][j]=p;
      //if(k==9) j=N;
    }
  }
}

void update() {
  for (int ii=0; ii<N; ii++) {
    for (int jj=0; jj<N; jj++) {
      if (mp[ii][jj].num!=9)
        mp[ii][jj].drawPeca();
    }
  }
}

void setup() {
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      EF.getM()[i][j] = num++;
    }
  }
  size(400, 400);
  background(255, 255, 255);
  criar();
}


int[][] m = {{1, 1, 1}, {1, 1, 1}, {1, 1, 0}};
int i, j, c=0;

void draw() {
  background(255, 255, 255);
  if (mousePressed) {
    //println("*"+mp[0][1].x1);
    mp[j][i].x1=mouseX-(width/N)*0.5;
    mp[j][i].y1=mouseY-(height/N)*0.5;
    if ((i!=mouseX/(width/N) || j!=mouseY/(height/N)) && c==0) {
      Peca temp = mp[mouseY/(height/N)][mouseX/(width/N)];
      mp[mouseY/(height/N)][mouseX/(width/N)] = mp[j][i];
      mp[j][i]=temp;
      c=1;
    }
  } else {
    c=0;
    println(""+i+"-"+j);
    i=mouseX/(width/N);
    j=mouseY/(height/N);
  }

  update();
}



int h(int x0, int y0, int x1, int y1) { //Heurística: Cálculo da Distância 
  return (int) (pow(sqrt((x0-x1)), 2) + pow(sqrt((y0-y1)), 2));
}

//Move a peça para esquerda, direita, cima, baixo
Estado move(int x, int y, Estado e) {
  int[][]M = e.getM(); 
  if (M[x+1][y]==0 && (x+1)<N) {
    int aux = M[x][y];
    M[x][y]=0;
    M[x+1][y]=aux;
    flag=1;
  } else if (M[x-1][y]==0 && (x-1)>0) {
    int aux = M[x][y];
    M[x][y]=0;
    M[x-1][y]=aux;
    flag=1;
  } else if (M[x][y+1]==0 && (y+1)<N) {
    int aux = M[x][y];
    M[x][y]=0;
    M[x][y+1]=aux;
    flag=1;
  } else if (M[x][y-1]==0 && (y-1)>0) {
    int aux = M[x][y];
    M[x][y]=0;
    M[x][y-1]=aux;
    flag=1;
  }
  e.setM(M);
  e.setCusto(e.getPai().getCusto()+1);
  return e;
}

ArrayList<Estado> expande(Estado e) { //Expansão dos estados
  ArrayList<Estado> filhos = new ArrayList<Estado>();
  String est = "";
  Estado temp = new Estado();
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      temp =move(i, j, temp);
      if (flag==1) {
        filhos.add(temp);
      }
      flag=0;
    }
  }
  return filhos;
}