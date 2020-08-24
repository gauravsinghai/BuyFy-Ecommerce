package com.buyfy.contrib.auth.hasher;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecureHashingAlgo{

	public static String generateHash(String input) {
		try {
			final String SHA512 = "SHA-512";
			MessageDigest md = MessageDigest.getInstance(SHA512);
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger no = new BigInteger(1, messageDigest);
			// Convert message digest into hex value 
			String hashtext = no.toString(16);
			
			while(hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		}
		catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		return null;
	}
}
