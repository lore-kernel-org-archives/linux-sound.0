Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB67C2119;
	Wed,  1 Jan 2025 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735714496; cv=none; b=EjJp9vlCjBfYm339cKolrd149QwicvZnqkWtoqEfaLS4KtDi8cGV4iF3+Pd1zln6HVrvsJyJj9GM2JKcjh7kA5w6D+w+1KRaSS5NUMzY73l7BEabzjANMx9zE9jPJcf3frda9g5pnmWdpeqD2xIq/OZAB05GQiJOtmxhDyRJpug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735714496; c=relaxed/simple;
	bh=bcVwZ4lyTYH9LEfatK98+NLjU4Gld9ukJzt847JxRw4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QyaDe/GW98/JqHAH3UEB2DJAhuVgw3j4aGhT5hOwhUZ3qc1YumrxZ1jrITpqTC0PmesjLtT7ricAegFkNGpdCCD4cya4n78CA287fVXbO0ksDNsbk6UoaDBlfZyr+Aub1mc5JcoLnR2qV6vbETKtCzACY7dNdvr8vsrGWQHz/ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=heZMCFYy; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="heZMCFYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1735714453;
	bh=bcVwZ4lyTYH9LEfatK98+NLjU4Gld9ukJzt847JxRw4=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=heZMCFYyo3Zjsg0uNXHnIDv+he32o78OxX6skGzBFfY6m0dlbw1Ze7zj4GZ/qoHpe
	 xM9PkiteMTdqvnlsYCPGgjqOhgk9E8ewMys89kIRfQg8psV+XCgDCeGmCqiIpV4avL
	 ex8hzuz3faa+IWwSh/6g53Ov3kFjRpprIoEHrYbU=
X-QQ-mid: bizesmtpip2t1735714452tx84g1u
X-QQ-Originating-IP: 7LW+NU+ROM2JO/KR3ZTROPb3Kg9CixiRd38fSZsG7Eg=
Received: from smtpclient.apple ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 01 Jan 2025 14:54:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3850021753389288900
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: Bug: slab-out-of-bounds in snd_seq_oss_synth_sysex
From: Kun Hu <huk23@m.fudan.edu.cn>
In-Reply-To: <182E26F6-E0BC-44D3-A0E7-124C81B7F8EB@m.fudan.edu.cn>
Date: Wed, 1 Jan 2025 14:54:00 +0800
Cc: perex@perex.cz,
 tiwai@suse.com,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "jjtan24@m.fudan.edu.cn" <jjtan24@m.fudan.edu.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <110026C0-18DC-486F-8A6F-B4FDB1B8872D@m.fudan.edu.cn>
References: <2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn>
 <B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
 <87ed1qydgi.wl-tiwai@suse.de>
 <3326E7C2-1E4F-4F57-AAB5-065C20854F31@m.fudan.edu.cn>
 <87pll9wi4x.wl-tiwai@suse.de>
 <182E26F6-E0BC-44D3-A0E7-124C81B7F8EB@m.fudan.edu.cn>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OAVDFi9GVPS7goFS8JwYBwaAZHWay7gfgedsdR2fvclVAM4NHr6bsqFD
	tR+MlJBndnqWhOnCuSBzwsUIHAPnJ/g+6My3gS7fHavWyEIwDmlLiDrmdnJPE0l8XWkwqrD
	b1drqJ6e4Fn8xYECchQx1Q7Pz0PXaiSllbskeJN4P0UtOM8A7FPAHXIFey0dxCBwF57/cxZ
	3eVe4r4k41/gMtbTj9yCgKUl67hDodcm2fwFY3/JncyWFU6ozdR4DM3Bati+7izTmBSu7kz
	pM49q0972mjQxInKCQDeOyKw+AmMXeP+UJ5eXqZm5I5Q7/jnfDOWGeStfhbshyjHdAe+rmB
	lUxvnuC/5dc4m7SPZacV9r1LCgjkjclAZ1zYCVQB7xG9m0MDSPbii4oxTRgq3WvRkVU3KK2
	dsRVb3sTaRK/cBn+IRK0VQ4II/73i7mWWfonuwnWetd28WwYreRy6stOIZuzuqOKrjjCJmr
	FWC8D+bGPzKji9X+B4ZT8YG6iGw5uLKUAXc2dxzD91t3LFlNK4PolJ2BzR5QELA3ybZuFjQ
	nc3oMsO+5zZ4PPkP0fLnTBGhbhCSC+s2IpJSdEQQH1gMlyCiKzC+yjpOT9muhox5sNwtWXe
	iqM+5s8N4EDpAgTCpy7nVVcBInq8AA8Wj4C/tkYhpQa5J0/lR5UGElotJdGUOpChhcAgWmR
	HnvVtErn9ySDakic98biZiHHMI3mE7rqrofWvKVY6EuQ9pHq3lXSYRPMHC8vZgof5I1fAsi
	LeF0A8fPGzHwFHdbv/iZDD3o5SFv2bHab8iShdZRiHeatqbwA753c4d2CRvqr9rn2flIFw+
	499pYmBDvAF33HxvCptxeiFZAWpyUFLLuSZN0i9sDK5oG8z6zRRhQNEROr5ZASs5Uq11nwu
	hzW7P0NVQlIGZfCJ/z/2ETz3GMBD9l6EOXY78TUQF11Xh7BpYi+vXxne0kSEnWSnDqVQZOM
	0kaeiNF8pqDyltMjv3pVEO/0Yhq+K6QcZ4eo=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0


>=20
> Hi,
>=20
> Regarding your changes, I=E2=80=99ve conducted multiple rounds of race =
condition testing using the same method. The original issue, caused by =
competition for shared resources, could consistently reproduce an =
out-of-bounds error in just a few attempts. The temporary band-aid fix =
and the latest changes have been tested at least 10,000 times, and no =
issues have occurred so far.
>=20
> =E2=80=94=E2=80=94
> Thanks,
> Kun Hu


Okay, Thanks for your help.

=E2=80=94=E2=80=94
Best regards,
Kun Hu=
