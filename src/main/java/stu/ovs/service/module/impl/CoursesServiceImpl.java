package stu.ovs.service.module.impl;

import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import stu.ovs.dao.entity.Courses;
import stu.ovs.dao.persistence.CoursesDao;
import stu.ovs.service.module.ContentsService;
import stu.ovs.service.module.CoursesService;
import stu.ovs.service.module.VideoProcessService;

import java.util.*;

/**
 * Created by Alcott Hawk on 4/2/2017.
 */
@Service
@Transactional
public class CoursesServiceImpl implements CoursesService {

	private static Logger logger = LoggerFactory.getLogger(VideoProcessService.class);

    public static String PATH = "/file/";

	@Autowired
	private VideoProcessService videoProcessService;

	@Autowired
	private ContentsService contentsService;

	@Autowired
	private CoursesDao coursesDao;

	/**
	 * 根据课程ID查找某个课程
	 */
	public Courses findOne(Object id) {
		Courses courses = coursesDao.findById(id);
		if (null != courses) {
			return courses;
		}
		return new Courses();
	}

	public List<Courses> findAll() {
		return coursesDao.findAll();
	}

	public void delete(Courses id) {

	}

	public void update(Courses courses) {
		coursesDao.update(courses);
	}

	public void add(Courses courses) {
        coursesDao.save(courses);
        courses.getId();
        Map arg = new HashMap();
        arg.put("coursesId", courses.getId());
        arg.put("contentsId", courses.getContentsId());
        coursesDao.addCoursesIndex(arg);
	}

	@Override
	public List<Courses> findByCategoryId(Integer id) {
		if (null != id) {
			return coursesDao.findByCategory(id);
		}
		return new ArrayList<>();
	}

	@Override
	public Courses findCourses(Integer id) {
		if (null != id) {
			Courses courses = (Courses) coursesDao.findByContents(id);
			if (null != courses) {
				return courses;
			} else {
				return new Courses();
			}
		}
		return new Courses();
	}

    @Override
    public List<Courses> search(Courses courses, String order, String sort, Integer size) {
	    if (null == courses){
	        return coursesDao.findAll();
        }else {
            if (StringUtils.isBlank(sort)){
                sort = "DESC";
            }
            if (null == size){
                size = 10;
            }
            PageHelper.startPage(1,size);
            List<Courses> list = coursesDao.filter(courses);
            Collections.sort(list, new Comparator<Courses>() {
                @Override
                public int compare(Courses o1, Courses o2) {
                    return (int) (o1.getCreateDate().getTime() - o2.getCreateDate().getTime());
                }
            });
            if (null != list && list.size() > 0){
                return list;
            } else {
                return new ArrayList<>();
            }
        }
    }

    @Override
    public void add(Courses courses, String rootPath, String subDir, MultipartFile file) {
        try {
            videoProcessService.makeScreenCut(rootPath + subDir + file.getOriginalFilename(), videoProcessService.SCREN_SIZE, videoProcessService.CUT_TIME);
            courses.setImg(subDir + file.getOriginalFilename() + ".jpg");
            courses.setDir(subDir + file.getOriginalFilename());
            courses.setName(file.getOriginalFilename());
            add(courses);
        } catch (Exception e) {
            logger.error("生成截图失败："+e.getMessage());
        }
    }
}
