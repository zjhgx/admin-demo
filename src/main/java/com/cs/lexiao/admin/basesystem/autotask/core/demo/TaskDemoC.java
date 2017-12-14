package com.cs.lexiao.admin.basesystem.autotask.core.demo;

import com.cs.lexiao.admin.basesystem.autotask.core.AbstractCommonAutoTask;
import com.cs.lexiao.admin.model.BooleanResult;

public class TaskDemoC extends AbstractCommonAutoTask {

	@Override
	public BooleanResult run() throws Exception {
		for (int i = 0; i < 20; i++) {
			System.err.print("任务C:");
			System.err.println(i);
			Thread.sleep(1000); 
		}
		
		return new BooleanResult(true);
	}

}
