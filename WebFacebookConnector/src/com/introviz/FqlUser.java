package com.introviz;

import com.restfb.Facebook;

public class FqlUser {

	  @Facebook
	  String members;
	  
	  @Facebook
	  String description;

	  @Override
	  public String toString() {
	    return String.format("%s (%s)", members,description);
	  }
}
