import java.util.Iterator;
import java.util.LinkedList;
import java.util.ArrayList;

import java.util.Vector;
import java.util.Stack;

int no_of_vertices=20;
int flag=0;

void DFSUtil(Vertex v1, Vertex v2) { 
  v1.isVisited=true;
  if(v1.name==v2.name){ //<>//
    flag=1;
    FinalStack.push(v1);
    return;
   }
   
   Iterator<Vertex> i = adj[v1.id].listIterator(); 
   while(i.hasNext() && flag!=1){  
     Vertex neighbour = i.next();
       if (!neighbour.isVisited)
         DFSUtil(neighbour, v2);
       if(flag==1)
         FinalStack.push(v1);    
   }
}
void addEdge(Vertex v, Vertex w) { 
  adj[v.id].add(w);
  adj[w.id].add(v);
}
       
void DFSfun(Vertex source, Vertex dest) {
  adj = new LinkedList[v.length];
  for(Vertex ver:v)
    adj[ver.id] = new LinkedList();
    
  addEdge(oraden, zerind);
  addEdge(neamt,iasi);
  addEdge(zerind, arad);
  addEdge(iasi,vashni);  
  addEdge(arad, sibiu);
  addEdge(arad, timisora);      
  addEdge(sibiu, rVilcia); 
  addEdge(sibiu, fagaras); 
  addEdge(vashni,urziceni);   
  addEdge(timisora, lugoj);     
  addEdge(rVilcia, piteshi);  
  addEdge(rVilcia, craiova);   
  addEdge(urziceni,bucharest);
  addEdge(urziceni,hirsona);    
  addEdge(fagaras,bucharest);
  addEdge(lugoj, mehadia);
  addEdge(mehadia,drobeta);
  addEdge(oraden, sibiu);
  addEdge(drobeta, craiova);
  addEdge(piteshi, craiova);
  addEdge(piteshi, bucharest);
  addEdge(bucharest,giurain);
  addEdge(hirsona,etosle);
  
  
  Vertex v1=source; 
  Vertex v2=dest;
  source=v1;
  DFSUtil(v1, v2);
  flag=0;
}
