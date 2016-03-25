package com.test;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * List对象排序的通用方法
 * 
 * @author chenchuang
 * 
 * @param <E>
 */
public class ListSort<E> {
	/**
	 * 
	 * @param list 要排序的集合
	 * @param method 要排序的实体的属性所对应的函数
	 * @param field 函数的参数
	 * @param sort desc 为正序  
	 */
	public void Sort(List<E> list, final String method, final String field, final String sort) {
		// 用内部类实现排序
		Collections.sort(list, new Comparator<E>() {

			public int compare(E a, E b) {
				int ret = 0;
				try {
					// 获取m1的方法名
					Method m1 = a.getClass().getMethod(method, String.class);
					// 获取m2的方法名
					Method m2 = b.getClass().getMethod(method, String.class);
					// 获取相关性数值
/*					//int方法 
					Integer i1 = Integer.parseInt(m1.invoke(a, field).toString());
					Integer i2 = Integer.parseInt(m2.invoke(b, field).toString());
					if (sort != null && "desc".equals(sort)) {

						ret = i2.compareTo(i1);

					} else {
						// 正序排序
						ret = i1.compareTo(i2);
					}*/
					
					//Double方法
					Double d1 = Double.parseDouble(m1.invoke(a, field).toString());
					Double d2 = Double.parseDouble(m2.invoke(b, field).toString());
					if (sort != null && "desc".equals(sort)) {

						ret = d2.compareTo(d1);

					} else {
						// 正序排序
						ret = d1.compareTo(d2);
					}
					
					
				} catch (NoSuchMethodException ne) {
					System.out.println(ne);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return ret;
			}
		});
	}
	
	
}

