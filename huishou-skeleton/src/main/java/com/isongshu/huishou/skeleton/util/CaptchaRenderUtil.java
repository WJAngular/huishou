package com.isongshu.huishou.skeleton.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import com.jfinal.core.Controller;
import com.jfinal.render.Render;

public class CaptchaRenderUtil extends Render {
	
	private static final long serialVersionUID = -916701543933591834L;
	private static final int WIDTH = 65, HEIGHT = 20;
	private static final String[] strArr = {"3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"};
	
	private String randomCodeKey;
	
	public CaptchaRenderUtil(String randomCodeKey) {
		if (randomCodeKey == null || randomCodeKey.equals(""))
			throw new IllegalArgumentException("randomCodeKey can not be blank");
		this.randomCodeKey = randomCodeKey;
	}
	
	public void render() {
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		String vCode = drawGraphic(image);
		vCode = encrypt(vCode);
		Cookie cookie = new Cookie(randomCodeKey, vCode);
		cookie.setMaxAge(-1);
		cookie.setPath("/");
		response.addCookie(cookie);
		response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        
        ServletOutputStream sos = null;
        try {
			sos = response.getOutputStream();
			ImageIO.write(image, "jpeg",sos);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		finally {
			if (sos != null)
				try {sos.close();} catch (IOException e) {e.printStackTrace();}
		}
	}

	private String drawGraphic(BufferedImage image){
		// 鑾峰彇鍥惧舰涓婁笅鏂�
		Graphics g = image.createGraphics();
		// 鐢熸垚闅忔満绫�
		Random random = new Random();
		// 璁惧畾鑳屾櫙鑹�
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		// 璁惧畾瀛椾綋
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));

		// 闅忔満浜х敓155鏉″共鎵扮嚎锛屼娇鍥捐薄涓殑璁よ瘉鐮佷笉鏄撹鍏跺畠绋嬪簭鎺㈡祴鍒�
		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(WIDTH);
			int y = random.nextInt(HEIGHT);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}

		// 鍙栭殢鏈轰骇鐢熺殑璁よ瘉鐮�6浣嶆暟瀛�
		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(strArr[random.nextInt(strArr.length)]);
			sRand += rand;
			// 灏嗚璇佺爜鏄剧ず鍒板浘璞′腑
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			// 璋冪敤鍑芥暟鍑烘潵鐨勯鑹茬浉鍚岋紝鍙兘鏄洜涓虹瀛愬お鎺ヨ繎锛屾墍浠ュ彧鑳界洿鎺ョ敓鎴�
			g.drawString(rand, 13 * i + 4, 16);
		}

		// 鍥捐薄鐢熸晥
		g.dispose();
		
		return sRand;
	}
	
	/*
	 * 缁欏畾鑼冨洿鑾峰緱闅忔満棰滆壊
	 */
	private Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
	
	private static final String encrypt(String srcStr) {
		try {
			String result = "";
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytes = md.digest(srcStr.getBytes("utf-8"));
			for(byte b:bytes){
				String hex = Integer.toHexString(b&0xFF).toUpperCase();
				result += ((hex.length() ==1 ) ? "0" : "") + hex;
			}
			return result;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
//	public static boolean validate(String inputRandomCode, String rightRandomCode){
//		if (StringKit.isBlank(inputRandomCode))
//			return false;
//		try {
//			inputRandomCode = encrypt(inputRandomCode);
//			return inputRandomCode.equals(rightRandomCode);
//		}catch(Exception e){
//			e.printStackTrace();
//			return false;
//		}
//	}
	
	// TODO 闇�鏀硅繘
	public static boolean validate(Controller controller, String inputRandomCode, String randomCodeKey) {
		if (inputRandomCode == null || inputRandomCode.equals(""))
			return false;
		try {
			inputRandomCode = encrypt(inputRandomCode);
			return inputRandomCode.equals(controller.getCookie(randomCodeKey));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}



