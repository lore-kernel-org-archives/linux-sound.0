Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3931DDA1B
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739343349; cv=none; b=Rrxt/J8Bm/C8onJ0WQhGPsqTlqbWldDYMmST2NfnEHNuqTOsInLtz/gH7VLpjMKEypNxgKS5aV3e3mnXY3ZsIyJYOWRhg2z/4tB+vTqpWYc0eSIQ8mj4TFlt7NRM45zd6WyenakWQ9eBALMYDiP4uFJSSNFfmpyyDOl9YWtHzrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739343349; c=relaxed/simple;
	bh=zt7iDenZyRr2ZhjXd9FrArhigiID8+lzpGKIMUUhPWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=krTNg8X/eBpo1qJVxFP0f+9wONgvofy+61/zBTKH8TNjdzwmsfP3YSQQGp/PinUIaMT9fTc1YxsCZ50FeiyykIAc56xinh9uKBXX9rrq12W72e+MVwi8OYWgcjYmKffpX/LlzhoZYimFcWyDjzL7lzY9GL6axXotGq5Wl6Q+OEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=FshMaKw/; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="FshMaKw/"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 51C6tKfjD1749646, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1739343320; bh=zt7iDenZyRr2ZhjXd9FrArhigiID8+lzpGKIMUUhPWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version;
	b=FshMaKw/xE+f6PjKWomiVpDW5XQ4S7wAcTRNk9kr1Aj4B3VA8F5u53dK7B/quPMoo
	 SFZ6LQwUi5RaQ84W36A18sstzWc+5l/QulDei3vK2rN9ICYqSEH4VujK+qDMkKz4BU
	 z8WDV/peIjbHx7c4ZDgCuMPX19inkSeECXDr6ZJumpeWrFnXk3nyG/pmPji2w3jXqD
	 CnqXUiYefmI1juxb4poVUvaXVUmMQ8YH6CN/5b8dxa4iaiDMeF1vXFUAf8ZmF4Ohzl
	 ecdGfu3Guq+u8LrE7fKVhEUfNp+mvghNwnJwlY9S2Tykhf0Ns0a5PMcBR7StzVZQN9
	 WHhOBilMqNmmQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 51C6tKfjD1749646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 14:55:20 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Feb 2025 14:55:20 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 12 Feb 2025 14:55:20 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Wed, 12 Feb 2025 14:55:20 +0800
From: Kailang <kailang@realtek.com>
To: "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>,
        "Takashi Iwai
 (tiwai@suse.de)" <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "
 (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: RE: [Bug 219743] [REGRESSION, BISECTED] ASUS GA402XY Headset mic stopped working after 6.12.2
Thread-Topic: [Bug 219743] [REGRESSION, BISECTED] ASUS GA402XY Headset mic
 stopped working after 6.12.2
Thread-Index: AQHbe5CALM4/NqKCy0ae6JW97tmZU7NDPn7Q
Date: Wed, 12 Feb 2025 06:55:20 +0000
Message-ID: <0474a095ab0044d0939ec4bf4362423d@realtek.com>
References: <bug-219743-196757@https.bugzilla.kernel.org/>
 <bug-219743-196757-RLkOfxHF9E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219743-196757-RLkOfxHF9E@https.bugzilla.kernel.org/>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_0474a095ab0044d0939ec4bf4362423drealtekcom_"
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

--_002_0474a095ab0044d0939ec4bf4362423drealtekcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rml4dXAgaGVhZHNldCBNSUMgbm8gZnVuY3Rpb24uDQo=

--_002_0474a095ab0044d0939ec4bf4362423drealtekcom_
Content-Type: application/octet-stream; name="0000-alc285-depop-fixup.patch"
Content-Description: 0000-alc285-depop-fixup.patch
Content-Disposition: attachment; filename="0000-alc285-depop-fixup.patch";
	size=849; creation-date="Wed, 12 Feb 2025 06:42:20 GMT";
	modification-date="Wed, 12 Feb 2025 06:52:54 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5MzI1ZTJkMzBlNTYzNmIxZWQ3ZDM4OGJjYjlmZWY1NTE1ZTAxMTNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFdlZCwgMTIgRmViIDIwMjUgMTQ6NDA6NDYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlazogRml4dXAgQUxDMjI1IGRlcG9wIHByb2NlZHVyZQoKSGVhZHNldCBNSUMg
d2lsbCBubyBmdW5jdGlvbiB3aGVuIHBvd2VyX3NhdmU9MC4KCkZpeGVzOiAxZmQ1MDUwOWZlMTQg
KCJBTFNBOiBoZGEvcmVhbHRlazogVXBkYXRlIEFMQzIyNSBkZXBvcCBwcm9jZWR1cmUiKQpTaWdu
ZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYwppbmRleCBhZTBiZWI1MmU3YjAuLjIyNDYxNmZiZWM0ZiAxMDA2NDQKLS0tIGEvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFs
dGVrLmMKQEAgLTM3ODgsNiArMzc4OCw3IEBAIHN0YXRpYyB2b2lkIGFsYzIyNV9pbml0KHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjKQogCQkJCSAgICBBQ19WRVJCX1NFVF9BTVBfR0FJTl9NVVRFLCBB
TVBfT1VUX1VOTVVURSk7CiAKIAkJbXNsZWVwKDc1KTsKKwkJYWxjX3VwZGF0ZV9jb2VmX2lkeChj
b2RlYywgMHg0YSwgMyA8PCAxMCwgMCk7CiAJCWFsY191cGRhdGVfY29lZmV4X2lkeChjb2RlYywg
MHg1NywgMHgwNCwgMHgwMDA3LCAweDQpOyAvKiBIaWdodCBwb3dlciAqLwogCX0KIH0K

--_002_0474a095ab0044d0939ec4bf4362423drealtekcom_--
