package com.introviz;

import com.restfb.Facebook;

public class FqlUser {

	  @Facebook
	  String message;
	  
	  @Facebook
	  String post_id;

	  @Override
	  public String toString() {
	    return String.format("%s (%s)", message,post_id);
	  }
}
