/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import java.io.File;
import java.util.List;
import java.util.Random;

public class FileUploadUtils {

    // Generate random numbers for the image name
    public static String generateRandomImageName(int numOfChar) throws Exception {
        Random random = new Random();
        StringBuilder randomName = new StringBuilder();
        for (int i = 0; i < numOfChar; i++) {
            char randomChar = (char) ('0' + random.nextInt(10));
            randomName.append(randomChar);
        }
        return randomName.toString();
    }

    public static void cleaner(List<String> imageNames) throws Exception {
        String directoryPath = "/G7SIMS/Chinthana/noticeimages/";

        File directory = new File(directoryPath);

        if (directory.isDirectory()) {
            File[] files = directory.listFiles();

            if (files != null) {
                for (File file : files) {
                    if (file.isFile() && file.getName().endsWith(".jpg")) {
                        String imageName = file.getName();
                        if (!imageNames.contains(imageName)) {
                            boolean deleted = file.delete();
                            if (deleted) {
                                System.out.println("Deleted: " + imageName);
                            } else {
                                System.out.println("Failed to delete: " + imageName);
                            }
                        }
                    }
                }
            } else {
                System.out.println("Failed to list files in directory.");
            }
        } else {
            System.out.println("Invalid directory path.");
        }
    }
}
