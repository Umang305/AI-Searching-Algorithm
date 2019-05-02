import java.util.*;
import controlP5.*;

ControlP5 cp5a;

//import ControlP5.*;
int heuristic[]={366,0,160,242,161,176,77,151,226,244,234,380,100,193,253,329,80,199,374};

Vertex Finalsource,Finaldest;
PriorityQueue<Vertex> pqueue = new PriorityQueue<Vertex>(20, new Vertex());
Queue<Vertex> pathBest = new LinkedList<Vertex>();
Queue<Vertex> visited = new LinkedList<Vertex>();
LinkedList<Vertex> adj[] ;
LinkedList<Vertex> bfspath=new LinkedList<Vertex>();
Stack<Vertex> pathAstar = new Stack<Vertex>();
Stack<Vertex> ucspath=new Stack<Vertex>();
Stack<Vertex> path = new Stack<Vertex>();
Stack<Vertex>FinalStack = new Stack<Vertex>();
int algoFlag = 99;
Vertex [] v;
Vertex arad, bucharest, craiova, drobeta, etosle, fagaras, giurain, hirsona, iasi;
Vertex lugoj, mehadia, neamt, oraden, piteshi, rVilcia, sibiu, timisora, urziceni,vashni,zerind ;
BestFirstSearch b = new BestFirstSearch();
Graph g = new Graph();
Astar a = new Astar();
ucs u = new ucs();

