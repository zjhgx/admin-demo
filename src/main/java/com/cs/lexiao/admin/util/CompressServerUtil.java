package com.cs.lexiao.admin.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

//import com.upg.xhh.banner.core.IAttachService;
//import com.cs.lexiao.admin.mapping.business.FiAttach;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jdom.Document;

/**
 * Created by 001244 on 15-3-6.
 * 从服务器上下载图片文件并打包
 */
public class CompressServerUtil {

    private static final Logger LOG			= Logger.getLogger(CompressServerUtil.class);

    private static final int	BUFFER_SIZE	= 1024;

    private static String			attachmentFilePath		= null;

    private static String			compressTempDir			= null;

    private static String[]        specialList = {"/","\\",":","?","*","\"",">","<","|"};


    static {
        init();
    }

    private static final void init() {
        try {
            Document doc = XmlUtil.parseXmlDoc("attachment-config.xml");
            attachmentFilePath = doc.getRootElement().getChild("filePath").getValue();
            compressTempDir = doc.getRootElement().getChild("temp").getValue();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }


    /**
     * 从服务器上打包下载附件
     * @param list 附件列表
     * @param labelList 附件标题名称
     * @return 附件下载到本地的名称
     */
//    public static String compressServerAttachment(List<FiAttach> list,List<String> labelList){
//        String result = compressTempDir + System.currentTimeMillis()+".zip";
//        List<String> fileList = new ArrayList<String>();
//        List<String> nameList = new ArrayList<String>();
//        List<String> serverNameList = new ArrayList<String>();
//        int i=0;
//        if(list != null && !list.isEmpty()){
//            for(FiAttach attachment : list){
//                String fileName =  getFullFilePath(attachment.getSaveapppath(),attachment.getSavename());
//                String serverName = "http://"+attachment.getImgserver()+attachment.getSaveapppath()+attachment.getSavename();
//                fileList.add(fileName);
//                serverNameList.add(serverName);
//                String label = labelList.get(i);
//                nameList.add(label+"_"+attachment.getSavename());
//                i++;
//            }
//        }
//        CompressServerUtil.compress(fileList, nameList,serverNameList, result);
//        return result;
//    }





    /**
     *
     *
     * @param sources
     *            需要打包的文件列表
     * @param names
     *            打包的文件列表新名
     * @param serverNameList
     *            文件在服务器的地址
     * @param dest
     *            打包文件存放地址
     *
     * @return
     */
    public static final String compress(List<String> sources, List<String> names,List<String> serverNameList, String dest) {
        String result = null;
        String destName = dest;
        File destFile = new File(destName);
        ZipOutputStream zos = null;
        try {
            zos = new ZipOutputStream(new FileOutputStream(destFile));
            int i = 0;
            for (String source : sources) {
                try{
                    File sourcePath = new File(source.substring(0,source.lastIndexOf(File.separator)));
                    if(!sourcePath.exists()){
                        sourcePath.mkdirs();
                    }
                    String name = names.get(i);
                    for(String special : specialList){
                        if(name.contains(special)){
                            name = name.replaceAll(special,"_");
                        }
                    }
                    File sourceFile = new File(sourcePath,name);
                    if(!sourceFile.exists()){
                        sourceFile.createNewFile();
                    }
                    FileInputStream fis = null;
                    try {
                        ZipEntry ze = new ZipEntry(name);
                        zos.putNextEntry(ze);
                        String serverPath = serverNameList.get(i);
                        sourceFile = saveImageToLocalDesk(sourceFile,serverPath);

                        fis = new FileInputStream(sourceFile);
                        int len = 0;
                        byte[] buf = new byte[BUFFER_SIZE];
                        while ((len = fis.read(buf)) > 0) {
                            zos.write(buf, 0, len);
                        }
                        zos.closeEntry();
                    } finally {
                        if (fis != null) {
                            fis.close();
                        }
                    }
                }catch (Exception ex){
                    ex.printStackTrace();
                }
                i++;
            }

        } catch (Exception ex) {
//            ex.printStackTrace();
//            LOG.error(ex.getMessage(), ex);
        } finally {
            if (zos != null) {
                try {
                    zos.close();
                } catch (Exception ex) {
                    LOG.error(ex.getMessage(),ex);
                }
            }
        }
        return result;
    }


    private static File saveImageToLocalDesk(File sourceFile,String serverPath){
        InputStream inputStream = getInputStream(serverPath);
        byte[] data = new byte[2048];
        int len = 0;
        FileOutputStream outputStream = null;
        try{
            outputStream = new FileOutputStream(sourceFile);
            while((len = inputStream.read(data)) != -1){
                outputStream.write(data,0,len);
            }
        }catch (FileNotFoundException ex){
            ex.printStackTrace();
        }catch (IOException ex){
            ex.printStackTrace();
        }finally {
            if(inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return sourceFile;
    }



    public static InputStream getInputStream(String serverPath){
        InputStream inputStream = null;
        HttpURLConnection urlConnection = null;
        try{
            URL url = new URL(serverPath);
            urlConnection = (HttpURLConnection)url.openConnection();
            urlConnection.setConnectTimeout(30000);
            urlConnection.setDoInput(true);
            urlConnection.setRequestMethod("GET");
            int responseCode = urlConnection.getResponseCode();
            if(responseCode == 200){
                inputStream = urlConnection.getInputStream();
            }
        }catch (MalformedURLException ex){
            ex.printStackTrace();
        }catch (IOException ex){
            ex.printStackTrace();
        }

        return inputStream;
    }


    public static String getFullFilePath(String filePath, String fileName) {
        String ret = attachmentFilePath;
        if (StringUtils.isNotBlank(filePath)) {
            ret += File.separator + filePath;
        }
        if (StringUtils.isNotBlank(fileName)) {
            ret += File.separator + fileName;
        }
        return ret;
    }
}
