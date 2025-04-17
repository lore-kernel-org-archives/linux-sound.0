Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840821ABC4
	for <linux-sound@vger.kernel.org>; Thu, 17 Apr 2025 08:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877355; cv=none; b=L+Me6ex1IfvohUKuYmfOwc+NANx48xHOXT2ZnjfO4C3yy6YPtN/aULa4hQJ6fakZE9nf4YU6vYOFZaMt3fM1X8y8mkHmCO702VQ+8X2cOumzsMIfeyvcbdSUCtCzcDgzz3QWHbGLQpw/6/EJSDoIzfzY6Y8xOINPpMnXLwb4cEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877355; c=relaxed/simple;
	bh=nUhvFbCWk95zgGrfVu2tiiWLRqKBPNxWZQ7uEou5f18=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ft8rsIbLRvAXT40s2taMC7K4ric4CWP5ub1yuLxOCdnaizE3oYTMp8ZDZNPfJW437qav2zWos/WkJgSA378Ip82KXDZC45GftM6N0jeQcRhi/qkiqMDXjVhtKUHHcf5RBzY1WKbOL+zhjwa8UnlSFT7asOnHogSUld29ALDBMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=PUTnTe1+; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="PUTnTe1+"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 53H88okY6555697, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1744877330; bh=nUhvFbCWk95zgGrfVu2tiiWLRqKBPNxWZQ7uEou5f18=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=PUTnTe1+zbg7NccaN68XbUUEVkVolsg5TFpaaN6QT5n6+clFXCojR9vsDs5DoL3Fu
	 qKr6th0mILOJnHKiCcwi8rkXov6VQcyg/e9J/gXtjEieaMTgxMvZPgMRKGg5cp8RLi
	 rInpRKgXEzUzrCcFhlqL64ABsShA8ItaCv2+t6B/Y87p2T1OCWvcTa+ggkPzHvd1yM
	 OULOwXl5x81msbYxnW4qIbIWOYDR0cZrglHr1EfoE6FsyVxl4oWuypH4JjkU+uRsoZ
	 /La8r+ZlGZDMyBMYUbuv1V3o7/iRqK0DnsWTKouobmZl3+ueCxOp6GU7E7Qo40YdK2
	 bwdckc1ri/kQA==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 53H88okY6555697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 16:08:50 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Apr 2025 16:08:50 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 17 Apr 2025 16:08:48 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Thu, 17 Apr 2025 16:08:48 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Speaker can't mute when headphone was plugged
Thread-Topic: Speaker can't mute when headphone was plugged
Thread-Index: Aduvb5FlJ2sjDv+mQRWEyeJdhFvEsA==
Date: Thu, 17 Apr 2025 08:08:48 +0000
Message-ID: <eb4c14a4d85740069c909e756bbacb0e@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_eb4c14a4d85740069c909e756bbacb0erealtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

--_002_eb4c14a4d85740069c909e756bbacb0erealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Speaker can't mute when headphone was plugged for HP platform.
Add attach patch will solve issue.

BR,
Kailang

--_002_eb4c14a4d85740069c909e756bbacb0erealtekcom_
Content-Type: application/octet-stream;
	name="0000-alc245-hp-OmniBook-Ultra-Flip-Laptop.patch"
Content-Description: 0000-alc245-hp-OmniBook-Ultra-Flip-Laptop.patch
Content-Disposition: attachment;
	filename="0000-alc245-hp-OmniBook-Ultra-Flip-Laptop.patch"; size=2334;
	creation-date="Tue, 01 Apr 2025 07:05:37 GMT";
	modification-date="Thu, 17 Apr 2025 08:04:43 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0YWI2NjhkOWI5MDJiZDM5NzFlZDE5MjdiZjRlZTRiOTU4ZGE4ZjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFR1ZSwgMSBBcHIgMjAyNSAxNTowNDowMiArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gRW5hYmxlIHNwZWFrZXIgZm9yIEhQIHBsYXRmb3JtCgpUaGUgc3BlYWtl
