Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470374;
	b=4tZUHSCvcO+PrkwSNO286NGyd3ZJZJDxomtSTpoLXvjF2qGLNqcMZs+n3YP3kLm089M2
	 8JLCJg6ORBsvCr75KFkHLpBIHrtzSaWYVLBhLnJJ+RQYwTjZCsHJrMTJUVed6tQ7yZInh
	 8l9/cb0NcePibnQ7cMz1wbhL98HS+58AL3PZGme/y52Na6fcbpJcOHuIoDZyBYIwa9faf
	 8QVxGXjba1ywWb4i7RolEABecFkokg4BD9ibLeT75+ifr9cABCiHmfYis5nfM2hVd0vJQ
	 0AR4zA42PlO6WxtCNTMOLlGF2Cksu6Ya3blxSi+hf4Y8PFE/dDbZDnWbUP/wShMnF3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470374;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 x-originating-ip:Content-Type:MIME-Version;
	bh=+9Oy1gFYXUkvYMQkz7Xg9juVjZjtcPK/xlXfGR79Dl8=;
	b=YGLbW+he9CONS/76ED5e9zGAoDSEUx7KhKOwX+M7SsSI1/RrsgyYBealQEobNTfi7BLX
	 5eoKUdV6w8An+D4KR6x6tGRCAjxdTO/sHfV+ZZyptuiURX2d/cBN9ej+/piQoqsFLJAKT
	 zeCVg1kB6a4DO+pyAjZ0YtWxHBEo8Zz5vQfWqMrBZQeDxv5yQdEAOru9r/9uuobfkjxa/
	 HTMzPEhlbI+0bzp4roiYfQSKwLMxLrch/dETTK5Ae+DXoUqO3Ogk5huEQOBnazgq9EsiU
	 TBxrlWK0Y3Oa5KJTcrLsVstlDJe5++y+6v4TyttW/fGjOFBg/vvadS/sMKMoT8H+p6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vILhtSYp;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C23606A89C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 07:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C23606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=vILhtSYp
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC7xFZN13595526, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794470355; bh=+9Oy1gFYXUkvYMQkz7Xg9juVjZjtcPK/xlXfGR79Dl8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=vILhtSYpWRR+0EE9zBOgkki7RVfkZ7FjeFnC8vxGiyT4cJRG7IYLxXEddOVnb0U6A
	 HArieNF3kF0B8cBi5JBqe08j+czN0DbiuSIGLw+JTZBwdx59NN90A8bwWrgMnW3Zl8
	 QME96Dd34pb+hC5fMbWLwGW3q+TZ4fMCJ+U0Vc4qixFiJvBTWyTyzy9p5nlAD2fToX
	 Dk58shjTZPNiTClcbwtdhpcQy4KTk9B5P/Ys4E7sCvXKpa8DcMBxDkktOqAPEcQJNQ
	 qv9cO5Q0bEwipoQV8SmBiOLei511FYH003az6Jl2O6Ybro3usRNTNg8FwA7yLwlHTc
	 irxORlLahesWQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC7xFZN13595526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 15:59:15 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 15:59:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 15:59:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 15:59:14 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Remove Headphone MIC support
Thread-Topic: Remove Headphone MIC support
Thread-Index: Ad1ye6AvNpmm01yzQmCTx8LXWOm7dg==
Date: Thu, 12 Nov 2026 07:59:14 +0000
Message-ID: <3c8129fbfa6d4ee2b464735f2f31dffa@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_3c8129fbfa6d4ee2b464735f2f31dffarealtekcom_"
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--_002_3c8129fbfa6d4ee2b464735f2f31dffarealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Dell QC DT unit don't support Headphone MIC.
This patch was changed model to NO Headphone MIC model.
This modify also fixed headphone popping noise issue.
Many Thanks.

BR,
Kailang

