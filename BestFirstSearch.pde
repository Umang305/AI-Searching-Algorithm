import java.util.PriorityQueue;
import java.util.Queue;
import java.util.LinkedList;
                        //A B C D E F G H I L M N O P R S T U V Z
int adjacency_matrix[][]={{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,140,118,0,0,75},//arad
                         {0,0,0,0,0,211,99,0,0,0,0,0,101,0,0,0,0,85,0,0},//bucharest
                         {0,0,0,120,0,0,0,0,0,0,0,0,0,0,138,146,0,0,0,0},//craviona
                         {0,0,120,0,0,0,0,0,0,0,75,0,0,0,0,0,0,0,0,0},//drobeta
                         {0,0,0,0,0,0,0,86,0,0,0,0,0,0,0,0,0,0,0,0},//etosle
                         {0,211,0,0,0,0,0,0,0,0,0,0,0,0,0,99,0,0,0,0},//fagurus
                         {0,99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//giurain
                         {0,0,0,0,86,0,0,0,0,0,0,0,0,0,0,0,0,98,0,0},//hirsona
                         {0,0,0,0,0,0,0,0,0,0,0,87,0,0,0,0,0,0,92,0},//iasi
                         {0,0,0,0,0,0,0,0,0,0,70,0,0,0,0,0,111,0,0,0},//lugoi
                         {0,0,0,75,0,0,0,0,0,70,0,0,0,0,0,0,0,0,0,0},//mehdia
                         {0,0,0,0,0,0,0,0,87,0,0,0,0,0,0,0,0,0,0,0},//neamt
                         {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,151,0,0,0,71},//oradea
                         {0,101,138,0,0,0,0,0,0,0,0,0,0,0,97,0,0,0,0,0},//piteshi
                         {0,0,146,0,0,0,0,0,0,0,0,0,0,0,97,80,0,0,0,0},//rv
                         {140,0,0,0,0,99,0,0,0,0,0,0,151,0,80,0,0,0,0,0},//sibin
                         {118,0,0,0,0,0,0,0,0,111,0,0,0,0,0,0,0,0,0,0},//timisora
                         {0,85,0,0,0,0,0,98,0,0,0,0,0,0,0,0,0,0,142,0},//urziceni
                         {0,0,0,0,0,0,0,0,92,0,0,0,0,0,0,0,0,142,0,0},//vashni
                         {75,0,0,0,0,0,0,0,0,0,0,0,71,0,0,0,0,0,0,0}};//zerind
Vertex evaluationNode;
int i = 2;

class BestFirstSearch{
  void compute(Vertex source, Vertex dest){
    pqueue.add(source);
    while(!pqueue.isEmpty()){
      evaluationNode = pqueue.remove();
      if(evaluationNode == dest){
        pathBest.add(evaluationNode);
        return;
      }
      else{
        for(int l=0; l<evaluationNode.neighbour.size(); l++){
          Vertex v = evaluationNode.neighbour.get(l);
          if(v.isVisited == false){
            v.isVisited = true;
            visited.add(v);
            pqueue.add(v);
          }
          if(!pathBest.contains(evaluationNode))
            pathBest.add(evaluationNode);
          System.out.println(pathBest.peek());
        }
      }
    }
  }
}
