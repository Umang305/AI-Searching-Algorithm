

import java.io.*; 
import java.util.*; 
  
class Graph {
    private int V=20; 
    void bfs(Vertex s,Vertex dest) { 
        LinkedList<Vertex> queue = new LinkedList<Vertex>(); 
        s.isVisited=true; 
        queue.add(s); 
        while (queue.size() != 0) {
          s = queue.poll(); 
          bfspath.add(s);
          if(s.name== dest.name)
            return;
          System.out.print(s.name+"--> "); 
          Iterator<Vertex> i = s.neighbour.listIterator(); 
          while (i.hasNext()) { 
            Vertex n = i.next(); 
            if (!n.isVisited) { 
              n.isVisited = true; 
              queue.add(n);                   
            } 
          } 
       } 
    } 
}
    