--_002_3c8129fbfa6d4ee2b464735f2f31dffarealtekcom_
Content-Type: application/octet-stream; name="0000-dell-QCDT-r-hp-MIC.patch"
Content-Description: 0000-dell-QCDT-r-hp-MIC.patch
Content-Disposition: attachment; filename="0000-dell-QCDT-r-hp-MIC.patch";
	size=3041; creation-date="Thu, 12 Nov 2026 07:48:16 GMT";
	modification-date="Thu, 12 Nov 2026 07:46:53 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4ZTE4ZDRmOGFlMzA4YzY1NTZlOGNkMTFkZTBiOWI3OWY2Y2ZiMTk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTIgTm92IDIwMjYgMTU6MzI6MTYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIHJlbW92ZSBoZWFkcGhvbmUgTUlDIHN1cHBvcnQgZm9yIERlbGwgUHJv
IFFDMTI1NQoKVGhpcyB1bml0IGRvbid0IHN1cHBvcnQgaGVhZHBob25lIE1JQy4KVGhlIHBvcHBp
bmcgc291bmQgd2lsbCBkaXNhcHBlYXIgd2hlbiB5b3UgcmVtb3ZlIGl0LgoKRml4ZXM6IDk3Mjcy
YTU3MDRiZiAoIkFMU0E6IGhkYS9yZWFsdGVrIC0gRml4ZWQgSGVhZHBob25lIG5vaXNlIGlzc3Vl
IGZvciBEZWxsIFFDTTEyNTUiKQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdA
cmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5
LmMgYi9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5LmMKaW5kZXggYTc1NmUwMDc2MDIx
Li41NmM4ZTllODJiN2UgMTAwNjQ0Ci0tLSBhL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGMy
NjkuYworKysgYi9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5LmMKQEAgLTQ1NDIsNyAr
NDU0Miw2IEBAIGVudW0gewogCUFMQzI1Nl9GSVhVUF9IT05PUl9EUkFfWFhfSEVBRFNFVF9NT0RF
LAogCUFMQzI0NV9GSVhVUF9IUF9FTlZZX1gzNjBfMTVfRkgwWFhYLAogCUFMQzI4N19GSVhVUF9B
Q0VSX01JQ01VVEVfTEVELAotCUFMQzIzNl9GSVhVUF9ERUxMX0hQX1BPUF9OT0lTRSwKIAlBTEMy
NzRfRklYVVBfSFBfODlFOV9HUElPLAogCUFMQzI3NF9GSVhVUF9IUF9WRVJCUywKIAlBTEMyODdf
RklYVVBfQVc4ODM5OV9JMkNfMiwKQEAgLTc0MDgsMTIgKzc0MDcsNiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCS5jaGFpbmVkID0gdHJ1ZSwK
IAkJLmNoYWluX2lkID0gQUxDMlhYX0ZJWFVQX0hFQURTRVRfTUlDLAogCX0sCi0JW0FMQzIzNl9G
SVhVUF9ERUxMX0hQX1BPUF9OT0lTRV0gPSB7Ci0JCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCi0J
CS52LmZ1bmMgPSBhbGMyODVfZml4dXBfaW52YWxpZGF0ZV9kYWNzLAotCQkuY2hhaW5lZCA9IHRy
dWUsCi0JCS5jaGFpbl9pZCA9IEFMQzI1NV9GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UKLQl9
LAogCVtBTEMyNzRfRklYVVBfSFBfODlFOV9HUElPXSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBf
RlVOQywKIAkJLnYuZnVuYyA9IGFsYzI3NF9maXh1cF9ocF84OWU5X2FtcCwKQEAgLTc2NTIsMTIg
Kzc2NDUsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfcXVpcmsgYWxjMjY5X2ZpeHVwX3Ri
bFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBjYzMsICJEZWxsIE9hc2lzIDE0IExv
dyBXZWlnaHQgTVRMLVUiLCBBTEMyODlfRklYVVBfREVMTF9DUzM1TDQxX1NQSV8yKSwKIAlTTkRf
UENJX1FVSVJLKDB4MTAyOCwgMHgwY2M0LCAiRGVsbCBPYXNpcyAxNiBNVEwtSC9VIiwgQUxDMjg5
X0ZJWFVQX0RFTExfQ1MzNUw0MV9TUElfMiksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGNj
NSwgIkRlbGwgT2FzaXMgMTQiLCBBTEMyODlfRklYVVBfUlRLX0FNUF9EVUFMX1NQSyksCi0JU05E
X1BDSV9RVUlSSygweDEwMjgsIDB4MGQ1NiwgIkRlbGwgUHJvIFRvd2VyIFFDVDEyNTUiLCBBTEMy
MzZfRklYVVBfREVMTF9IUF9QT1BfTk9JU0UpLAotCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBk
NTgsICJEZWxsIFBybyBNaWNybyBRQ00xMjU1IiwgQUxDMjM2X0ZJWFVQX0RFTExfSFBfUE9QX05P
SVNFKSwKLQlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwZDVhLCAiRGVsbCBQcm8gU2xpbSBRQ1Mx
MjU1IiwgQUxDMjM2X0ZJWFVQX0RFTExfSFBfUE9QX05PSVNFKSwKLQlTTkRfUENJX1FVSVJLKDB4
MTAyOCwgMHgwZTZiLCAiRGVsbCBQcm8gVG93ZXIgUUNUMTI1NSIsIEFMQzIzNl9GSVhVUF9ERUxM
X0hQX1BPUF9OT0lTRSksCi0JU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGU2YywgIkRlbGwgUHJv
IFNsaW0gUUNTMTI1NSIsIEFMQzIzNl9GSVhVUF9ERUxMX0hQX1BPUF9OT0lTRSksCi0JU05EX1BD
SV9RVUlSSygweDEwMjgsIDB4MGU2ZCwgIkRlbGwgUHJvIE1pY3JvIFFDTTEyNTUiLCBBTEMyMzZf
RklYVVBfREVMTF9IUF9QT1BfTk9JU0UpLAorCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBkNTYs
ICJEZWxsIFBybyBUb3dlciBRQ1QxMjU1IiwgQUxDMjU1X0ZJWFVQX0RFTEwyX01JQ19OT19QUkVT
RU5DRSksCisJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGQ1OCwgIkRlbGwgUHJvIE1pY3JvIFFD
TTEyNTUiLCBBTEMyNTVfRklYVVBfREVMTDJfTUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FV
SVJLKDB4MTAyOCwgMHgwZDVhLCAiRGVsbCBQcm8gU2xpbSBRQ1MxMjU1IiwgQUxDMjU1X0ZJWFVQ
X0RFTEwyX01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGU2Yiwg
IkRlbGwgUHJvIFRvd2VyIFFDVDEyNTUiLCBBTEMyNTVfRklYVVBfREVMTDJfTUlDX05PX1BSRVNF
TkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgwZTZjLCAiRGVsbCBQcm8gU2xpbSBRQ1Mx
MjU1IiwgQUxDMjU1X0ZJWFVQX0RFTEwyX01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlS
SygweDEwMjgsIDB4MGU2ZCwgIkRlbGwgUHJvIE1pY3JvIFFDTTEyNTUiLCBBTEMyNTVfRklYVVBf
REVMTDJfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgxNjRhLCAi
RGVsbCIsIEFMQzI5M19GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJ
UksoMHgxMDI4LCAweDE2NGIsICJEZWxsIiwgQUxDMjkzX0ZJWFVQX0RFTEwxX01JQ19OT19QUkVT
RU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4MTU4NiwgIkhQIiwgQUxDMjY5X0ZJWFVQ
X0hQX01VVEVfTEVEX01JQzIpLAo=

--_002_3c8129fbfa6d4ee2b464735f2f31dffarealtekcom_--
