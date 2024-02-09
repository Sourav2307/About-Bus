package entities;

public class BusStop {

	
	public String getStopId() {
		return stopId;
	}
	public void setStopId(String stopId) {
		this.stopId = stopId;
	}
	public String getStopName() {
		return stopName;
	}
	public void setStopName(String stopName) {
		this.stopName = stopName;
	}
	public BusStop(String stopId, String stopName) {
		super();
		this.stopId = stopId;
		this.stopName = stopName;
	}
	public BusStop() {
	}
	//class fields
	String stopId;
	String stopName;

	
}
