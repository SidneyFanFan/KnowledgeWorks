package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import structure.Triple;

public class CNDB_DAO extends DAO {

	private static String SELECT_INFORMATION = "select * from information where entity_name='%s'";
	private static String SELECT_INFOBOX = "select * from infobox where entity_name='%s'";
	private static String SELECT_CATEGORY = "select * from category where entity_name='%s'";
	private static String SELECT_CLASS = "select * from class where entity_name='%s'";
	private static String SELECT_CLASS2 = "select * from myclass2 where entity_name='%s'";
	private static String SELECT_SAMEAS = "select * from sameas where entity_name='%s'";

	public CNDB_DAO() {
		super(
				"jdbc:mysql://10.131.239.140:3306/cndbpedia?useUnicode=true&amp;characterEncoding=UTF-8");
	}

	public List<Triple<String, String, String>> getInformation(
			String entity_name) {
		List<Triple<String, String, String>> infoList = new ArrayList<Triple<String, String, String>>();
		try {
			super.connect();
			stmt = conn.createStatement();
			String sql = String.format(SELECT_INFORMATION, entity_name);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				infoList.add(new Triple<String, String, String>(rs
						.getString("entity_name"), rs
						.getString("entity_information"), rs
						.getString("entity_information_value")));
			}
			super.close();
		} catch (SQLException e) {
			infoList.add(new Triple<String, String, String>(entity_name, "信息",
					"查询失败"));
			System.out.println("Data base manipulation error");
			// e.printStackTrace();
		}
		return infoList;
	}

	public List<Triple<String, String, String>> getInfobox(String entity_name) {
		List<Triple<String, String, String>> list = new ArrayList<Triple<String, String, String>>();
		try {
			super.connect();
			stmt = conn.createStatement();
			String sql = String.format(SELECT_INFOBOX, entity_name);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Triple<String, String, String>(rs
						.getString("entity_name"), rs
						.getString("entity_attribute"), rs
						.getString("entity_attribute_value")));
			}
			super.close();
		} catch (SQLException e) {
			list.add(new Triple<String, String, String>(entity_name, "信息",
					"查询失败"));
			System.out.println("Data base manipulation error");
			// e.printStackTrace();
		}
		return list;
	}

	public List<Triple<String, String, String>> getCategory(String entity_name) {
		List<Triple<String, String, String>> list = new ArrayList<Triple<String, String, String>>();
		try {
			super.connect();
			stmt = conn.createStatement();
			String sql = String.format(SELECT_CATEGORY, entity_name);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Triple<String, String, String>(rs
						.getString("entity_name"),
						rs.getString("entity_class"), rs
								.getString("entity_category")));
			}
			super.close();
		} catch (SQLException e) {
			list.add(new Triple<String, String, String>(entity_name, "信息",
					"查询失败"));
			System.out.println("Data base manipulation error");
			// e.printStackTrace();
		}
		return list;
	}
	
	public List<Triple<String, String, String>> getClass(String entity_name) {
		List<Triple<String, String, String>> list = new ArrayList<Triple<String, String, String>>();
		try {
			super.connect();
			stmt = conn.createStatement();
			String sql = String.format(SELECT_CLASS, entity_name);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Triple<String, String, String>(rs
						.getString("entity_name"),
						rs.getString("type_dbpedia"), rs
								.getString("type_link")));
			}
			super.close();
		} catch (SQLException e) {
			list.add(new Triple<String, String, String>(entity_name, "信息",
					"查询失败"));
			System.out.println("Data base manipulation error");
			// e.printStackTrace();
		}
		return list;
	}
	
	public List<Triple<String, String, String>> getClass2(String entity_name) {
		List<Triple<String, String, String>> list = new ArrayList<Triple<String, String, String>>();
		try {
			super.connect();
			stmt = conn.createStatement();
			String sql = String.format(SELECT_CLASS2, entity_name);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Triple<String, String, String>(rs
						.getString("entity_name"),
						rs.getString("type_dbpedia"), rs
								.getString("type_link")));
			}
			super.close();
		} catch (SQLException e) {
			list.add(new Triple<String, String, String>(entity_name, "信息",
					"查询失败"));
			System.out.println("Data base manipulation error");
			// e.printStackTrace();
		}
		return list;
	}
	
	public List<Triple<String, String, String>> getSameAs(String entity_name) {
		List<Triple<String, String, String>> list = new ArrayList<Triple<String, String, String>>();
		try {
			super.connect();
			stmt = conn.createStatement();
			String sql = String.format(SELECT_SAMEAS, entity_name);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new Triple<String, String, String>(rs
						.getString("entity_name"),
						rs.getString("entity_dbpedia"), rs
								.getString("entity_link")));
			}
			super.close();
		} catch (SQLException e) {
			list.add(new Triple<String, String, String>(entity_name, "信息",
					"查询失败"));
			System.out.println("Data base manipulation error");
			// e.printStackTrace();
		}
		return list;
	}
	
}
