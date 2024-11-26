Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86E93208
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 06:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732602539; cv=none; b=CAhvEknAqjXDdGHn/tsGDPm3aimK36Ljg4mK75qAzfSYCCo7H0nH85aY2xwBkogZRtDBrCjk6CbB2Ve6dV9wgmELuDKLjBBmxrBIBwaLF19QSLjdL0s7/cKbqOq3IivE54pVXsrnq2monNR2iHxLEMtjA9BTQmbFNfCXYpnCkpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732602539; c=relaxed/simple;
	bh=WQ1djCbSmgdQz5J+QHJI/63TGSfZ5Irw4/imoQJy/SY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y8Z+kU3QF+oMBQBIftg6SZrYKCojyaHGBRFbkiPXfZBrEgPTPjKfbhFZaaqH0CMMrq/Hs4tx7dyC8Pbc2coTQjr0QKLEOvrSAUMW1MuX0JCsotCXg3Yj8gL2UWHJdoGLXsuqlqnrVSyeBz3aQhquzxwtNry/mI4pIP+hVPt8h5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=uYog9soL; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="uYog9soL"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4AQ6SbyK6606260, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1732602517; bh=WQ1djCbSmgdQz5J+QHJI/63TGSfZ5Irw4/imoQJy/SY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=uYog9soLtU6GybJ9eIBtPq8qqr6Zl30Gh4GCjvVy/Elf8sgVygKzUREzLCAajd8Af
	 EG8+i/GgdOd1rxnynjedh7BAgNJrFbwNUSBGpZoF7XNaBvjRnCbdoGguwPwi1O7VsP
	 zjIepPQYF7GdnEO6gyR7TWVz5XHMfDUnVdivt3VoUHp77J8CQv5g1Fp8Te58+xipsD
	 z/mE6KCv90Orm5e38tiTVV/+qj+YYaytzY8POz+cHvf5r9LvSzg54HiM00aGbS/P+O
	 s+WeN/TrxdDzSEk/knTsaHh+6zXOt0TWBCarzkT6IQ+laUcl0jBe67qZkB0JHd54Zd
	 7jONwxRE3yt9A==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4AQ6SbyK6606260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Nov 2024 14:28:37 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 14:28:38 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Nov 2024 14:28:37 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Tue, 26 Nov 2024 14:28:37 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Enable speaker pins for Medion E15443 platform
Thread-Topic: Enable speaker pins for Medion E15443 platform
Thread-Index: Ads/zDkykRd/mxBOScOdKw+MmvNq/w==
Date: Tue, 26 Nov 2024 06:28:37 +0000
Message-ID: <eac4f3aca2ab45e59ccd207a90ee60e9@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_eac4f3aca2ab45e59ccd207a90ee60e9realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_eac4f3aca2ab45e59ccd207a90ee60e9realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach was fixed speaker no sound issue.

BR,
Kailang

--_002_eac4f3aca2ab45e59ccd207a90ee60e9realtekcom_
Content-Type: application/octet-stream; name="0000-medion-e15443-spk.patch"
Content-Description: 0000-medion-e15443-spk.patch
Content-Disposition: attachment; filename="0000-medion-e15443-spk.patch";
	size=1806; creation-date="Thu, 21 Nov 2024 06:43:24 GMT";
	modification-date="Tue, 26 Nov 2024 06:26:53 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmYjE2YWQ0Yzc2NTIzMWQ2MTBmNWYyNmExYTA1MmZhZGViY2MwYzJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjEgTm92IDIwMjQgMTY6MTA6NDIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogRW5hYmxlIHNwZWFrZXIgcGlucyBmb3IgTWVkaW9uIEUxNTQ0MyBwbGF0
