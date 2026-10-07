Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1189F3CAE9B
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371058; cv=none; b=eleaQPci3WokYBWx8dkbJeL/DfFWkCZ3N7U52VOPRvdOxOdm5xwQNaaVqxSaIdkmn5ydzS58BAxgC63ro5e473IFs34/eJ3Ksiby9wSM5rP+A+GZRdK686P1ezbUFep34/s9zux4bEmGxavRfQA2g6N+MWURFiwyq5T0Mf1HhK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371058; c=relaxed/simple;
	bh=sbW0/0kCTFFkZAkUUR6e42ZwdEy84GwOBXcBOJfGg0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=doAuQm7ngn+3Bj0VeD0synKDA+AtnoMMKmygukzWZdZlpJBGIvOOpAx+z69EeTn8L/6rm6f++6uLMwyYSorQj7tZoxP7TZXrCTkaBbwZeayEx7zPFRlUJ72WMa7N95mHFCsKmkyduw7GiRpEzNkf65kQopGmF452U/D2wbELGXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=pE+tSvVp; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="pE+tSvVp"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 697B3O6S03750644, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1791371004; bh=sbW0/0kCTFFkZAkUUR6e42ZwdEy84GwOBXcBOJfGg0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=pE+tSvVpVMI0SpQq9erQ5yJIhpPB/qnYo684LA93m8b7Ol6ahahyDDCvggWYCAVTC
	 yGboVizjyqr6uMVrX58xE6yZY7gZvvqt7u7sB+V5RRZNh8E/+fQGLNn0Rh8AqQmv60
	 7Bm+SJ2M6js/r89mRBFqxlrDJPhpqgsSFJtY8E6locwL3WehssyeViVFRsFp6qjIhN
	 cSUHD24g0hBkgw0iqReKzG0QRqZylQ8pGJIb0ZBOZVW8VNqurDwRIX1YE7+GaqSR8Z
	 d3xzceDAkexMyYJo4/El/Ar2dxVqZRBcZBBD/3/rocZCNuRxB4crgNHZ6vIDLrSnQT
	 J8xpK6fzZXeWA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 697B3O6S03750644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Oct 2026 19:03:24 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 19:03:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 19:03:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Wed, 7 Oct 2026 19:03:24 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>, =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: rt766: trigger JD when system reboots
Thread-Topic: [PATCH] ASoC: rt766: trigger JD when system reboots
Thread-Index: AQHdVj3OQbqN2VZl8km8PII54k7QO7bxX+CAgAAEc+A=
Date: Wed, 7 Oct 2026 11:03:24 +0000
Message-ID: <87341bc3edca474cad3c11607fd25b26@realtek.com>
References: <20261007092524.3711965-1-shumingf@realtek.com>
 <asYjO4n9fy8qC3kc@sirena.co.uk>
In-Reply-To: <asYjO4n9fy8qC3kc@sirena.co.uk>
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

PiBPbiBXZWQsIE9jdCAwNywgMjAyNiBhdCAwNToyNToyNFBNICswODAwLCBzaHVtaW5nZkByZWFs
dGVrLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5j
b20+DQo+ID4NCj4gPiBUaGUgaW5pdGlhbCBqYWNrIGRldGVjdGlvbiBhdCBib290IHRpbWUgbWF5
IGJlIG1pc3NlZCBhZnRlciBhIHdhcm0NCj4gPiByZWJvb3QgaWYgdGhlIGJsaW5kIHdyaXRlcyBh
cmUgbm90IHJlbG9hZGVkLg0KPiANCj4gSG93IGRvZXMgdGhpcyBoYXBwZW4gLSB0aGlzIGZlZWxz
IGxpa2UgaXQncyBtYXNraW5nIHRoZSBmYWlsdXJlIHRvIHJlc3VtZQ0KPiBwcm9wZXJseSBhZnRl
ciBhIHdhcm0gcmVib290IGFuZCB0aGVyZSdzIG1vcmUgdGhhdCBuZWVkcyB0byBiZSBzZXQgdXAg
aW4gdGhhdA0KPiBjYXNlPw0KDQpUaGUgYmxpbmQgd3JpdGUgYWxzbyBpbmNsdWRlcyBhIHRyaWdn
ZXIgY29tbWFuZCB0byB0cmlnZ2VyIEpELg0KVGhlcmVmb3JlLCB0aGlzIGlzc3VlIGRvZXMgbm90
IG9jY3VyIGJlZm9yZSBtZXJnaW5nIHRoZSAiQVNvQzogcnQ3NjY6IGF2b2lkIHJlLWluaXRpYWxp
emUgdGhlIGJsaW5kIHdyaXRlIiBwYXRjaC4NClRoZSBpc3N1ZSBvbmx5IG9jY3VycyB3aGVuIHRo
ZSBzeXN0ZW0gZG9lcyBub3QgZGV0ZWN0IHRoYXQgdGhlIGphY2sgaXMgYWxyZWFkeSBwbHVnZ2Vk
IGluIGR1cmluZyB3YXJtIHJlYm9vdC4NCklmIHRoZSB1c2VyIHBsdWdzIG9yIHVucGx1Z3MgdGhl
IGphY2sgYWZ0ZXJ3YXJkLCB0aGUgSkQgaW50ZXJydXB0IHN0aWxsIHdvcmtzIG5vcm1hbGx5Lg0K
DQo=
