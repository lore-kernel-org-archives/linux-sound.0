Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EFA3E49E2
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790972; cv=none; b=JNMT7QJ2Obc5bEKmpYirrgNduvAvWaCxn9kyWdI95lFwrlWMdBmtdL4OH/JKZ6tpdb58/wBJlGCn6mqHlU6+Y1CE3gZX5NmZohycISNyxK08CZyEEOkGxPEeXiG8pSPs1w7Vce96fD6MzeCIUAb9l21dhT1sAMA1SMlqO2v7U7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790972; c=relaxed/simple;
	bh=ydpWMNazXbR1dy5fVTGqIscLCeSrT6lVDeoIj/FXIk0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HCFOrP0cSoB/4rJrGaMqSgoDQpV7cXQQgi1c6Makjrw5ulGsZhnIrJwauJJIodL7l4IuPlImlprPfKW5RYdmI0wgAc4Gc3P4a25Gq12vRFnDWaxkQSrYcOCp1XZMQj7y5KvU9y3yKcaqloOdw/VGeoHLi4YzlPoDOHk98Ipz7MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=uv4d/VP7; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="uv4d/VP7"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66N7FieK6277919, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784790944; bh=0ZWxfw2lQrj7bDvw7NIqLdCf2fLmKPrQ7tQ7YcRepGA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=uv4d/VP7bLgr8KLdwAk0oOgXN567wf/vaeuflY64twrguI5aEeMGIWIN9WADF1pig
	 WjrHaCOwQF48/jf3CoeHQKhR+jhiHy2pCTm+CHjI3eE7BEtpQtY44gB/DXPJZMwy3M
	 sQCmdeUCOon+yXbUQgQamfgYjuvzkvEoGr9q4T50lcaw59HZEkX8NiijmL+tXh0seX
	 dAf//MEluWt0YwXY01voQE5zMaiUBpK24QOz050zzppOfc3w5FSZGKU4TRJBzLhfzb
	 +bhwGY2KfSwfsCArIHYeNOVhATJqKN83DsVwPEKX10kNDoTOUEuqpugezl5ElBg6zP
	 VlkjOuEawogww==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66N7FieK6277919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jul 2026 15:15:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 23 Jul 2026 15:15:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 23 Jul 2026 15:15:44 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Add quirk to another Razer Blade 16
Thread-Topic: Add quirk to another Razer Blade 16
Thread-Index: Ad0acr1oaml9H8FAQTuH7IPjumBaRw==
Date: Thu, 23 Jul 2026 07:15:44 +0000
Message-ID: <0cd8c77a82a4481ca9409ac68f1041e8@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_0cd8c77a82a4481ca9409ac68f1041e8realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_0cd8c77a82a4481ca9409ac68f1041e8realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Razer Blade 16 had another SSID.
The patch will add quirk to another machine.

BR,
Kailang

--_002_0cd8c77a82a4481ca9409ac68f1041e8realtekcom_
Content-Type: application/octet-stream; name="0000-razer-p11.patch"
Content-Description: 0000-razer-p11.patch
Content-Disposition: attachment; filename="0000-razer-p11.patch"; size=1210;
	creation-date="Thu, 23 Jul 2026 07:15:13 GMT";
	modification-date="Thu, 23 Jul 2026 07:11:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlNzJhNjBkYTcxM2YyYTBiYWNmZTMzNGRjNDc4M2FmOTUzNmRkOGVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjMgSnVsIDIwMjYgMTQ6NTk6NDcgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBxdWlyayB0byBhbm90aGVyIFJhemVyIEJsYWRlIDE2CgpBZGQg
cXVpcmsgdG8gYW5vdGhlciBtYWNoaW5lLgoKRml4ZXM6IDk2MWQ5Zjk4ZGEwZCAoIkFMU0E6IGhk
YS9yZWFsdGVrOiBFbmFibGUgaW50ZXJuYWwgc3BlYWtlcnMgb24gUmF6ZXIgQmxhZGUgMTYgKDIw
MjUpIikKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5nQHJlYWx0ZWsuY29tPgoK
ZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGMyNjkuYyBiL3NvdW5kL2hk
YS9jb2RlY3MvcmVhbHRlay9hbGMyNjkuYwppbmRleCBhZGRlN2M5NTNkNjYuLjVjMjcxNWI0OWE4
ZCAxMDA2NDQKLS0tIGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCisrKyBiL3Nv
dW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGMyNjkuYwpAQCAtODAzMiw2ICs4MDMyLDggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBoZGFfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9Q
Q0lfUVVJUksoMHgxOWU1LCAweDMyMDQsICJIdWF3ZWkgTUFDSC1XWDkiLCBBTEMyNTZfRklYVVBf
SFVBV0VJX01BQ0hfV1g5X1BJTlMpLAogCVNORF9QQ0lfUVVJUksoMHgxOWU1LCAweDMyMGYsICJI
dWF3ZWkgV1JULVdYOSAiLCBBTEMyNTZfRklYVVBfQVNVU19NSUNfTk9fUFJFU0VOQ0UpLAogCVNO
RF9QQ0lfUVVJUksoMHgxOWU1LCAweDMyMTIsICJIdWF3ZWkgS0xWLVdYOSAiLCBBTEMyNTZfRklY
VVBfQUNFUl9IRUFEU0VUX01JQyksCisJU05EX1BDSV9RVUlSSygweDFhNTgsIDB4MjAyMywgIlJh
emVyIEJsYWRlIDE2ICgyMDI1KSIsCisJCSAgICAgIEFMQzI5OF9GSVhVUF9SQVpFUl9CTEFERTE2
XzIwMjVfUElOUyksCiAJU05EX1BDSV9RVUlSSygweDFhNTgsIDB4MzAwZSwgIlJhemVyIEJsYWRl
IDE2ICgyMDI1KSIsCiAJCSAgICAgIEFMQzI5OF9GSVhVUF9SQVpFUl9CTEFERTE2XzIwMjVfUElO
UyksCiAJU05EX1BDSV9RVUlSSygweDFiMzUsIDB4MTIzNSwgIkNaQyBCMjAiLCBBTEMyNjlfRklY
VVBfQ1pDX0IyMCksCg==

--_002_0cd8c77a82a4481ca9409ac68f1041e8realtekcom_--
