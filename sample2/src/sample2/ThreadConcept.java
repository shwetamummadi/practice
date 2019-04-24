package sample2;

import java.util.ArrayList;
import java.util.Dictionary;
import java.util.Hashtable;
import java.util.List;
import java.util.Random;


	class MyTask implements Runnable {
		String name;
		Dictionary geek ;
		MyTask(String threadName){
			name=threadName;
		}
		public void run() {
		 try {
			  int sum =0;
				Random objGenerator = new Random();
			    for (int iCount = 0; iCount<4; iCount++){
			      int randomNumber = objGenerator.nextInt(10);
			      System.out.println(name+" Randomnumber :"+randomNumber);
			      sum = sum + randomNumber;
			      System.out.println(name+" Sum :"+sum);
			      geek = new Hashtable(); 
			      
			        // put() method 
			        geek.put(name, sum); 
			        
			      Thread.sleep(2000);
			    }
		}catch (InterruptedException e) {
		     System.out.println(name + "Interrupted");
		}
		     System.out.println(name + " exiting.");
		     System.out.println(geek);
		}
		}
	
	public class ThreadConcept {
		public static void main(String args[]) 
		{				
			
			ArrayList<Integer> list=new ArrayList<>();
			list.add(10);
			list.add(1,2);
			System.out.println(list + "  "+list.size());
			ArrayList<Integer> list1=(ArrayList<Integer>)list.clone();
			System.out.println(list1+ "  "+list.size());
			list1.add(5);
			list1.add(7);
			list1.addAll(1,list);
			System.out.println(list1+ "  "+list.size());
//			Runnable t1=new MyTask("Thread1");
//			Runnable t2=new MyTask("Thread2");
//			Runnable t3=new MyTask("Thread3");
//			
//			Thread t11=new Thread(t1);
//			Thread t12=new Thread(t2);
//			Thread t13=new Thread(t3);
//			
//			MyTask obj = new MyTask("Thread1");
//			
//		    t11.start();
//		    System.out.println(obj.geek);
//		    t12.start();
//		    System.out.println(obj.geek);
//		    t13.start();
//		    System.out.println(obj.geek);
//		try {
//		     Thread.sleep(10000);
//		} catch (InterruptedException e) {
//		      System.out.println("Main thread Interrupted");
//		}
//		System.out.println(obj.geek);
//	      	  System.out.println(t11.toString()+"\n"+t12.toString()+"\n"+t13.toString());
//		      System.out.println("Main thread exiting.");
			
		      }
		
		}