void setup(){
  //size(1200,1000);
  fullScreen();
  //frameRate(4);
 v = new Vertex[20];
 arad = new Vertex(100,300,"Arad",366,0);
 bucharest = new Vertex(550,650,"Bucharest",0,1);
 craiova = new Vertex(300,750,"Cariova",160,2);
 drobeta = new Vertex(200,700,"Drobeta",242,3);
 etosle = new Vertex(850,500,"Etosle",161,4);
 fagaras = new Vertex(500,400,"Fagaras",176,5);
 giurain = new Vertex(500,750,"Giurain",77,6);
 hirsona = new Vertex(900,400,"Hirsona",151,7);
 iasi = new Vertex(750,200,"Iasi",226,8);
 lugoj = new Vertex(200,500,"Lugoj",244,9);
 mehadia = new Vertex(200,600,"Mehadia",241,10);
 neamt = new Vertex(650,100,"Neamt",234,11);
 oraden = new Vertex(200,100,"Oraden",380,12);
 piteshi = new Vertex(400,550,"Piteshi",100,13);
 rVilcia = new Vertex(300,460,"RVilcia",193,14);
 sibiu = new Vertex(300,350,"Sibiu",253,15);
 timisora = new Vertex(150,400,"Timisora",329,16);
 urziceni = new Vertex(700,400,"Urziceni",80,17);
 vashni = new Vertex(800,300,"Vashni",199,18);
 zerind = new Vertex(150,200,"Zerind",374,19);
      
  v[0] = arad; v[1] = bucharest; v[2] = craiova; v[3] = drobeta; v[4] = etosle; v[5] = fagaras;
  v[6] = giurain; v[7] = hirsona; v[8] = iasi; v[9] = lugoj; v[10] = mehadia; v[11] = neamt;
  v[12] = oraden; v[13] = piteshi; v[14] = rVilcia; v[15] = sibiu; v[16] = timisora;
  v[17] = urziceni; v[18] = vashni; v[19] = zerind; 
  
  arad.neighbour.add(zerind);arad.neighbour.add(sibiu); arad.neighbour.add(timisora); 
  bucharest.neighbour.add(piteshi); bucharest.neighbour.add(fagaras);bucharest.neighbour.add(urziceni);bucharest.neighbour.add(giurain);
  craiova.neighbour.add(drobeta); craiova.neighbour.add(piteshi); craiova.neighbour.add(rVilcia);
  drobeta.neighbour.add(craiova); drobeta.neighbour.add(mehadia);
  etosle.neighbour.add(hirsona);
  fagaras.neighbour.add(sibiu); fagaras.neighbour.add(bucharest);
  giurain.neighbour.add(bucharest);
  hirsona.neighbour.add(etosle); hirsona.neighbour.add(urziceni);
  iasi.neighbour.add(neamt); iasi.neighbour.add(vashni);
  lugoj.neighbour.add(timisora); lugoj.neighbour.add(mehadia);
  mehadia.neighbour.add(lugoj); mehadia.neighbour.add(drobeta);
  neamt.neighbour.add(iasi);
  oraden.neighbour.add(zerind); oraden.neighbour.add(sibiu);
  piteshi.neighbour.add(craiova); piteshi.neighbour.add(rVilcia); piteshi.neighbour.add(bucharest);
  rVilcia.neighbour.add(sibiu); rVilcia.neighbour.add(piteshi); rVilcia.neighbour.add(craiova);
  sibiu.neighbour.add(oraden); sibiu.neighbour.add(arad);sibiu.neighbour.add(fagaras);sibiu.neighbour.add(rVilcia);
  timisora.neighbour.add(arad); timisora.neighbour.add(lugoj);
  urziceni.neighbour.add(bucharest); urziceni.neighbour.add(vashni); urziceni.neighbour.add(hirsona);
  vashni.neighbour.add(iasi); vashni.neighbour.add(urziceni);
  zerind.neighbour.add(arad); zerind.neighbour.add(oraden);
  
        arad.adjacencies = new Edge[]{
                new Edge(zerind,75),
                new Edge(sibiu,140),
                new Edge(timisora,117)
        };
         //bucharest
        bucharest.adjacencies = new Edge[]{
                new Edge(piteshi,101),
                new Edge(fagaras,211),
                new Edge(giurain,99),
                new Edge(urziceni,85)
        };
         //craiova
        craiova.adjacencies = new Edge[]{
                new Edge(piteshi,146),
                new Edge(drobeta,120),
                new Edge(rVilcia,158)
        };
         //drobeta
        drobeta.adjacencies = new Edge[]{
                new Edge(mehadia,75),
                new Edge(craiova,120),
        };
         //etosle
        etosle.adjacencies = new Edge[]{
                new Edge(hirsona,86)
        };
         //fagaras
        fagaras.adjacencies = new Edge[]{
                new Edge(sibiu,99),
                new Edge(bucharest,211)
        };
         //giurain
        giurain.adjacencies = new Edge[]{
                new Edge(bucharest,99),
        };
        //hirsona
        hirsona.adjacencies = new Edge[]{
                new Edge(urziceni,98),
                new Edge(etosle,86)
        };
         //iasi
        iasi.adjacencies = new Edge[]{
                new Edge(neamt,87),
                new Edge(vashni,91)
        };
         //lugoj
        lugoj.adjacencies = new Edge[]{
                new Edge(timisora,111),
                new Edge(mehadia,70)
        };
         //mehadia
        mehadia.adjacencies = new Edge[]{
                new Edge(lugoj,70),
                new Edge(drobeta,75)
        };
         //neamt
        neamt.adjacencies = new Edge[]{
                new Edge(iasi,87)
        };
        //oraden
        oraden.adjacencies = new Edge[]{
                new Edge(zerind,71),
                new Edge(sibiu,151)
        };
         //piteshi
        piteshi.adjacencies = new Edge[]{
                new Edge(rVilcia,97),
                new Edge(craiova,158),
                new Edge(bucharest,101)
        };
        //RVilcia
        rVilcia.adjacencies = new Edge[]{
                new Edge(sibiu,81),
                new Edge(piteshi,97),
                new Edge(craiova,146)
        };
        //sibiu
        sibiu.adjacencies = new Edge[]{
                new Edge(oraden,151),
                new Edge(fagaras,99),
                new Edge(arad,140),
                new Edge(rVilcia,81)
        };
        //timisora
        timisora.adjacencies = new Edge[]{
                new Edge(arad,112),
                new Edge(lugoj,111)
        };
        //Urziceni
        urziceni.adjacencies = new Edge[]{
                new Edge(hirsona,98),
                new Edge(bucharest,85),
                new Edge(vashni,198)
        };
        //vashni
        vashni.adjacencies = new Edge[]{
                new Edge(iasi,91),
                new Edge(urziceni,198)
        };
        //zerind
        zerind.adjacencies = new Edge[]{
                new Edge(arad,75),
                new Edge(oraden,71)
        };
  
  cp5a = new ControlP5(this);  
  cp5a.setFont(new ControlFont(createFont("Arial", 20, true), 15)); 
  DropdownList d = cp5a.addDropdownList("Algorithm").setPosition(950,500).setSize(230,100)
  .setItemHeight(20).setBarHeight(20);
  d.addItem("Breadth First Search",d);
  d.addItem("Depth First Search",d);
  d.addItem("Uniform Cost Search",d);
  d.addItem("Best First Search",d);
  d.addItem("A* Algorithm",d);
  //d.controlEvent(new ControlEvent(this));
  
  DropdownList d1 = cp5a.addDropdownList("Source").setPosition(950,100).setSize(230,100)
  .setItemHeight(20).setBarHeight(20);
  for(int i = 0 ; i<v.length; i++){
    d1.addItem(v[i].name,d1);
  }
  
  DropdownList d2 = cp5a.addDropdownList("Destination").setPosition(950,300).setSize(230,100)
  .setItemHeight(20).setBarHeight(20);
  for(int i = 0 ; i<v.length; i++){
    d2.addItem(v[i].name,d2);
  }
  
  cp5a.addButton("Submit").setPosition(1000,700).setSize(100,19);
  cp5a.addButton("Reset").setPosition(1000,750).setSize(100,19);
  cp5a.addButton("Close").setPosition(1000,800).setSize(100,19);
  
}


