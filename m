Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED93EFD2D
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978024; cv=none; b=r0Ignxe4j3vqcK7DVGgw1FDYpVcOpTI9VXyNtkRZ2B9LROxmAYWyaLD2yW22jdv7e2/vltW6eFcqj5+wuStufDV/gETfzL1GrHRBZdf4L+f2Qvso2QnIqSl6iXU8p/KhSz5gu8tzmX4RHiK/vrV0u70rjgB69+/JnY+LENP7IvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978024; c=relaxed/simple;
	bh=Y69RwffOn9KNZAZjPFQU1GSb4tAjui2olJi1vZA48rM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NXiZs4WZ76KKfCbhkP8+MbRbHVbyRHK1Gdx/uJlCHTPl70NaT8wdL/8cPuNbWeXM+FoJS5VsvmCohybuAgfm8LstsIz1Z6bAmbkVL5JDY8HqVPu5MPlV6TfyntU03qWqvGXIorm3rzTspdD6AidVUl3SKyTZ+1KnOd1nOxwqL6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=lXlnMOrM; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="lXlnMOrM"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68L86haeE2377552, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1789978003; bh=K6MtUsrmNqqOsl1rJ+tHIyc6VCM5E/r3UbgnmSfCbKs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=lXlnMOrMIQxfchgeNz97YAZdJlfGBK0Vc09RXcMSK4RrSWuLuneNKlBfNoaTHEYNY
	 19Q2KaiJc9WyyMXlHX82R/W2mv1TbM7hzB4ATVJR3HbNAJsEcTIg3xwUWM8cVwCGOQ
	 VG+nfL6dHYB+glntpvL1G6XdxdZTabcnSItMQmIQqlBMhYgfL4AxxNHyjgjMZu92pz
	 Z7kW9B6oO2pPE/5BE/ATCjRjKs54CvSbnvpwdM5bSyP9PXkGPpsMCL06Pve8ba6FlK
	 mi68n6QHrzt91r/QKASsZKDweGIT/WKG5zAIFcOU8sKm1/7+kD3MMIbe3zHoGHKGs/
	 7OUbL0WGxb4SA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68L86haeE2377552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Sep 2026 16:06:43 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 21 Sep 2026 16:06:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 21 Sep 2026 16:06:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Mon, 21 Sep 2026 16:06:43 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "
 (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Add headset mode
Thread-Topic: Add headset mode
Thread-Index: Ad1JnuWo01sb9K2iR927d1ldAIFgCw==
Date: Mon, 21 Sep 2026 08:06:42 +0000
Message-ID: <3c251e40a2944ae4ae479e4c2e4e63a4@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_3c251e40a2944ae4ae479e4c2e4e63a4realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_3c251e40a2944ae4ae479e4c2e4e63a4realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Prior patch will lose headset Mic function, and this patch will restore it.

BR,
Kailang

--_002_3c251e40a2944ae4ae479e4c2e4e63a4realtekcom_
Content-Type: application/octet-stream;
	name="0001-dell-QCDT-add-hsmode.patch"
Content-Description: 0001-dell-QCDT-add-hsmode.patch
Content-Disposition: attachment; filename="0001-dell-QCDT-add-hsmode.patch";
	size=963; creation-date="Mon, 21 Sep 2026 08:02:59 GMT";
	modification-date="Mon, 21 Sep 2026 07:55:17 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3MWQ5OGVmZDdkYzVkNGQ3ODlmZmQ2MzEwYTE5MjkwM2IzNGZiNTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTcgU2VwIDIwMjYgMTQ6NTM6MjYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBoZWFkc2V0IG1vZGUgZm9yIERlbGwgUHJvIFFDMTI1NQoKSXQg
bG9zdCBpdHMgaGVhZHNldCBtaWNyb3Bob25lIGZ1bmN0aW9uYWxpdHksIGFuZCB0aGlzIHBhdGNo
IHdpbGwgcmVzdG9yZSBpdC4KCkZpeGVzOiA5NzI3MmE1NzA0YmYgKCJBTFNBOiBoZGEvcmVhbHRl
ayAtIEZpeGVkIEhlYWRwaG9uZSBub2lzZSBpc3N1ZSBmb3IgRGVsbCBRQ00xMjU1IikKU2lnbmVk
LW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpkaWZmIC0tZ2l0IGEv
c291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jIGIvc291bmQvaGRhL2NvZGVjcy9yZWFs
dGVrL2FsYzI2OS5jCmluZGV4IDYxOGZmMjVlZmYxOC4uMzExY2Q1MmU4MmYxIDEwMDY0NAotLS0g
YS9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5LmMKKysrIGIvc291bmQvaGRhL2NvZGVj
cy9yZWFsdGVrL2FsYzI2OS5jCkBAIC03MTM0LDYgKzcxMzQsOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJW0FMQzIzNl9GSVhVUF9ERUxMX0hQ
X1BPUF9OT0lTRV0gPSB7CiAJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCiAJCS52LmZ1bmMgPSBh
bGMyODVfZml4dXBfaW52YWxpZGF0ZV9kYWNzLAorCQkuY2hhaW5lZCA9IHRydWUsCisJCS5jaGFp
bl9pZCA9IEFMQzI1NV9GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UKIAl9LAogCVtBTEMyNzRf
RklYVVBfSFBfODlFOV9HUElPXSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBfRlVOQywK

--_002_3c251e40a2944ae4ae479e4c2e4e63a4realtekcom_--
