package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entities.Bus;
import entities.BusStop;
import entities.BusUser;

public class Database {
	
	
	public Database() {
		user= new ArrayList<>();
		connectToDatabase();
	}
	
	public void connectToDatabase() {
		try {
			Class.forName(driverClassName);
			con=DriverManager.getConnection(url,userName,dbPassword);
			System.out.println("Connecting to database");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Connection Failed");
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		return con;
	}
	public void setConnection(Connection con) {
		this.con=con;
	}
	
	//--------------------------query methods --------------------------------------//
	public ArrayList<BusUser> getUser(String column){
		try {
			statement=con.createStatement();
			rs = statement.executeQuery("select * from BusUser");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		populateArrayList(rs,"ALL");
		
		return user;
	}
	
	private void populateArrayList(ResultSet rs, String type) {
		try {
			while(rs.next()) {
				BusUser users= new BusUser();
				if(type.equals("ALL")) {
					users.setUserId(rs.getInt(1));
					users.setUsername(rs.getString(2));
					users.setEmail(rs.getString(3));
					users.setPassword(rs.getString(4));
					users.setRole(rs.getString(5));
				}else if(type.equals("Credential")) {
					users.setUsername(rs.getString(2));
					users.setPassword(rs.getString(4));
					users.setRole(rs.getString(5));
				}
				user.add(users);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void writeUser(BusUser user) {
		 String sql="INSERT INTO BusUser VALUES (?, ?, ?, ?, ?)"; 
		 try {
			 PreparedStatement prepareStatement = con.prepareStatement(sql);
			 System.out.println(user);
			 prepareStatement.setInt(1, user.getUserId());
			 prepareStatement.setString(2, user.getUsername());
			 prepareStatement.setString(3, user.getEmail());
			 prepareStatement.setString(4, user.getPassword());
			 prepareStatement.setString(5, user.getRole());
			 prepareStatement.executeUpdate();
			 System.out.println("value inserted successfully.");
		 } catch (SQLException e) {
			e.printStackTrace();
		 }
	}
	
	public ArrayList<BusStop> getStop(String column){
		try {
			statement=con.createStatement();
			rs = statement.executeQuery("select * from BusStop");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		populateArrayListStop(rs);
		
		return busStop;
	}

	private void populateArrayListStop(ResultSet rs) {
		try {
			while(rs.next()) {
				BusStop stop = new BusStop();
					stop.setStopId(rs.getString(1));
					stop.setStopName(rs.getString(2));
				busStop.add(stop);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    private static final String INSERT_BUS_QUERY = "INSERT INTO bus (bus_id, bus_no, capacity, operator) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_BUS_QUERY = "UPDATE bus SET bus_no = ?, capacity = ?, operator = ? WHERE bus_id = ?";
    private static final String DELETE_BUS_QUERY = "DELETE FROM bus WHERE bus_id = ?";
    private static final String SELECT_ALL_BUSES_QUERY = "SELECT * FROM bus";
    public void addBus(Bus bus) {
        try (
             PreparedStatement preparedStatement = con.prepareStatement(INSERT_BUS_QUERY)) {
            preparedStatement.setInt(1, bus.getBusId());
            preparedStatement.setString(2, bus.getBusNo());
            preparedStatement.setInt(3, bus.getCapacity());
            preparedStatement.setString(4, bus.getOperator());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateBus(Bus updatedBus) {
        try (
             PreparedStatement preparedStatement = con.prepareStatement(UPDATE_BUS_QUERY)) {
            preparedStatement.setString(1, updatedBus.getBusNo());
            preparedStatement.setInt(2, updatedBus.getCapacity());
            preparedStatement.setString(3, updatedBus.getOperator());
            preparedStatement.setInt(4, updatedBus.getBusId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBus(int busId) {
        try (
             PreparedStatement preparedStatement = con.prepareStatement(DELETE_BUS_QUERY)) {
            preparedStatement.setInt(1, busId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Bus> getAllBuses() {
        List<Bus> busList = new ArrayList<>();
        try (
             Statement statement = con.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_BUSES_QUERY)) {
            while (resultSet.next()) {
                Bus bus = new Bus();
                bus.setBusId(resultSet.getInt("bus_id"));
                bus.setBusNo(resultSet.getString("bus_no"));
                bus.setCapacity(resultSet.getInt("capacity"));
                bus.setOperator(resultSet.getString("operator"));
                busList.add(bus);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return busList;
    }

	static {
		driverClassName="oracle.jdbc.driver.OracleDriver";
		url="jdbc:oracle:thin:@localhost:1521:xe";
		userName="system";
		dbPassword="root";
		
	}
	
	
	//class fields for database
	private Connection con;
	private static String driverClassName;
	private static String url;
	private static String userName;
	private static String dbPassword;
	
	//class fields for database references
	private  Statement statement;
	private ResultSet rs;
	private ArrayList<BusUser> user;
	private ArrayList<BusStop> busStop;
}
