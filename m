Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D744C3D6CAA
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 07:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582059; cv=none; b=vDdsaSLkGhU6lyV/3p8i5nozRA7xkBTAXN92Zhg/apMsgLUImZyD+xgS18YTiAVuSvLN+4jQYtA0Lk3hsyj2KUTs3vs2X4IxXXJv0uMZ0fd9WNsNwekPmxPhBk0Cyj9Sov+fP4bNdhb9NK57NNjzNDSl2uVvBH5bmEhKKS7DOZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582059; c=relaxed/simple;
	bh=rTya/fpGKrIGgS30F1dSK0WMZhgSGTc1NkAk7i8HJD4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SkHG/swRjyoaQr0hSbBjP83LXvd105wwiV1zeLxgOAzCGa3BTDqiSJXwMoZgBmpfNkqkKoq7aRBrWMwwSaF1QU/iWMBgNkVhPvAwYse5oj51BDYbL6mgqOkmDWNw7YR1Y52oWW3nHkxxRpCTCwYqgBnj1s+nCymfnamAlJu4u4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=h3H+rSON; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="h3H+rSON"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6697REEN02903496, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783582034; bh=f81aJAbRl0PxCU944JQB0HSTwJXSLdfp8ikW5U75v2U=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=h3H+rSONxlewbrlcKS2P58MF5mhYcyYP5Arg3r4wmuWonOgJLGGpHGUHdHpfeMF9u
	 ga0Zuopcyj8Ywwv+MjHJvW3FSxQANvG4OHxDOAYQByBPXdzbc4tbZ4Y/0s7dzZt1Wx
	 +5LdGLzqwz9tKNr5BgTeFJKryAAVV86WOZnx2cFQOyaV3OPBIS1zOWTp1FTwtVwn45
	 20UsLJuAUOV5rrGceLUZlNMSnfasfJ+M7Vfjs0/NBFu7D/N+5SHmX/BSOYAhvdLYfG
	 lsJjtO/v45u/SI5Pxb9Q1d2KURog92PYIXUlqMsSNIQQYQrV4i1iYhYgk/sFMDTLba
	 8Kn5GVoX3mqgQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6697REEN02903496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jul 2026 15:27:14 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 9 Jul 2026 15:27:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 9 Jul 2026 15:27:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 9 Jul 2026 15:27:14 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Fixed Headphone noise issue for Dell QCM1255
Thread-Topic: Fixed Headphone noise issue for Dell QCM1255
Thread-Index: Ad0Pc2V5/SNTDyoaQoGucr6gAJ7feA==
Date: Thu, 9 Jul 2026 07:27:14 +0000
Message-ID: <34b990cb56914148ba02fa8e9d176479@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
Content-Type: multipart/mixed;
	boundary="_002_34b990cb56914148ba02fa8e9d176479realtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_002_34b990cb56914148ba02fa8e9d176479realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

This platform booted with Ubuntu 24.04 with Pipewire audio server. So, it h=
as pop
noise with headphone. But it's normal with Pulseaudio server.
This patch was the workaround. Connect the headphones to DAC 0x2.
The popping sound will disappear.

This solution was approved by Dell.

Thanks.
Kailang

--_002_34b990cb56914148ba02fa8e9d176479realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc236-dell-dt-hp-noise.patch"
Content-Description: 0000-alc236-dell-dt-hp-noise.patch
Content-Disposition: attachment;
	filename="0000-alc236-dell-dt-hp-noise.patch"; size=2027;
	creation-date="Thu, 09 Jul 2026 07:21:21 GMT";
	modification-date="Thu, 09 Jul 2026 07:18:21 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkYWI4YzE3MDk3ZWFjMzhlMGQ5YWFlNjNhMmY3ZTE4NjAyNTdlOGQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgOSBKdWwgMjAyNiAxNDo1NzowNiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gRml4ZWQgSGVhZHBob25lIG5vaXNlIGlzc3VlIGZvciBEZWxsIFFDTTEy
