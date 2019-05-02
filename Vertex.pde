import java.util.ArrayList;
import java.util.Comparator;
class Vertex implements Comparator<Vertex>{
  int x,y,id;
  String name;
  public double g_scores;
  public final double h_scores;
  public double f_scores = 0;
  public Edge[] adjacencies;
  public Vertex parent;
  boolean isVisited = false, visitedneighbour = false, colour = false, ucs =false, colourEx=false, best = false, astar = false;
  ArrayList<Vertex> neighbour;
  int FlagColor=0;
  int initFlagColor=0;
  public double pathCost =0;
  
  public Vertex(int x, int y, String name,int heuristic, int id){
    this.x = x;
    this.y = y;
    this.name = name;
    this.h_scores = heuristic;
    this.id = id;
    neighbour = new ArrayList<Vertex>();
  }
  
  Vertex(){
    h_scores = 0;
  }
  
  public String toString() {
    return name;
  }
  
  @Override 
    public int compare(Vertex vertex1, Vertex vertex2){
        if (vertex1.h_scores < vertex2.h_scores)
            return -1;
        if (vertex1.h_scores > vertex2.h_scores)
            return 1;
        return 0;
    }
    
    void show(){
      if(FlagColor==1 || colour){
        fill(0,255,0);
      }
      else if(FlagColor==2 || visitedneighbour){
        fill(255,255,0);
      }
      else{
        fill(255,0,0);
      }
      ellipse(this.x,this.y,75,75);
      fill(0);
      textSize(13);
      text(this.name,this.x-23,this.y);
      if(best){
        textSize(11);
        fill(0,0,100);
        text(Double.toString(h_scores), this.x-15, this.y+15);
      }
      if(astar){
        textSize(11);
        fill(100,0,0);
        text(Double.toString(f_scores), this.x-15, this.y+30);
      }
      if(ucs){
        textSize(11);
        fill(0,0,100);
        text(Double.toString(pathCost), this.x-15, this.y+15);
      }
      
    }
   
}
