package entities;

public class Fare {
	public Fare() {
		
	}
	
public Fare(String sourceName, String destinationName, String busNo, double fare, String viaRoute) {
		super();
		this.sourceName = sourceName;
		this.destinationName = destinationName;
		this.busNo = busNo;
		this.fare = fare;
		this.viaRoute=viaRoute;
	}
public String getSourceName() {
		return sourceName;
	}
	public void setSourceName(String sourcName) {
		this.sourceName = sourcName;
	}
	public String getDestinationName() {
		return destinationName;
	}
	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}
	public String getBusNo() {
		return busNo;
	}
	public void setBusNo(String busNo) {
		this.busNo = busNo;
	}
	public double getFare() {
		return fare;
	}
	public void setFare(double fare) {
		this.fare = fare;
	}
@Override
	public String toString() {
		return "Fare [sourceName=" + sourceName + ", destinationName=" + destinationName + ", busNo=" + busNo + ", fare="
				+ fare +", viaRoute="+ viaRoute+ "]";
	}
	//class fields
	String sourceName;
	String destinationName;
	String busNo;
	double fare;
	String viaRoute;
	public String getViaRoute() {
		return viaRoute;
	}

	public void setViaRoute(String viaRoute) {
		this.viaRoute = viaRoute;
	}
}