ciBkb2Vzbid0IG11dGUgd2hlbiBwbHVnZ2VkIGhlYWRwaG9uZS4KVGhpcyBwbGF0Zm9ybSBzdXBw
b3J0IDRjaCBzcGVha2Vycy4gClRoZSBzcGVha2VyIHBpbiAweDE0IHdhc24ndCBmaWxsIHZlcmIg
dGFibGUuCkFmdGVyIGFzc2lnbmVkIG1vZGVsIEFMQzI0NV9GSVhVUF9IUF9TUEVDVFJFX1gzNjBf
RVUwWFhYLgpUaGUgc3BlYWtlciBjYW4gbXV0ZSB3aGVuIGhlYWRwaG9uZSB3YXMgcGx1Z2dlZC4K
ClByaW9yaXR5OiBQMQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRl
ay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCBiNjliNjU5YWU2NTkuLmI5MTk3MjJiMDcz
NyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQv
cGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTQ0MSw2ICs0NDEsMTAgQEAgc3RhdGljIHZvaWQg
YWxjX2ZpbGxfZWFwZF9jb2VmKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQogCQlhbGNfdXBkYXRl
X2NvZWZfaWR4KGNvZGVjLCAweDY3LCAweGYwMDAsIDB4MzAwMCk7CiAJCWZhbGx0aHJvdWdoOwog
CWNhc2UgMHgxMGVjMDIxNToKKwljYXNlIDB4MTBlYzAyMzY6CisJY2FzZSAweDEwZWMwMjQ1Ogor
CWNhc2UgMHgxMGVjMDI1NjoKKwljYXNlIDB4MTBlYzAyNTc6CiAJY2FzZSAweDEwZWMwMjg1Ogog
CWNhc2UgMHgxMGVjMDI4OToKIAkJYWxjX3VwZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgzNiwgMTw8
MTMsIDApOwpAQCAtNDQ4LDEyICs0NTIsOCBAQCBzdGF0aWMgdm9pZCBhbGNfZmlsbF9lYXBkX2Nv
ZWYoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJY2FzZSAweDEwZWMwMjMwOgogCWNhc2UgMHgx
MGVjMDIzMzoKIAljYXNlIDB4MTBlYzAyMzU6Ci0JY2FzZSAweDEwZWMwMjM2OgotCWNhc2UgMHgx
MGVjMDI0NToKIAljYXNlIDB4MTBlYzAyNTU6Ci0JY2FzZSAweDEwZWMwMjU2OgogCWNhc2UgMHgx
OWU1ODMyNjoKLQljYXNlIDB4MTBlYzAyNTc6CiAJY2FzZSAweDEwZWMwMjgyOgogCWNhc2UgMHgx
MGVjMDI4MzoKIAljYXNlIDB4MTBlYzAyODY6CkBAIC0xMDczOCw4ICsxMDczOCw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaGRhX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJ
X1FVSVJLKDB4MTAzYywgMHg4Y2E3LCAiSFAgWkJvb2sgRnVyeSIsIEFMQzI0NV9GSVhVUF9DUzM1
TDQxX1NQSV8yX0hQX0dQSU9fTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4Y2FmLCAi
SFAgRWxpdGUgbXQ2NDUgRzggTW9iaWxlIFRoaW4gQ2xpZW50IiwgQUxDMjM2X0ZJWFVQX0hQX01V
VEVfTEVEX01JQ01VVEVfVlJFRiksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNiZCwgIkhQ
IFBhdmlsaW9uIEFlcm8gTGFwdG9wIDEzLWJnMHh4eCIsIEFMQzI0NV9GSVhVUF9IUF9YMzYwX01V
VEVfTEVEUyksCi0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNkZCwgIkhQIFNwZWN0cmUiLCBB
TEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksCi0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNk
ZSwgIkhQIFNwZWN0cmUiLCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiksCisJU05EX1BDSV9R
VUlSSygweDEwM2MsIDB4OGNkZCwgIkhQIFNwZWN0cmUiLCBBTEMyNDVfRklYVVBfSFBfU1BFQ1RS
RV9YMzYwX0VVMFhYWCksCisJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNkZSwgIkhQIE9tbmlC
b29rIFVsdHJhIEZsaXAgTGFwdG9wIDE0dCIsIEFMQzI0NV9GSVhVUF9IUF9TUEVDVFJFX1gzNjBf
RVUwWFhYKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4Y2RmLCAiSFAgU25vd1doaXRlIiwg
QUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfSFBfR1BJT19MRUQpLAogCVNORF9QQ0lfUVVJUkso
MHgxMDNjLCAweDhjZTAsICJIUCBTbm93V2hpdGUiLCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNf
Ml9IUF9HUElPX0xFRCksCiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGNmNSwgIkhQIFpCb29r
IFN0dWRpbyAxNiIsIEFMQzI0NV9GSVhVUF9DUzM1TDQxX1NQSV80X0hQX0dQSU9fTEVEKSwK

--_002_eb4c14a4d85740069c909e756bbacb0erealtekcom_--
