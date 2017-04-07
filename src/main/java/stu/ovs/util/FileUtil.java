package stu.ovs.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by Alcott Hawk on 4/6/2017.
 */
public class FileUtil {

    public static boolean save(MultipartFile multipartFile, String filePath){
        File file = new File(filePath+multipartFile.getOriginalFilename());
        try {
            multipartFile.transferTo(file);
        } catch (IOException e) {
            return false;
        }
        return true;
    }

}
