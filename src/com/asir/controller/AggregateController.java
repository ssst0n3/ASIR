package com.asir.controller;

import com.jfinal.core.Controller;

public class AggregateController extends Controller {
	public void index(){
		render("/asir/aggregated.html");
	}
}
