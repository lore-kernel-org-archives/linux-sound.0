Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92672233735
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 02:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762396251; cv=none; b=hG3Czm1KU0YwTGjZyt1vJg69XJwJ80uam1q4UhJlCtqNVfUwZezSPJNbPU7W/LtYkscSyFOeXkRWNrHJCeLrwH6R5U/vsbBoBkAjF4jLJ08JU8kF4+4d9s8g80irxpiCBjm+jgZKltINodkSl2OoDdjamCni/6+5MEjT533k0KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762396251; c=relaxed/simple;
	bh=ns6mWl3F8oGF41LCe520SBxtkP5DAy/1CDCK4N+a3VY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nGjmpag7gGtOvJpvvW3UNgY36QHjzPv45Cb2qRevPcdlSH0MmsVAK7gAYicrszfVUc+hLvBWJuEro5vTro1oOw6KqvBoiL5CinNY5rUXP1PqUvSgQWuF2NkU3sUQ8+SzYiXFU1qtUjlIf3iYDwgxSc89bStY6pekqtmFA5bJX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=WuoOJSfa; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="WuoOJSfa"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5A62UIOp82253494, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1762396218; bh=ns6mWl3F8oGF41LCe520SBxtkP5DAy/1CDCK4N+a3VY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=WuoOJSfa9bWY76+xArkpgp8LycGmnwK5k4obu+g7STcJ+U2r6mYer+/BFVFQ8iRk1
	 dsUiT0U433kgCNKxorSGtzAc9Di8R8LmrRiWz7Slgmwh56Qdg/YUznU6slVKP9WvyV
	 qhQY7TOnU50eeEHLHV1/z2GGBbC5b3SI6CVDXi1pPQznO0e3s6PSTAUfK9vPrzAgDM
	 TjxWLYJi8lI1UcaSrVi3AYbn4kBFsv/mNTgvx30uJSXiZ8ceQYS8WN04S6gPOEHk7q
	 6sStW4NtQiGsr/7pl04GpFv4fZnwviKrflr7vGKisCrmnlL/gFqtM9pPw12fmC+M5X
	 SkVQm3p0Tt6bw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5A62UIOp82253494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Nov 2025 10:30:18 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 6 Nov 2025 10:30:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 6 Nov 2025 10:30:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Thu, 6 Nov 2025 10:30:17 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: SDCA: support Q7.8 volume format
Thread-Topic: [PATCH] ASoC: SDCA: support Q7.8 volume format
Thread-Index: AQHcTjPf3johIdJi/kKBFmpwNQ0+/rTjnYuAgAFJQLA=
Date: Thu, 6 Nov 2025 02:30:17 +0000
Message-ID: <c61adef5f21141d99b20182bac6216e6@realtek.com>
References: <20251105091122.495561-1-shumingf@realtek.com>
 <aQteVxu1gLyzbfLs@opensource.cirrus.com>
In-Reply-To: <aQteVxu1gLyzbfLs@opensource.cirrus.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiA+ICtzdGF0aWMgaW50IHNkY2Ffc29jX3E3OF9yZWdfdG9fY3RsKHN0cnVjdCBzb2NfbWl4ZXJf
Y29udHJvbCAqbWMsIHVuc2lnbmVkDQo+IGludCByZWdfdmFsLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXNrLCB1bnNpZ25lZCBpbnQgc2hpZnQsDQo+
ID4gK2ludCBtYXgpIHsNCj4gPiArICAgICBpbnQgdmFsID0gcmVnX3ZhbDsNCj4gPiArDQo+ID4g
KyAgICAgaWYgKFdBUk5fT04oIW1jLT5zaGlmdCkpDQo+IA0KPiBXZSBzaG91bGQgdXNlIHRoZSBm
dW5jdGlvbiBhcmd1bWVudCBmb3Igc2hpZnQgaW4gdGhlc2UgZnVuY3Rpb25zLg0KDQpJdCBpcyBp
bnRlbnRpb25hbCB0byBkbyB0aGlzLiANClRoZSBwYXRjaCBvbmx5IHVzZXMgdGhlICdzaGlmdCcg
ZmllbGQgdG8gc3RvcmUgdGhlIHN0ZXAgdmFsdWUgYW5kIHRoZSAncnNoaWZ0JyBmaWVsZCByZW1h
aW5zIHplcm8uDQpUaGVyZWZvcmUsIHdlIGNvdWxkIHJldXNlIHRoZSBmdW5jdGlvbiAnc29jX3B1
dF92b2xzdycgYW5kIGdlbmVyYXRlIHRoZSBjb3JyZWN0IHJlc3VsdCBmb3Igc3RlcmVvIHZvbHVt
ZS4NCg0KPiA+ICBzdGF0aWMgaW50IHNvY19taXhlcl9yZWdfdG9fY3RsKHN0cnVjdCBzb2NfbWl4
ZXJfY29udHJvbCAqbWMsIHVuc2lnbmVkIGludA0KPiByZWdfdmFsLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXNrLCB1bnNpZ25lZCBpbnQgc2hpZnQs
DQo+ID4gaW50IG1heCkgIHsgQEAgLTIwMiwxNCArMjMyLDIyIEBAIHN0YXRpYyBpbnQgc29jX3B1
dF92b2xzdyhzdHJ1Y3QNCj4gPiBzbmRfa2NvbnRyb2wgKmtjb250cm9sLA0KPiA+ICAgICAgIHVu
c2lnbmVkIGludCB2YWwyID0gMDsNCj4gPiAgICAgICBib29sIGRvdWJsZV9yID0gZmFsc2U7DQo+
ID4gICAgICAgaW50IHJldDsNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgKCpjdGxfdG9fcmVnKShz
dHJ1Y3Qgc29jX21peGVyX2NvbnRyb2wgKiwgaW50LA0KPiA+ICsgdW5zaWduZWQgaW50LCB1bnNp
Z25lZCBpbnQsIGludCk7DQo+IA0KPiBXb3VsZCBiZSBuaWNlIHRvIHB1dCB0aGlzIGF0IHRoZSB0
b3Agb2YgdGhlIHZhcmlhYmxlIGxpc3QsIGdpdmVuIHRoZSBsZW5ndGguDQoNCldpbGwgZml4DQoN
Cg==
