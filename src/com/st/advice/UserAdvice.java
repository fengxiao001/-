package com.st.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
//@Component
@Aspect
public class UserAdvice {
	//前置通知
	@Before("execution(* com.st.action.index(..))")
public void beforeIndex() {
	System.out.println("1---beforeindex");
}
	//后置通知
	@After("execution(* com.st.action.index(..))")
	public void afterIndex() {
		System.out.println("2---afterindex");
	}
	//返回通知
	@AfterReturning("execution(* com.st.action.index(..))")
	public void returnIndex() {
		System.out.println("3----返回通知");
	}
	//必须有一个异常
	//异常通知
	@AfterThrowing("execution(* com.st.action.index(..))")
	public void throwIndex() {
		System.out.println("4----抛出通知");
	}
	//环绕通知
	@Around("execution(* com.st.action.UserAction.test(..))")
	public void aroundTest(ProceedingJoinPoint pjp) {
		System.out.println("1------around before");
		//处理目标方法
		try {
			pjp.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("2---抛出异常");
		}
		System.out.println("3------around after-----");
	}
}
