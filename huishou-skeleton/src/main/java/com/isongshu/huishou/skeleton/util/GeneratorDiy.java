package com.isongshu.huishou.skeleton.util;

import java.util.List;

import javax.sql.DataSource;

import com.jfinal.plugin.activerecord.dialect.Dialect;
import com.jfinal.plugin.activerecord.generator.BaseModelGenerator;
import com.jfinal.plugin.activerecord.generator.DataDictionaryGenerator;
import com.jfinal.plugin.activerecord.generator.MappingKitGenerator;
import com.jfinal.plugin.activerecord.generator.MetaBuilder;
import com.jfinal.plugin.activerecord.generator.ModelGenerator;
import com.jfinal.plugin.activerecord.generator.TableMeta;
import com.jfinal.plugin.activerecord.generator.TypeMapping;

public class GeneratorDiy {
	protected MetaBuilder metaBuilder;
	protected BaseModelGeneratorDiy baseModelGeneratorDiy;
	protected ModelGenerator modelGenerator;
	protected MappingKitGenerator mappingKitGenerator;
	protected DataDictionaryGenerator dataDictionaryGenerator;
	protected boolean generateDataDictionary = false;
	
	/**
	 * 构造 Generator，生成 BaseModel、Model、MappingKit 三类文件，其中 MappingKit 输出目录与包名与 Model相同
	 * @param dataSource 数据 源
	 * @param baseModelPackageName base model 包名
	 * @param baseModelOutputDir base mode 输出目录
	 * @param modelPackageName model 包名
	 * @param modelOutputDir model 输出目录
	 */
	public GeneratorDiy(DataSource dataSource, String baseModelPackageName, String baseModelOutputDir, String modelPackageName, String modelOutputDir) {
		
		this.metaBuilder = new MetaBuilder(dataSource);
		this.baseModelGeneratorDiy = new BaseModelGeneratorDiy(baseModelPackageName, baseModelOutputDir);
		this.modelGenerator = new ModelGenerator(modelPackageName, baseModelPackageName, modelOutputDir);
		this.mappingKitGenerator = new MappingKitGenerator(modelPackageName, modelOutputDir);
		this.dataDictionaryGenerator = new DataDictionaryGenerator(dataSource, modelOutputDir);
		
	}
	
	/**
	 * 构造 Generator，只生成 baseModel
	 * @param dataSource 数据源
	 * @param baseModelPackageName base model 包名
	 * @param baseModelOutputDir base mode 输出目录
	 */
	public GeneratorDiy(DataSource dataSource, String baseModelPackageName, String baseModelOutputDir) {
		this(dataSource, new BaseModelGenerator(baseModelPackageName, baseModelOutputDir));
	}
	
	public GeneratorDiy(DataSource dataSource, BaseModelGenerator baseModelGenerator) {
		if (dataSource == null) {
			throw new IllegalArgumentException("dataSource can not be null.");
		}
		if (baseModelGenerator == null) {
			throw new IllegalArgumentException("baseModelGenerator can not be null.");
		}
		
		this.metaBuilder = new MetaBuilder(dataSource);
		this.baseModelGeneratorDiy = baseModelGeneratorDiy;
		this.modelGenerator = null;
		this.mappingKitGenerator = null;
		this.dataDictionaryGenerator = null;
	}
	
	/**
	 * 使用指定 BaseModelGenerator、ModelGenerator 构造 Generator 
	 * 生成 BaseModel、Model、MappingKit 三类文件，其中 MappingKit 输出目录与包名与 Model相同
	 */
	public GeneratorDiy(DataSource dataSource, BaseModelGenerator baseModelGenerator, ModelGenerator modelGenerator) {
		
	}
	
	/**
	 * 设置 MetaBuilder，便于扩展自定义 MetaBuilder
	 */
	public void setMetaBuilder(MetaBuilder metaBuilder) {
		if (metaBuilder != null) {
			this.metaBuilder = metaBuilder;
		}
	}
	
	public void setTypeMapping(TypeMapping typeMapping) {
		this.metaBuilder.setTypeMapping(typeMapping);
	}
	
