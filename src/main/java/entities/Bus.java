package entities;

public class Bus {
    private int busId;
    private String busNo;
    private int capacity;
    private String operator;
    
    
	@Override
	public String toString() {
		return "Bus [busId=" + busId + ", busNo=" + busNo + ", capacity=" + capacity + ", operator=" + operator + "]";
	}
	public Bus(int busId, String busNo, int capacity, String operator) {
		super();
		this.busId = busId;
		this.busNo = busNo;
		this.capacity = capacity;
		this.operator = operator;
	}
	public Bus() {
	}
	public int getBusId() {
		return busId;
	}
	public void setBusId(int busId) {
		this.busId = busId;
	}
	public String getBusNo() {
		return busNo;
	}
	public void setBusNo(String busNo) {
		this.busNo = busNo;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}

    // Constructor, getters, and setters
    
}

