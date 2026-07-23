Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E88D3C1F
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 02:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775182; cv=none; b=YYhOx134I8M6DX6T6fAy4GEpM0CG+BDCCson8NACpaLSUprC/ihtQAT2SpN/jemjB3XxySVtfGf1011rwpsH1EY3aTpz+7njmGpqDMNK9ykKU/F1b6D8EJW7GFixSmg9LMvBAx4Ac3d1ua4dRUXseMzatEo2z944dredX5uGDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775182; c=relaxed/simple;
	bh=W4ETRojpiob9HsXxAHkbwWc4p3/k3g3Yj6SXjZRed5c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ryrz0CpT1GbQSUxeZ6VO5LXd9/fLxnBaRqcP8nbLTucfuagNw+Ofl8zr0Kxybn3csDnw/tUrhhLE8TbUzlVERd/S5/Y6o63wrWw/Aciv4huQW8BszDhVGO7VIwQfnR/54KI9WY44PnQGSh368h6HpBjRX10Ec66YKIEJyd0bUss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=vPAEa2ar; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="vPAEa2ar"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66N2qJoH5161661, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784775139; bh=W4ETRojpiob9HsXxAHkbwWc4p3/k3g3Yj6SXjZRed5c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vPAEa2arO3nYI4OgLa4PjXH4/c4sKUEvqd2rZGDTIFEebOljfoubUv+R6glj5mQhz
	 e82rBDrUhxQmKLIZRfYXVCffPac0Yvqyrz+xzfYrOXrhpbYYHehAHvEkttaKd2Sr5y
	 Hk0Ik4xKHgJrtb3r9bIlqt++H79gAIOo1Y0qPYO0Ag3v+i2vFExlr0mj99xVASsCiY
	 UdZen9C8D3C0l0VqQp9gdAyYv48m6jNTMAgodxJQ5c2/piu2AAYP5wGgy89rSlHuRu
	 babyuun2hQZYx6EofisxLii/wptmR/75yuSwKn8sPPBdDiLOxU0cFqOGb4C+l/yZ8Z
	 8dhx0p48tGnAg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66N2qJoH5161661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jul 2026 10:52:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 23 Jul 2026 10:52:19 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 23 Jul 2026 10:52:19 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>, =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
Subject: RE: [PATCH] ASoC: rt766: add RT766/RT767 SDCA driver
Thread-Topic: [PATCH] ASoC: rt766: add RT766/RT767 SDCA driver
Thread-Index: AQHdGCcGf8NCRKeWy02JuRrLX15fk7Z2ESGAgAE9nBCAAbRuAIABZlQw
Date: Thu, 23 Jul 2026 02:52:19 +0000
Message-ID: <c4d709f9c73f41a28aa4cd040326f0b7@realtek.com>
References: <20260720090613.2239891-1-shumingf@realtek.com>
 <al5K9RHWIeHjL0BM@opensource.cirrus.com>
 <3f470a3c2e2f4123b93c5671dd92fae9@realtek.com>
 <amDDfsCnhdq/I0X1@opensource.cirrus.com>
In-Reply-To: <amDDfsCnhdq/I0X1@opensource.cirrus.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiBPbiBUdWUsIEp1bCAyMSwgMjAyNiBhdCAwNzoxMDowMEFNICswMDAwLCBTaHVtaW5nIFvojIPm
m7jpiphdIHdyb3RlOg0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICpvdXRfcmF0ZXMgPSByYXRl
czsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICBkZXZfZGJnKGRldiwgIiVzOiBlbnRpdHkgJXMg
c3VwcG9ydHMgcmF0ZXMgMHglMDh4LA0KPiA+ID4gY2xvY2tfcmF0ZXM9MHglMDh4XG4iLA0KPiA+
ID4gPiArICAgICAgICAgICAgIF9fZnVuY19fLCBlbnRpdHktPmxhYmVsLCByYXRlcywgY2xvY2tf
cmF0ZXMpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ID4gPiArfQ0K
PiA+ID4NCj4gPiA+IFRoaXMgaXMgbW9zdGx5IGp1c3QgcG9wdWxhdGVfcmF0ZV9mb3JtYXQoKSwg
dGhlIHZhbHVlcyBlbmQgdXAgaW4gdGhlDQo+ID4gPiBzbmRfc29jX3BjbV9zdHJlYW0sIGNhbiB3
ZSBleHBvcnQgdGhhdCBhbmQgdXNlIGl0IGhlcmU/DQo+ID4NCj4gPiBTdXJlLCB3aWxsIHRyeSB0
byBleHBvcnQgcG9wdWxhdGVfcmF0ZV9mb3JtYXQoKSBhbmQgdXNlIGl0IGhlcmUuDQo+IA0KPiBM
b29raW5nIGEgYml0IG1vcmUgaXMgdGhlcmUgcmVhbGx5IGFueXRoaW5nIHRoYXQgd291bGQgc3Rv
cCB5b3UganVzdCB1c2luZw0KPiBzZGNhX2Fzb2NfcG9wdWxhdGVfZGFpcygpLCB3aGljaCBpcyBh
bHJlYWR5IGV4cG9ydGVkPw0KPiBZb3Ugd291bGQgcHJvYmFibHkgd2FudCB0byBmaXh1cCB0aGUg
Y2hhbm5lbHNfbWF4IGF0IHRoZSBlbmQgYW5kIHRoZQ0KPiBuYW1pbmcgb2YgdGhlIERBSXMgd291
bGQgZW5kIHVwIGJlaW5nIHNsaWdodGx5IG1vcmUgU0RDQSwgYnV0IHRob3NlIGRvbid0DQo+IHNl
ZW0gbGlrZSBodWdlIHByb2JsZW1zLg0KDQpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLiANClRo
YXQncyBmaW5lLCBidXQgSSdkIHN0aWxsIGxpa2UgdG8gZXhwb3J0IHBvcHVsYXRlX3JhdGVfZm9y
bWF0KCkgZm9yIHRoaXMgdXNlIGNhc2UuDQoNCkJ5IHRoZSB3YXksIEknbGwgd2FpdCB1bnRpbCB5
b3VyICJBU29DOiBTRENBOiBSZW5hbWUgc2RjYV9pcnFfYWxsb2NhdGUoKSB0byBpbmNsdWRlIGRl
dm0iIHBhdGNoIGlzIG1lcmdlZCBiZWZvcmUgc2VuZGluZyB2MiBvZiB0aGUgUlQ3NjYgY29kZWMg
ZHJpdmVyLg0KDQo+IFRoYW5rcywNCj4gQ2hhcmxlcw0K
