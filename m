Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328DB3D69
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736133039; cv=none; b=VFK1AH5kDphTRmZvddC7gJbhATkq+YWT4ZBqyN1INkHcANBOZBrnSCg5QBfjn6MRIJvfLmVgM0G/iG6z4XPZwaFtX+exOritHqB6USzUB/3vc47Ac6AEDKVxPM3fUgROsFMyz1i8OI3x+3aL0P/Sr9rBR+5jZhZwNl/QMhHXp6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736133039; c=relaxed/simple;
	bh=uMwiGW25SdRWJhj4ehRdpjLV7NBRoY3wnD27gYdoU0w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GV3lKIV8kzJBk+qa8TFkNCE15moxlQcX4fBXvtkxom5hV17NUI/NpEcMkvPJq/fK4OtBR/PiRmnSrgp3ylxndsdc2b4emPq6nllT7Q6JmYMgcSslimi6M8i8sscSpzfvnWtC7kHKbkJ0jQ7820idZOQzjrxrNJegdrV8tb9c6R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=pC45ebtL; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="pC45ebtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1736133014;
	bh=yPXvBYonm/yMe7TMPPsocFggbYn/o7k/zEcN+aprUB0=;
	h=Mime-Version:Subject:From:Date:Message-Id:To;
	b=pC45ebtLr5Cz2ROIe5+1uhHnKPhfklhQZdW4XBI2FkTHV3C0P42IKr1b1+JNsQ80n
	 Ut0Fub68vI879jRux1COyu7fFIwGYt4s9IjWsbD9ltO4XoNXGjf4mTQZcdB+NAKqX5
	 e1JiY8ms8n8PiLhh0WndxsNcJ44ExioPLQ+q3beA=
X-QQ-mid: bizesmtpip3t1736133013tc67cm8
X-QQ-Originating-IP: t+wZ4z16yOrVQbAuqF/DB4EvlcLG3xx2NDz+jWzpito=
Received: from smtpclient.apple ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Jan 2025 11:10:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17386682936731724726
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] ALSA: seq: oss: Send fragmented SysEx messages
 immediately
From: Kun Hu <huk23@m.fudan.edu.cn>
In-Reply-To: <EC84D88D-CC77-4FAA-9B86-7BBA0BAAF9BB@m.fudan.edu.cn>
Date: Mon, 6 Jan 2025 11:10:01 +0800
Cc: linux-sound@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <58DD9B80-CDE3-40B0-96D0-0BDA1F5D841B@m.fudan.edu.cn>
References: <20241231115523.15796-1-tiwai@suse.de>
 <EC84D88D-CC77-4FAA-9B86-7BBA0BAAF9BB@m.fudan.edu.cn>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N21t3Bf2hPbkDw1reK7m1lfjOSuuWjc8bHzgzRU8wMAmIk/3j+PkUUFo
	t4b0gTU50fAS4XXROnuuS7sRvk8SqAVn06OyJsDhrG/1HEi6aRjNWpfZOsNyKhVJp/A6kP+
	O89jL7rBOBOUwZBv9W9yhip+9nA3aD5n2YzXm57cw1KCll89q9ROMJ3z2mcyGxMb6Mm0+W/
	1J580NWGCc+Im1wnxo/DcNKsHPcVFfptOw3eHEYulJ355NoT/ekc7UkfeQoohblm9O258Y+
	bB0TE8lg6/kFz2P7GGuJTSJBDp6GFDeAn4qWu4YaRwzeMg9TThqgV9RWTPnd5O/jgnP24iV
	9tMjKvOvU/GleJM0+BMRsvjj2LmmuSALh8mKqjc0igNu9wQZphhu1ENhOHJtZN+aVPgmVZS
	cjOdNmwZmHvgHLRoZl/zFWKlj2UHU+mYIc3k/H9iPvwXZD24od9Lpli7Hp2Ckvpu3NZVWwr
	dj2IRufp9GBFhOzvE7C3mDQpFuacQ/DsUWxO/r1Gu79ptawxHySSKVaSiCH+VA73Z1E+Ufa
	COeB3b+Lc+xWWCCc3HrEstAw21HHlGP+EBpQ/J70qTgWdxIRWkgxQtBqBhzekpejK4Lx7Mq
	5lGKYuH81s3CjkJvJPdpouwRWmnpve42uF3YH9jTb8bi5fWL1j1eFNBMYXBshTetxg50XLf
	2aByiFsImFGs6ZW9beeCXkWiFwDN7LR0cYaBu6jVpfk6IiuqwUVHNC0+RqfzSZKJbqjhoQa
	WJVXYUHntzq+YJMIMSSb3VbWlnrayJW+oH6pRb7wphy2yI4OmmJ4I8vF4jkrfNHEuqm9P/X
	94jWqUcLTW6l6be/MY2YzQHpu/FSqmnesZyqdfkDn3gSgCHLtc++uakYqdhvlDOk+SIzQzf
	o5ck75iF614d5PZHhmbLVc1jjhPUHScBo2yheRzJcEw/ot34VO4N4AbqIgyy3Y4F18u684b
	n3e6wNwPMpibjit63ePbO+tnxZpqRcsCJUCfpa1crwPboAr+GF2UiT0ePMHkloslLMVWFtV
	bJefA07paHSwf5RIi763CincWzn4T9HpsaJQeopQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

>>=20
>=20
>=20
> Hi Takashi Iwai,
> I noticed that in your previous modifications, you seemed to have made =
lots of changes to the related structures, along with many updates to =
the snd_seq_oss_synth_sysex function. However, in the latest kernel =
tree, it seems that only a mutex lock has been added to this function.
> While this certainly resolves the issue, I=E2=80=99m personally =
curious to understand the reasoning behind this approach. Was there a =
specific consideration or constraint that led to this simplified =
solution?
>=20
> =E2=80=94=E2=80=94
> Thankx
> Kun hu
>=20

I see, you=E2=80=99re going to submit the patch to  6.14, but a =
temporary band-aid for 6.13.

=E2=80=94=E2=80=94
thanks
Kun Hu=
