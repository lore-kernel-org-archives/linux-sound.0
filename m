Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383CB320A04
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155439; cv=none; b=ei0jFklunF3iZgKsSWIlCYzZNWBfeMvymIC+3eCFktzSqqSI/MEsT/DHlsBpzdwBHrSe6CxCMRLaAPR4shCUN+mXo+clMLmUvlECAmp8OAafQlzyUo01CnqSOP6tzJkbiWcvkff/jU/dW0CDvM5w8uN9dz7FRF5dItNiZLlwAEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155439; c=relaxed/simple;
	bh=1HDcMTuZ5VF6EoTj7FiJXw5OdgqVTgy2zS0AsGtUw4M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PwTmvv0VI07fbE84Vy2OVHE3V1otLXuNW7r6NeMSBeAqDXrII/inkHspOlWhAdTOZ36fbNMdUILpr66XxorIYwoFVcYzmDVJCxqGnZf9hkyJM2Ic3hORjzitPgitVJ2+SgN8Tl7AwPL5CaqmwUAbQowMRlF8Sv+W7kRfxiFFlDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ULp9oXF2; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ULp9oXF2"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60N83ZjV42800015, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1769155415; bh=jqdcHDlXAlW3NZ2WOWigrZOc3q3NmwsVmyq+BOftzGM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=ULp9oXF2YFAtdFpZbUzQaso8+6Jl7DhhqvmxK+N9KJ5FcTcsK6nvJJf5aDcfX8w1o
	 r8Wukmg2puW1ExdVDXiNrizn2UwT3d+Pi8ObwTQB38Cl4ZogTVbKyvx6sHbmWLa//1
	 oahrrrQ8PjFmVBSAmVHQiVGjWGimeXue2wxG+zfpuaBcejtwegfPKpAdUPLTe6PXk0
	 OMYbtspD/A5+b137tlCAw8Nhdqu1TkaQgOWXjLGeta73+3kOcOEHjedn/m6Vv2Mqbk
	 4uvTbiY2qppyLN+HIG6SCBffwR8nSO9P2xR/5f7VApxLaRL6BOD4Dg9rRMX1/AtTzj
	 lFPx7W7Ul6F4w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60N83ZjV42800015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 16:03:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 23 Jan 2026 16:03:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Fri, 23 Jan 2026 16:03:34 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Fixed speaker no sound for Lenovo
Thread-Topic: Fixed speaker no sound for Lenovo
Thread-Index: AdyMPnULa5+hspMuQMeLrxjYC8Qq+w==
Date: Fri, 23 Jan 2026 08:03:34 +0000
Message-ID: <f4929e137a7949238cc043d861a4d9f8@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_f4929e137a7949238cc043d861a4d9f8realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_f4929e137a7949238cc043d861a4d9f8realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch will solve speaker no sound issue.

BR,
Kailang

--_002_f4929e137a7949238cc043d861a4d9f8realtekcom_
Content-Type: application/octet-stream; name="0000-lenovo-tm2-amp.patch"
Content-Description: 0000-lenovo-tm2-amp.patch
Content-Disposition: attachment; filename="0000-lenovo-tm2-amp.patch";
	size=1711; creation-date="Fri, 23 Jan 2026 08:02:20 GMT";
	modification-date="Fri, 23 Jan 2026 08:00:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlMmZkZTEyYWJmNGE2NDkxMGMzOTZjOTQ0ODU0M2JjZjRkOTE2NjM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMjMgSmFuIDIwMjYgMTU6MjE6MzYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIGZpeGVkIHNwZWFrZXIgbm8gc291bmQKCklmIGl0IHBsYXkgYSA1cyBh