void draw(){
  background(0);
  
  stroke(255);
  line(oraden.x,oraden.y,zerind.x,zerind.y);
  line(oraden.x,oraden.y,sibiu.x,sibiu.y);
  line(zerind.x,zerind.y,arad.x,arad.y);
  line(arad.x,arad.y,sibiu.x,sibiu.y);
  line(arad.x,arad.y,timisora.x,timisora.y);
  line(timisora.x,timisora.y,lugoj.x,lugoj.y);
  line(lugoj.x,lugoj.y,mehadia.x,mehadia.y);
  line(mehadia.x,mehadia.y,drobeta.x,drobeta.y);
  line(drobeta.x,drobeta.y,craiova.x,craiova.y);
  line(sibiu.x,sibiu.y,rVilcia.x,rVilcia.y);
  line(sibiu.x,sibiu.y,fagaras.x,fagaras.y);
  line(rVilcia.x,rVilcia.y,craiova.x,craiova.y);
  line(rVilcia.x,rVilcia.y,piteshi.x,piteshi.y);
  line(piteshi.x,piteshi.y,craiova.x,craiova.y);
  line(piteshi.x,piteshi.y,bucharest.x,bucharest.y);
  line(bucharest.x,bucharest.y,giurain.x,giurain.y);
  line(bucharest.x,bucharest.y,fagaras.x,fagaras.y);
  line(bucharest.x,bucharest.y,urziceni.x,urziceni.y);
  line(urziceni.x,urziceni.y,vashni.x,vashni.y);
  line(urziceni.x,urziceni.y,hirsona.x,hirsona.y);
  line(hirsona.x,hirsona.y,etosle.x,etosle.y);
  line(vashni.x,vashni.y,iasi.x,iasi.y);
  line(iasi.x,iasi.y,neamt.x,neamt.y);
  fill(0,120,100);
  stroke(120);
  if(Finalsource!=null)
    ellipse(Finalsource.x,Finalsource.y,80,80);
  if(Finaldest!=null)
    ellipse(Finaldest.x,Finaldest.y,80,80);
  
  for(int i=0;i<v.length;i++){
    v[i].show();
  }
}

void del(int t){
  int time=millis();
  while(millis()-time<=t);
}



