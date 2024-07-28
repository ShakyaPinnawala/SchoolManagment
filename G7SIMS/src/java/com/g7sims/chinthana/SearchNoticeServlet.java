package com.g7sims.chinthana;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SearchNoticeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String query = request.getParameter("query");

            // Call your database utility method to perform the search
            List<Notice> searchResults = new NoticeDBUtil().searchNotices(query);

            // Set content type to JSON
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            // Convert search results to JSON and send as response
            out.print(convertToJSON(searchResults));
            out.flush();
        } catch (Exception ex) {
            Logger.getLogger(SearchNoticeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String convertToJSON(List<Notice> notices) {
        StringBuilder json = new StringBuilder("[");
        for (Notice notice : notices) {
            json.append("{");
            json.append("\"noticeID\":\"").append(notice.getNoticeID()).append("\",");
            json.append("\"noticeTitle\":\"").append(notice.getNoticeTitle()).append("\",");
            json.append("\"noticeContent\":\"").append(notice.getNoticeContent()).append("\"");
            json.append("},");
        }
        if (!notices.isEmpty()) {
            json.deleteCharAt(json.length() - 1); // Remove trailing comma for last entry
        }
        json.append("]");
        return json.toString();
    }
}
