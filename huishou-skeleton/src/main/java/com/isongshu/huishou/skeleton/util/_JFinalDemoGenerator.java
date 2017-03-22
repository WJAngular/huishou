package com.isongshu.huishou.skeleton.util;

import javax.sql.DataSource;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.c3p0.C3p0Plugin;

/**
 * 在数据库表有任何变动时，运行一下 main 方法，极速响应变化进行代码重构
 */
public class _JFinalDemoGenerator {
	
	public static DataSource getDataSource() {
		C3p0Plugin c3p0Plugin = createC3p0Plugin();
		c3p0Plugin.start();
		return c3p0Plugin.getDataSource();
	}
	
	public static C3p0Plugin createC3p0Plugin() {
		return new C3p0Plugin("jdbc:mysql://www.anthuishou.com/huishou?characterEncoding=GBK&zeroDateTimeBehavior=convertToNull", 
							  "huishou", 
							  "ANThuishou123".trim());
	}
	
	public static void main(String[] args) {
		// base model 所使用的包名
		String baseModelPackageName = "com.isongshu.huishou.skeleton.model.base";
		// base model 文件保存路径
		String baseModelOutputDir = PathKit.getWebRootPath() + "/src/main/java/com/isongshu/huishou/skeleton/model/base";
		System.out.println(baseModelOutputDir);
		// model 所使用的包名 (MappingKit 默认使用的包名)
		String modelPackageName = "com.isongshu.huishou.skeleton.model";
		// model 文件保存路径 (MappingKit 与 DataDictionary 文件默认保存路径)
		String modelOutputDir = baseModelOutputDir + "/..";
		
		// 创建生成器 
		// 新添加GET属性可以返回字段名称
		GeneratorDiy gernerator = new GeneratorDiy(getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
		
		// 添加不需要生成的表名
		gernerator.addExcludedTable("adv");
		// 设置是否在 Model 中生成 dao 对象
		gernerator.setGenerateDaoInModel(true);
		// 设置是否生成字典文件
		gernerator.setGenerateDataDictionary(true);
		// 设置需要被移除的表名前缀用于生成modelName。例如表名 "osc_user"，移除前缀 "osc_"后生成的model名为 "User"而非 OscUser
		gernerator.setRemovedTableNamePrefixes("tb_");
		// 生成
		gernerator.generate();
	}
}




