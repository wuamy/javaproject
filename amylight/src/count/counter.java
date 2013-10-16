package count;

public class counter {
	//init JavaBean variable
	int count = 0;
	
	//get count method
	public int getCount(){
		count++;
		return this.count;
	}
	
	//set count
	public void setCount(int count){
		this.count=count;
	}

}
