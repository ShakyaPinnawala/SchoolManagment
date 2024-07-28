/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import static com.g7sims.chinthana.FileUploadUtils.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 20 // 20 MB
)
public class UpdateNoticeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Updating...</title>");
            out.println("<style> body {background-color: #2e59d9; color: #fff;}</style>");
            out.println("</head>");
            out.println("<body>");

            String id = request.getParameter("updatedNoticeID");
            String title = request.getParameter("updatedNoticeTitle");
            String content = request.getParameter("updatedNoticeContent");
            String group = request.getParameter("updatedNoticeGroup");
            String date = request.getParameter("updatedNoticeDate");
            String currentImage = request.getParameter("updatedNoticedCurrentImage");

            // New: Retrieve the uploaded file
            Part filePart = request.getPart("updatedNoticeImage");

            String imageName = "default.jpg";
            if (!(currentImage.equals(imageName))) {
                imageName = currentImage;
            }

            if (filePart.getSize() > 0) {
                try {
                    // Generate a random image name
                    imageName = generateRandomImageName(5) + ".jpg";
                    // Save the uploaded file
                    filePart.write(request.getServletContext().getRealPath("/Chinthana/noticeimages/") + imageName);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            Notice tempNotice = new Notice(Integer.decode(id), title, date, content, imageName, group);

            try {
                int rowsAffected = new NoticeDBUtil().updateNotice(tempNotice);

                if (rowsAffected > 0) {
                    // Data updated successfully
                    out.println("<script>window.alert('Data updated successfully!')</script>");
                } else {
                    out.println("<script>window.alert('Failed to update data.')</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Redirect to a success page or perform further actions
                response.sendRedirect("/G7SIMS/Chinthana/CheckUserType.jsp");
            }

            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
