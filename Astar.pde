import java.util.*;

class Astar{
  public void printPath(Vertex target){
        for(Vertex node = target; node!=null; node = node.parent){
            pathAstar.add(node);
        }
    }
    public void astarSearch(Vertex source, Vertex goal){
        Set<Vertex> explored = new HashSet<Vertex>();
        PriorityQueue<Vertex> queue = new PriorityQueue<Vertex>(20, new Comparator<Vertex>(){
                public int compare(Vertex i, Vertex j){
                    if(i.f_scores > j.f_scores){
                        return 1;
                    }
                    else if (i.f_scores < j.f_scores){
                        return -1;
                    }
                    else{
                        return 0;
                    }
                }
            }
        );
        source.g_scores = 0;
        queue.add(source);
        boolean found = false;
        while((!queue.isEmpty())&&(!found)){
            Vertex current = queue.poll();
            explored.add(current);
            if(current.id == goal.id){
                    found = true;
            }
            for(Edge e : current.adjacencies){
                Vertex child = e.target;
                double cost = e.cost;
                double temp_g_scores = current.g_scores + cost;
                double temp_f_scores = temp_g_scores + child.h_scores;                
                if((explored.contains(child)) && (temp_f_scores >= child.f_scores))
                        continue;
                else if((!queue.contains(child)) || (temp_f_scores < child.f_scores)){
                    child.parent = current;
                    child.g_scores = temp_g_scores;
                    child.f_scores = temp_f_scores;
                    if(queue.contains(child))
                            queue.remove(child);
                    queue.add(child);
                    child.colourEx = true;
                    child.show();
                }
            }
        }
    }
}