NTUKClRoaXMgcGxhdGZvcm0gYm9vdGVkIHdpdGggVWJ1bnR1IDI0LjA0IHdpdGggUGlwZXdpcmUg
YXVkaW8gc2VydmVyLiBTbywgaXQgaGFzIHBvcApub2lzZSB3aXRoIGhlYWRwaG9uZS4gQnV0IGl0
J3Mgbm9ybWFsIHdpdGggUHVsc2VhdWRpbyBzZXJ2ZXIuClRoaXMgcGF0Y2ggd2FzIHRoZSB3b3Jr
YXJvdW5kLiBDb25uZWN0IHRoZSBoZWFkcGhvbmVzIHRvIERBQyAweDIuClRoZSBwb3BwaW5nIHNv
dW5kIHdpbGwgZGlzYXBwZWFyLgoKU2lnbmVkLW9mZi1ieTogS2FpbGFuZyBZYW5nIDxrYWlsYW5n
QHJlYWx0ZWsuY29tPgoKZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGMy
NjkuYyBiL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGMyNjkuYwppbmRleCA1YjIyY2Q5NDEw
MjYuLmE5NDVhOTU0NTBmYyAxMDA2NDQKLS0tIGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2Fs
YzI2OS5jCisrKyBiL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGMyNjkuYwpAQCAtNDE3Nyw2
ICs0MTc3LDcgQEAgZW51bSB7CiAJQUxDMjU2X0ZJWFVQX0hPTk9SX01SQl9YWFhfTTEwMjBfQVVE
SU8sCiAJQUxDMjQ1X0ZJWFVQX0hQX0VOVllfWDM2MF8xNV9GSDBYWFgsCiAJQUxDMjg3X0ZJWFVQ
X0FDRVJfTUlDTVVURV9MRUQsCisJQUxDMjM2X0ZJWFVQX0RFTExfSFBfUE9QX05PSVNFLAogfTsK
IAogLyogQSBzcGVjaWFsIGZpeHVwIGZvciBMZW5vdm8gQzk0MCBhbmQgWW9nYSBEdWV0IDc7CkBA
IC02Nzk4LDYgKzY3OTksMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgYWxjMjY5
X2ZpeHVwc1tdID0gewogCQkuY2hhaW5lZCA9IHRydWUsCiAJCS5jaGFpbl9pZCA9IEFMQzJYWF9G
SVhVUF9IRUFEU0VUX01JQywKIAl9LAorCVtBTEMyMzZfRklYVVBfREVMTF9IUF9QT1BfTk9JU0Vd
ID0geworCQkudHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5mdW5jID0gYWxjMjg1X2ZpeHVw
X2ludmFsaWRhdGVfZGFjcywKKwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfcXVp
cmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewpAQCAtNjk0OSw2ICs2OTU0LDggQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBoZGFfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJ
UksoMHgxMDI4LCAweDBjYzMsICJEZWxsIE9hc2lzIDE0IExvdyBXZWlnaHQgTVRMLVUiLCBBTEMy
ODlfRklYVVBfREVMTF9DUzM1TDQxX1NQSV8yKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAyOCwgMHgw
Y2M0LCAiRGVsbCBPYXNpcyAxNiBNVEwtSC9VIiwgQUxDMjg5X0ZJWFVQX0RFTExfQ1MzNUw0MV9T
UElfMiksCiAJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4MGNjNSwgIkRlbGwgT2FzaXMgMTQiLCBB
TEMyODlfRklYVVBfUlRLX0FNUF9EVUFMX1NQSyksCisJU05EX1BDSV9RVUlSSygweDEwMjgsIDB4
MGU2YiwgIkRlbGwgUHJvIFFDTTEyNTUiLCBBTEMyMzZfRklYVVBfREVMTF9IUF9QT1BfTk9JU0Up
LAorCVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDBlNmQsICJEZWxsIFBybyBNaWNybyBRQ00xMjU1
IiwgQUxDMjM2X0ZJWFVQX0RFTExfSFBfUE9QX05PSVNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAy
OCwgMHgxNjRhLCAiRGVsbCIsIEFMQzI5M19GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UpLAog
CVNORF9QQ0lfUVVJUksoMHgxMDI4LCAweDE2NGIsICJEZWxsIiwgQUxDMjkzX0ZJWFVQX0RFTEwx
X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4MTU4NiwgIkhQIiwg
QUxDMjY5X0ZJWFVQX0hQX01VVEVfTEVEX01JQzIpLAo=

--_002_34b990cb56914148ba02fa8e9d176479realtekcom_--
