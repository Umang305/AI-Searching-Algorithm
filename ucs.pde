import java.util.*;

public class ucs{       
     public void UniformCostSearch(Vertex source, Vertex goal){
        source.pathCost = 0;
        PriorityQueue<Vertex> queue = new PriorityQueue<Vertex>(20, new Comparator<Vertex>(){
                public int compare(Vertex i, Vertex j){
                    if(i.pathCost > j.pathCost)
                        return 1;
                    else if (i.pathCost < j.pathCost)
                        return -1;
                    else
                        return 0;
                }
            }
        );
        queue.add(source);
        Set<Vertex> explored = new HashSet<Vertex>();
        boolean found = false;
        //while frontier is not empty
        do{
            Vertex current = queue.poll();
            explored.add(current);
            if(current.name.equals(goal.name))
                found = true;
            for(Edge e: current.adjacencies){
                Vertex child = e.target;
                double cost = e.cost;
                child.pathCost = current.pathCost + cost;
                if(!explored.contains(child) && !queue.contains(child)){
                    child.parent = current;
                    queue.add(child);
                    System.out.println(child);
                    System.out.println(queue);
                    System.out.println();
                }
                else if((queue.contains(child))&&(child.pathCost>current.pathCost)){
                    child.parent=current;
                    queue.remove(child);
                    queue.add(child);
                }
            }
        }while(!queue.isEmpty());
    }
    Stack<Vertex> printPath(Vertex target){
        Stack<Vertex> path = new Stack<Vertex>();
        for(Vertex node = target; node!=null; node = node.parent)
            path.add(node);
        return path;
    }
    void ucsAlgo(Vertex v[]){       
      UniformCostSearch(Finalsource,Finaldest);
      Stack<Vertex> pathucs = printPath(Finaldest);
      for (int j=0;j<pathucs.size();j++){
        for(int i=0;i<20;i++){
          if(pathucs.get(j).name.equals(v[i].name)){
            v[i].isVisited=true;
            ucspath.add(v[i]);
          }
        }
      }
      System.out.println("Path: " + pathucs);
   }
 }