Zm9ybQoKU3BlYWtlciBoYXMgbm8gc291bmQgZm9yIE1lZGlvbiBFMTU0NDMuCkFkZGVkIGFub3Ro
ZXIgc3BlYWtlciBwaW5zIGZvciBNZWRpb24gRTE1NDQzIHBsYXRmb3JtLgoKU2lnbmVkLW9mZi1i
eTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgpkaWZmIC0tZ2l0IGEvc291bmQv
cGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpp
bmRleCA1NmEzNjIyY2EyYzEuLjMwNWRmMzFiY2NiOCAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hk
YS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAg
LTc3ODIsNiArNzc4Miw3IEBAIGVudW0gewogCUFMQzI1Nl9GSVhVUF9DSFJPTUVfQk9PSywKIAlB
TEMyNDVfRklYVVBfQ0xFVk9fTk9JU1lfTUlDLAogCUFMQzI2OV9GSVhVUF9WQUlPX1ZKRkg1Ml9N
SUNfTk9fUFJFU0VOQ0UsCisJQUxDMjMzX0ZJWFVQX01FRElPTl9NVExfU1BLLAogfTsKIAogLyog
QSBzcGVjaWFsIGZpeHVwIGZvciBMZW5vdm8gQzk0MCBhbmQgWW9nYSBEdWV0IDc7CkBAIC0xMDA3
NCw2ICsxMDA3NSwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4
dXBzW10gPSB7CiAJCS5jaGFpbmVkID0gdHJ1ZSwKIAkJLmNoYWluX2lkID0gQUxDMjY5X0ZJWFVQ
X0xJTUlUX0lOVF9NSUNfQk9PU1QKIAl9LAorCVtBTEMyMzNfRklYVVBfTUVESU9OX01UTF9TUEtd
ID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9QSU5TLAorCQkudi5waW5zID0gKGNvbnN0IHN0cnVj
dCBoZGFfcGludGJsW10pIHsKKwkJCXsgMHgxYiwgMHg5MDE3MDExMCB9LAorCQkJeyB9CisJCX0s
CisJfSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX3F1aXJrIGFsYzI2OV9maXh1cF90
YmxbXSA9IHsKQEAgLTEwOTQ0LDYgKzEwOTUyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFf
cXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgyNzgyLCAweDAy
MjgsICJJbmZpbml4IFpFUk8gQk9PSyAxMyIsIEFMQzI2OVZCX0ZJWFVQX0lORklOSVhfWkVST19C
T09LXzEzKSwKIAlTTkRfUENJX1FVSVJLKDB4Mjc4MiwgMHgwMjMyLCAiQ0hVV0kgQ29yZUJvb2sg
WFBybyIsIEFMQzI2OVZCX0ZJWFVQX0NIVVdJX0NPUkVCT09LX1hQUk8pLAogCVNORF9QQ0lfUVVJ
UksoMHgyNzgyLCAweDE3MDcsICJWYWlvIFZKRkUtQURMIiwgQUxDMjk4X0ZJWFVQX1NQS19WT0xV
TUUpLAorCVNORF9QQ0lfUVVJUksoMHgyNzgyLCAweDQ5MDAsICJNRURJT04gRTE1NDQzIiwgQUxD
MjMzX0ZJWFVQX01FRElPTl9NVExfU1BLKSwKIAlTTkRfUENJX1FVSVJLKDB4ODA4NiwgMHgyMDc0
LCAiSW50ZWwgTlVDIDgiLCBBTEMyMzNfRklYVVBfSU5URUxfTlVDOF9ETUlDKSwKIAlTTkRfUENJ
X1FVSVJLKDB4ODA4NiwgMHgyMDgwLCAiSW50ZWwgTlVDIDggUnVnZ2VkIiwgQUxDMjU2X0ZJWFVQ
X0lOVEVMX05VQzhfUlVHR0VEKSwKIAlTTkRfUENJX1FVSVJLKDB4ODA4NiwgMHgyMDgxLCAiSW50
ZWwgTlVDIDEwIiwgQUxDMjU2X0ZJWFVQX0lOVEVMX05VQzEwKSwK

--_002_eac4f3aca2ab45e59ccd207a90ee60e9realtekcom_--