void controlEvent(ControlEvent theEvent){
  System.out.println(theEvent.getName());
  
  if(theEvent.getName().equals("Source")){
    int selected_source=(int)theEvent.getValue();
    Finalsource = v[selected_source];
    System.out.println(v[selected_source].name);
   }
   
   if(theEvent.getName().equals("Destination")){
    int selected_dest=(int)theEvent.getValue();
    Finaldest = v[selected_dest];
    System.out.println(v[selected_dest].name);
   }
  
  if(theEvent.getName().equals("Algorithm")){
    int selected_algo=(int)theEvent.getValue();
    switch(selected_algo){
      case 0:
        System.out.println("bfs");
        g.bfs(Finalsource,Finaldest); 
        algoFlag = 0;
        break;
      case 1:
        System.out.println("dfs");
        DFSfun(Finalsource,Finaldest);
        algoFlag = 1;
        break;
      case 2:
        System.out.println("ucs");
        algoFlag = 2;
        u.ucsAlgo(v);
        for(int i=0;i<v.length;i++)
          v[i].ucs = true;
        //u.UniformCostSearch(Finalsource,Finaldest);
        break;
      case 3:
        System.out.println("bestfs");
        algoFlag = 3;
        for(int i=0;i<v.length;i++)
          v[i].best = true;
        b.compute(Finalsource,Finaldest);
        break;
      case 4:
        System.out.println("A*");
        algoFlag = 4;        
        a.astarSearch(Finalsource, Finaldest);
        for(int i=0;i<v.length;i++){
          v[i].best = true;
          v[i].astar = true;
        }
        a.printPath(Finaldest);
        break;
    }
  }
  
  if(theEvent.getName().equals("Submit")){
    int selected_source=(int)theEvent.getValue();
    //System.out.println(selected_source);
    System.out.println(selected_source);
    //key pressed wala
    switch(algoFlag){
      case 0: bfsPrint();
        break;
      case 1: dfsPrint();
        break;
      case 2: ucsPrint();
        break;
      case 3: bestPrint();
        break;
      case 4: astarPrint();
        break;
    }
  }
  
  if(theEvent.getName().equals("Reset")){
    pathBest.clear();
    pathAstar.clear();
    bfspath.clear();
    ucspath.clear();
    FinalStack.clear();
    visited.clear();
    pqueue.clear();
    Finalsource = null;
    Finaldest = null;
    path.clear();
    for(int i = 0 ; i<v.length; i++){
      v[i].initFlagColor = 0;
      v[i].colour = false;
      v[i].visitedneighbour=false;
      v[i].FlagColor = 0;
      v[i].isVisited = false;
      v[i].best = false;
      v[i].astar = false;
      v[i].ucs = false;
    }
  }
  
  if(theEvent.getName().equals("Close")){
    noLoop();
    exit();
  }
}
void dfsPrint(){
  Vertex temp = Finaldest;
  if(!FinalStack.empty()){
    temp=FinalStack.pop();
    textSize(26);
    fill(255);
    //text(temp.name,400,150);
    temp.FlagColor=1;
    temp.initFlagColor=1;
    System.out.println(temp.name);
    if(temp == Finaldest)
      return;
    System.out.println("neighbour"); 
    Iterator<Vertex> n = adj[temp.id].listIterator(); 
      while(n.hasNext()){   
        Vertex neighbour = n.next();
        if(neighbour.initFlagColor!=1)
          neighbour.FlagColor=2;
        System.out.println(neighbour.name);
      }
   }
}

void bestPrint(){
  Vertex random;
  System.out.println(pathBest.isEmpty());
  if(!pathBest.isEmpty()){
      random = pathBest.remove();
      random.colour = true;
      System.out.println(random.name);
      for(int i = 0; i<random.neighbour.size(); i++){
        if(random == Finaldest){
          break;
        }
        Vertex u = random.neighbour.get(i);
        u.visitedneighbour = true;
      }
   }
}

void astarPrint(){
  Vertex random;
  if(!pathAstar.isEmpty()){
      random = pathAstar.pop();
      random.colour = true;
      System.out.println(random.name);
      for(int i=0;i<random.adjacencies.length;i++){
        if(random == Finaldest)
          break;
        Edge u = random.adjacencies[i];
        u.target.visitedneighbour = true;
      }
   }
}

void bfsPrint(){
  Vertex temp = new Vertex();
  if(!bfspath.isEmpty()){
      temp=bfspath.poll();
      for (int i=0; i<temp.neighbour.size();i++){
        if(temp.name.equals(Finaldest.name))
              break;
        temp.neighbour.get(i).visitedneighbour=true;
     }
     temp.colour = true;
   }
}

void ucsPrint(){
  Vertex temp = new Vertex();
    if(!ucspath.isEmpty()){
      temp=ucspath.pop();
       for (int i=0; i<temp.neighbour.size();i++){
        if(temp.name.equals(Finaldest.name))
              break;
        temp.neighbour.get(i).visitedneighbour=true;
      }
      temp.colour = true;
    }
}
