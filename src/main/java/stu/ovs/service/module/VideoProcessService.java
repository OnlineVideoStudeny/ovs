package stu.ovs.service.module;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 * 影响处理类
 * Created by Alcott Hawk on 4/4/2017.
 */
public class VideoProcessService {

    private static Logger logger = LoggerFactory.getLogger(VideoProcessService.class);

    private String FFMPEG_PATH;

    public String SCREN_SIZE;

    public int CUT_TIME;

    public void setCUT_TIME(int CUT_TIME) {
        this.CUT_TIME = CUT_TIME;
    }

    public void setSCREN_SIZE(String SCREN_SIZE) {
        this.SCREN_SIZE = SCREN_SIZE;
    }

    public void setFFMPEG_PATH(String FFMPEG_PATH) {
        this.FFMPEG_PATH = FFMPEG_PATH;
    }

    private static void exec(List<String> Listcmd) throws Exception {
        try {
            ProcessBuilder builder = new ProcessBuilder();
            builder.command(Listcmd);
            builder.redirectErrorStream(true);
            Process proc = builder.start();
            BufferedReader stdout = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            proc.waitFor();
            stdout.close();
        } catch (Exception e) {
            throw e;
        }
    }

    public void makeScreenCut(String imageSavePath, String originFileUri, String screenSize,int cutTime) {
        List<String> cmd = new ArrayList<String>();
        cmd.clear();
        cmd.add(FFMPEG_PATH);
        cmd.add("-ss");
        cmd.add(""+cutTime);
        cmd.add("-i");
        cmd.add(originFileUri);
        cmd.add("-y");
        cmd.add("-f");
        cmd.add("image2");
        cmd.add("-t");
        cmd.add("0.1");
        cmd.add("-vframes");
        cmd.add("2");
        cmd.add("-r");
        cmd.add("1");
        cmd.add("-ac");
        cmd.add("1");
        cmd.add("-ab");
        cmd.add("2");
        cmd.add("-s");
        cmd.add(screenSize);
        cmd.add(imageSavePath);
        try {
            exec(cmd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