	/**
	 * 设置 MappingKitGenerator，便于扩展自定义 MappingKitGenerator
	 */
	public void setMappingKitGenerator(MappingKitGenerator mappingKitGenerator) {
		if (mappingKitGenerator != null) {
			this.mappingKitGenerator = mappingKitGenerator;
		}
	}
	
	/**
	 * 设置 DataDictionaryGenerator，便于扩展自定义 DataDictionaryGenerator
	 */
	public void setDataDictionaryGenerator(DataDictionaryGenerator dataDictionaryGenerator) {
		if (dataDictionaryGenerator != null) {
			this.dataDictionaryGenerator = dataDictionaryGenerator;
		}
	}
	
	/**
	 * 设置数据库方言，默认为 MysqlDialect
	 */
	public void setDialect(Dialect dialect) {
		metaBuilder.setDialect(dialect);
	}
	
	/**
	 * 设置需要被移除的表名前缀，仅用于生成 modelName 与  baseModelName
	 * 例如表名  "osc_account"，移除前缀 "osc_" 后变为 "account"
	 */
	public void setRemovedTableNamePrefixes(String... removedTableNamePrefixes) {
		metaBuilder.setRemovedTableNamePrefixes(removedTableNamePrefixes);
	}
	
	/**
	 * 添加不需要处理的数据表
	 */
	public void addExcludedTable(String... excludedTables) {
		metaBuilder.addExcludedTable(excludedTables);
	}
	
	/**
	 * 设置是否在 Model 中生成 dao 对象，默认生成
	 */
	public void setGenerateDaoInModel(boolean generateDaoInModel) {
		if (modelGenerator != null) {
			modelGenerator.setGenerateDaoInModel(generateDaoInModel);
		}
	}
	
	/**
	 * 设置是否生成数据字典 Dictionary 文件，默认不生成
	 */
	public void setGenerateDataDictionary(boolean generateDataDictionary) {
		this.generateDataDictionary = generateDataDictionary;
	}
	
	/**
	 * 设置 MappingKit 文件输出目录，默认与 modelOutputDir 相同，
	 * 在设置此变量的同时需要设置 mappingKitPackageName
	 */
	public void setMappingKitOutputDir(String mappingKitOutputDir) {
		if (this.mappingKitGenerator != null) {
			this.mappingKitGenerator.setMappingKitOutputDir(mappingKitOutputDir);
		}
	}
	
	/**
	 * 设置 MappingKit 文件包名，默认与 modelPackageName 相同，
	 * 在设置此变的同时需要设置 mappingKitOutputDir
	 */
	public void setMappingKitPackageName(String mappingKitPackageName) {
		if (this.mappingKitGenerator != null) {
			this.mappingKitGenerator.setMappingKitPackageName(mappingKitPackageName);
		}
	}
	
	/**
	 * 设置数据字典 DataDictionary 文件输出目录，默认与 modelOutputDir 相同
	 */
	public void setDataDictionaryOutputDir(String dataDictionaryOutputDir) {
		if (this.dataDictionaryGenerator != null) {
			this.dataDictionaryGenerator.setDataDictionaryOutputDir(dataDictionaryOutputDir);
		}
	}
	
	/**
	 * 设置数据字典 DataDictionary 文件输出目录，默认值为 "_DataDictionary.txt"
	 */
	public void setDataDictionaryFileName(String dataDictionaryFileName) {
		if (dataDictionaryGenerator != null) {
			dataDictionaryGenerator.setDataDictionaryFileName(dataDictionaryFileName);
		}
	}
	
	public void generate() {
		long start = System.currentTimeMillis();
		List<TableMeta> tableMetas = metaBuilder.build();
		if (tableMetas.size() == 0) {
			System.out.println("TableMeta 数量为 0，不生成任何文件");
			return ;
		}
		
		baseModelGeneratorDiy.generate(tableMetas);
		
		if (modelGenerator != null) {
			modelGenerator.generate(tableMetas);
		}
		
		if (mappingKitGenerator != null) {
			mappingKitGenerator.generate(tableMetas);
		}
		
		if (dataDictionaryGenerator != null && generateDataDictionary) {
			dataDictionaryGenerator.generate(tableMetas);
		}
		
		long usedTime = (System.currentTimeMillis() - start) / 1000;
		System.out.println("Generate complete in " + usedTime + " seconds.");
	}
}