Ym92ZSBzaWxlbmNlIG1lZGlhIHN0cmVhbSwgaXQgd2lsbCBjYXVzZSBzaWxlbmNlIGRldGVjdGlv
biB0cmlnZ2VyLgpTcGVha2VyIHdpbGwgbWFrZSBubyBzb3VuZCB3aGVuIHlvdSB1c2UgYW5vdGhl
ciBhcHAgdG8gcGxheSBhIHN0cmVhbS4KQWRkIHRoaXMgcGF0Y2ggd2lsbCBzb2x2ZSB0aGlzIGlz
c3VlLgoKR1BJTzI6IE11dGUgSG90a2V5IEdQSU8zOiBNaWMgTXV0ZSBMRUQKRW5hYmxlIHRoaXMg
d2lsbCB0dXJuIG9uIGhvdGtleSBhbmQgTEVEIHN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBLYWls
YW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9oZGEvY29k
ZWNzL3JlYWx0ZWsvYWxjMjY5LmMgYi9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5LmMK
aW5kZXggN2NjODQ0YzMyNDc0Li45YWRkZDg2MmI5NDggMTAwNjQ0Ci0tLSBhL3NvdW5kL2hkYS9j
b2RlY3MvcmVhbHRlay9hbGMyNjkuYworKysgYi9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxj
MjY5LmMKQEAgLTM0NDYsMTEgKzM0NDYsMjIgQEAgc3RhdGljIHZvaWQgYWxjMjg3X2FsYzEzMThf
cGxheWJhY2tfcGNtX2hvb2soc3RydWN0IGhkYV9wY21fc3RyZWFtICpoaW5mbywKIAkJCQkgICBz
dHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKIAkJCQkgICBpbnQgYWN0aW9uKQog
eworCXN0YXRpYyBjb25zdCBzdHJ1Y3QgY29lZl9mdyBkaXNfY29lZnNbXSA9IHsKKwkJV1JJVEVf
Q09FRigweDI0LCAweDAwMTMpLCBXUklURV9DT0VGKDB4MjUsIDB4MDAwMCksIFdSSVRFX0NPRUYo
MHgyNiwgMHhDMjAzKSwKKwkJV1JJVEVfQ09FRigweDI4LCAweDAwMDQpLCBXUklURV9DT0VGKDB4
MjksIDB4YjAyMyksCisJfTsgLyogRGlzYWJsZSBBTVAgc2lsZW5jZSBkZXRlY3Rpb24gKi8KKwlz
dGF0aWMgY29uc3Qgc3RydWN0IGNvZWZfZncgZW5fY29lZnNbXSA9IHsKKwkJV1JJVEVfQ09FRigw
eDI0LCAweDAwMTMpLCBXUklURV9DT0VGKDB4MjUsIDB4MDAwMCksIFdSSVRFX0NPRUYoMHgyNiwg
MHhDMjAzKSwKKwkJV1JJVEVfQ09FRigweDI4LCAweDAwODQpLCBXUklURV9DT0VGKDB4MjksIDB4
YjAyMyksCisJfTsgLyogRW5hYmxlIEFNUCBzaWxlbmNlIGRldGVjdGlvbiAqLworCiAJc3dpdGNo
IChhY3Rpb24pIHsKIAljYXNlIEhEQV9HRU5fUENNX0FDVF9PUEVOOgorCQlhbGNfcHJvY2Vzc19j
b2VmX2Z3KGNvZGVjLCBkaXNfY29lZnMpOwogCQlhbGNfd3JpdGVfY29lZmV4X2lkeChjb2RlYywg
MHg1YSwgMHgwMCwgMHg5NTRmKTsgLyogd3JpdGUgZ3BpbzMgdG8gaGlnaCAqLwogCQlicmVhazsK
IAljYXNlIEhEQV9HRU5fUENNX0FDVF9DTE9TRToKKwkJYWxjX3Byb2Nlc3NfY29lZl9mdyhjb2Rl
YywgZW5fY29lZnMpOwogCQlhbGNfd3JpdGVfY29lZmV4X2lkeChjb2RlYywgMHg1YSwgMHgwMCwg
MHg1NTRmKTsgLyogd3JpdGUgZ3BpbzMgYXMgZGVmYXVsdCB2YWx1ZSAqLwogCQlicmVhazsKIAl9
Cg==

--_002_f4929e137a7949238cc043d861a4d9f8realtekcom_--
