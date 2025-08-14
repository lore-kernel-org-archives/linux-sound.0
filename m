Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A091C84DF
	for <linux-sound@vger.kernel.org>; Thu, 14 Aug 2025 01:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755136353; cv=none; b=JAY9sUkKPBOuBIbkX5pTdNy+FsEqqaPiotN+zItkJjsvwBsVMYA7zP/03QCYJkbcQgPcf7MwOkzTwJODv9lCCjsose7iDI8Yw5+TGuDz8T2B83AZezAwmkiLybhIdG/QSnWsf6ejXCTWLMlkZNnexlpHqsUIds3hxAlXtM6E/gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755136353; c=relaxed/simple;
	bh=wmFXh7//dlBDd7L6X0GLOc+uaBJaXyNBgsfaU0D73Kc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JJUlHghED6Ds2VcA0TAs/Kv+rHOgQKcLeOfdghiGYZW98jA92hMWlY7bgy/hWBO6yb7b1E74ZsxV2H4ECSYhqGQKNorLxfTlGDM+17ytStOkOMrBNAYLgYqpx2O52ReWZsxIi2Kc79TmZS9mlEmIb3zd7yuEJWkNZCw/v3rsBis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=V9xsDAFK; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="V9xsDAFK"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 57E1pvssF988962, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1755136318; bh=wmFXh7//dlBDd7L6X0GLOc+uaBJaXyNBgsfaU0D73Kc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=V9xsDAFKaZgh0dWWp1DtuQLYjWmNCS3vCUW7e2D9dLlAkbvfVvRyfwgWjiQEVWlri
	 DNqo9vH8a0pMBZddlyTf1TIiep7pASVi7ty4KJb94lnNEtB4wfDeQNDeZJxwbweIFx
	 Fa0zsH3vRcJcD6DWo9/0YZpLqTWmVoTqMXlj8H+A/VIsks7+QqM3UkZcpgvbMobIAw
	 42ZioqrW5eZ7Vyo0bu5q6hR5GMMDVPbezqT03xvAII/mnB5W+g0AS68rFMlDTz/G6u
	 lggx3HJvqmcyBGNumQTpaS+IHzXhj7FxchGmtiEzpbHixybeyQlJAWi6Nt5CIGp3gq
	 N4oR6QRYtw6Ag==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 57E1pvssF988962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 09:51:58 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 09:51:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Aug 2025 09:51:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::9617:3fd6:3830:25cc]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::9617:3fd6:3830:25cc%10]) with mapi id
 15.02.1544.011; Thu, 14 Aug 2025 09:51:57 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>,
        "Deep.Harsora@dell.com" <Deep.Harsora@dell.com>
Subject: RE: [PATCH] ASoC: rt1321: Add RT1321 amplifier support
Thread-Topic: [PATCH] ASoC: rt1321: Add RT1321 amplifier support
Thread-Index: AQHcDDCzRXKRpCRuSk6HeaxYaK7LorRgBTeAgADYUjA=
Date: Thu, 14 Aug 2025 01:51:57 +0000
Message-ID: <4f22057dd52f4028821500b4166833d7@realtek.com>
References: <20250813090019.1404356-1-shumingf@realtek.com>
 <7ff24fbb-00e9-4a1a-b674-d66255b73ebe@sirena.org.uk>
In-Reply-To: <7ff24fbb-00e9-4a1a-b674-d66255b73ebe@sirena.org.uk>
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

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBBU29DOiBydDEzMjE6IEFkZCBSVDEzMjEgYW1wbGlmaWVy
IHN1cHBvcnQNCj4gDQo+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDA1OjAwOjE5UE0gKzA4MDAs
IHNodW1pbmdmQHJlYWx0ZWsuY29tIHdyb3RlOg0KPiANCj4gPiAtCWlmIChydDEzMjAtPnZlcnNp
b25faWQgPD0gUlQxMzIwX1ZCKQ0KPiA+IC0JCWZpbGVuYW1lID0gUlQxMzIwX1ZBQl9NQ1VfUEFU
Q0g7DQo+ID4gLQllbHNlDQo+ID4gLQkJZmlsZW5hbWUgPSBSVDEzMjBfVkNfTUNVX1BBVENIOw0K
PiA+ICsJaWYgKHJ0MTMyMC0+ZGV2X2lkID09IFJUMTMyMF9ERVZfSUQpIHsNCj4gPiArCQlpZiAo
cnQxMzIwLT52ZXJzaW9uX2lkIDw9IFJUMTMyMF9WQikNCj4gPiArCQkJZmlsZW5hbWUgPSBSVDEz
MjBfVkFCX01DVV9QQVRDSDsNCj4gPiArCQllbHNlDQo+ID4gKwkJCWZpbGVuYW1lID0gUlQxMzIw
X1ZDX01DVV9QQVRDSDsNCj4gPiArCQltaW5fYWRkciA9IDB4MTAwMDcwMDA7DQo+ID4gKwkJbWF4
X2FkZHIgPSAweDEwMDA3ZmZmOw0KPiA+ICsJfSBlbHNlIGlmIChydDEzMjAtPmRldl9pZCA9PSBS
VDEzMjFfREVWX0lEKSB7DQo+ID4gKwkJZmlsZW5hbWUgPSBSVDEzMjFfVkFfTUNVX1BBVENIOw0K
PiA+ICsJCW1pbl9hZGRyID0gMHgxMDAwODAwMDsNCj4gPiArCQltYXhfYWRkciA9IDB4MTAwMDhm
ZmY7DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCWRldl9lcnIoJnNsYXZlLT5kZXYsICIlczogVW5r
bm93biBkZXZpY2UgSUQgJWRcbiIsIF9fZnVuY19fLA0KPiBydDEzMjAtPmRldl9pZCk7DQo+ID4g
KwkJcmV0dXJuOw0KPiA+ICsJfQ0KPiANCj4gVGhlc2UgdGhpbmdzIGFyZSBnZW5lcmFsbHkgbW9y
ZSBzY2FsYWJseSB3cml0dGVuIGFzIHN3aXRjaCBzdGF0ZW1lbnRzIC0gaXQNCj4gbWFrZXMgaXQg
ZWFzaWVyIHRvIGFkZCBuZXcgY2FzZXMuDQoNClN1cmUsIHdpbGwgc2VuZCB2MiBwYXRjaC4gVGhh
bmtzLg0KDQoNCg==
