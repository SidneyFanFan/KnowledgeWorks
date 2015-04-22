package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProbaseServlet
 */
@WebServlet("/ProbaseServlet")
public class ProbaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProbaseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		String word = request.getParameter("word");
		String databaseName = request.getParameter("databaseName");
		String from = request.getParameter("from");
		System.out.println("receive " + word + " " + databaseName + " " + from);
		// fetch data
		String url_str = String.format(
				"http://10.141.208.25/tax/%s/%s/?start=%s", databaseName, word,
				from);
		url_str = url_str.replace(" ", "%20");
		System.out.println("send " + url_str);
		String data = fetchData(url_str);
		if (data == null) {
			writer.write("{}");
		} else {
			writer.write(data);
		}
		// System.out.println(data);
		writer.flush();
		writer.close();
	}

	private String fetchData(String url_str) {
		URL url = null;
		try {
			url = new URL(url_str);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		String charset = "utf-8";
		int sec_cont = 1000;
		try {
			URLConnection url_con = url.openConnection();
			url_con.setDoOutput(true);
			url_con.setReadTimeout(10 * sec_cont);
			url_con.setRequestProperty("User-Agent",
					"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");
			InputStream htm_in = url_con.getInputStream();
			String data = InputStream2String(htm_in, charset);
			return data;
		} catch (IOException e) {
			return null;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * Method: InputStream2String Description: make InputStream to String
	 * 
	 * @param in_st
	 *            inputstream which need to be converted
	 * @param charset
	 *            encoder of value
	 * @throws IOException
	 *             if an error occurred
	 */
	public String InputStream2String(InputStream in_st, String charset)
			throws IOException {
		BufferedReader buff = new BufferedReader(new InputStreamReader(in_st,
				charset));
		StringBuffer res = new StringBuffer();
		String line = "";
		while ((line = buff.readLine()) != null) {
			res.append(line);
		}
		return res.toString();
	}

}
