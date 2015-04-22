package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KW_DAO extends DAO {

	private static String SELECT_Director = "select * from people where type='Director'";
	private static String SELECT_AC = "select * from people where type='Advisory Committee'";
	private static String SELECT_Researcher = "select * from people where type='Researcher'";
	private static String SELECT_CurrentPhD = "select * from people where type='Current Student' AND title='Ph.D Student'";
	private static String SELECT_CurrentMS = "select * from people where type='Current Student' AND title='M.S Student'";
	private static String SELECT_CurrentUndergraduate = "select * from people where type='Current Student' AND title='B.S Student'";

	public KW_DAO() {
		super(
				"jdbc:mysql://10.131.239.140:3306/knowledgeworks?useUnicode=true&amp;characterEncoding=UTF-8");
	}

	public List<String[]> geDirectorDB() {
		return getByDB(SELECT_Director);
	}

	public List<String[]> geACDB() {
		return getByDB(SELECT_AC);
	}

	public List<String[]> geResearcherDB() {
		return getByDB(SELECT_Researcher);
	}

	public List<String[]> gePhDDB() {
		return getByDB(SELECT_CurrentPhD);
	}

	public List<String[]> geMSDB() {
		return getByDB(SELECT_CurrentMS);
	}

	public List<String[]> geBSDB() {
		return getByDB(SELECT_CurrentUndergraduate);
	}

	private List<String[]> getByDB(String statement) {
		List<String[]> list = new ArrayList<String[]>();
		try {
			super.connect();
			stmt = conn.createStatement();
			String sql = String.format(statement);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new String[] { rs.getString("name"),
						rs.getString("type"), rs.getString("school"),
						rs.getString("image"), rs.getString("title"),
						rs.getString("area"), rs.getString("email"),
						rs.getString("page") });
			}
			super.close();
		} catch (SQLException e) {
			System.out.println("Data base manipulation error");
		}
		return list;
	}

	// public List<String[]> getResearchers() {
	// List<String[]> ret = new ArrayList<String[]>();
	// try {
	// // List<String> list = FileUtil
	// //
	// .readFileByLine("E:\\WebSiteRoot\\KnowledgeWorks\\data\\people\\researchers.txt");
	// List<String> list = FileUtil
	// .readFileByLine("/Users/apple/Documents/workspace/KnowledgeWorks/WebContent/data/people/researchers.txt");
	// for (String line : list) {
	// ret.add(line.split("\t"));
	// }
	// } catch (NullPointerException e) {
	// ret = getResearchersDB();
	// }
	// return ret;
	// }
	//
	// public List<String[]> getStudents() {
	// List<String[]> ret = new ArrayList<String[]>();
	// try {
	// // List<String> list = FileUtil
	// //
	// .readFileByLine("E:\\WebSiteRoot\\KnowledgeWorks\\data\\people\\students.txt");
	// List<String> list = FileUtil
	// .readFileByLine("/Users/apple/Documents/workspace/KnowledgeWorks/WebContent/data/people/students.txt");
	// for (String line : list) {
	// ret.add(line.split("\t"));
	// }
	// } catch (NullPointerException e) {
	// ret = getStudentsDB();
	// }
	// return ret;
	// }

}
