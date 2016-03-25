package com.asir.config;

import com.asir.controller.AggregateController;
import com.asir.controller.AsirController;
import com.asir.controller.ContentController;
import com.asir.controller.FormController;
import com.asir.controller.IndexController;
import com.asir.controller.SmallController;
import com.asir.model.Asir;
import com.asir.model.Inf;
import com.asir.model.Sentence;
import com.asir.model.Small;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.test.TestController;

public class AsirConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		loadPropertyFile("a_little_config.txt");
		me.setDevMode(getPropertyToBoolean("devMode", true));
		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes me) {
		// TODO Auto-generated method stub
		me.add("/", IndexController.class);
		me.add("/asir", AsirController.class);
		me.add("/form", FormController.class);
		me.add("/123", AggregateController.class);
		me.add("/test", TestController.class);
		me.add("/small", SmallController.class);
		me.add("/content", ContentController.class);
	}

	public static C3p0Plugin createC3p0Plugin() {
		return new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin C3p0Plugin = createC3p0Plugin();
		me.add(C3p0Plugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(C3p0Plugin);
		me.add(arp);
		arp.setDevMode(true);
        arp.setShowSql(true);
        
        arp.addMapping("t_form", Asir.class);
        arp.addMapping("篇章元数据1002", Small.class);
        arp.addMapping("构成单元1002", Inf.class);
        arp.addMapping("功能单元1002", Sentence.class);
        
	}
//	
//	@Override
//	public void configPlugin(Plugins me) {
//		// TODO Auto-generated method stub
//		String User = getProperty("user");
//		String Password = getProperty("password");
//
//		DruidPlugin druid = new DruidPlugin(getProperty("jdbcUrl"), User, Password);
//		me.add(druid);
//		ActiveRecordPlugin arp = new ActiveRecordPlugin("situ", druid);
//		me.add(arp);
//		arp.setShowSql(true);
//		arp.addMapping("t_form", Asir.class);
//
//
//		DruidPlugin druid1 = new DruidPlugin(getProperty("jdbcUrl"), User, Password);
//		me.add(druid1);
//		ActiveRecordPlugin arp1 = new ActiveRecordPlugin("chapter", druid);
//		me.add(arp1);
//		arp1.setShowSql(true);
//		arp1.addMapping("篇章元数据1002", Small.class);
//
//		DruidPlugin druid3 = new DruidPlugin(getProperty("jdbcUrl"), User, Password);
//		me.add(druid3);
//		ActiveRecordPlugin arp3 = new ActiveRecordPlugin("inf1", druid);
//		me.add(arp3);
//		arp3.setShowSql(true);
//		arp3.addMapping("构成单元1002", Inf.class);
//
//		DruidPlugin druid4 = new DruidPlugin(getProperty("jdbcUrl"), User, Password);
//		me.add(druid4);
//		ActiveRecordPlugin arp4 = new ActiveRecordPlugin("sentence", druid);
//		me.add(arp4);
//		arp4.setShowSql(true);
//		arp4.addMapping("功能单元1002", Sentence.class);
////JUST FOR TEST
//		DruidPlugin druid5 = new DruidPlugin(getProperty("jdbcUrl"), User, Password);
//		me.add(druid5);
//		ActiveRecordPlugin arp5 = new ActiveRecordPlugin("test", druid);
//		me.add(arp5);
//		arp5.setShowSql(true);
//		arp5.addMapping("功能单元1002", Test.class);
//	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub

	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		me.add(new ContextPathHandler("contextPath"));
	}
	public static void main(String[] args) {
		JFinal.start("WebRoot", 8080, "/", 5);
	}
}
