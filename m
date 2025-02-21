Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9921A1367
	for <linux-sound@vger.kernel.org>; Fri, 21 Feb 2025 02:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740105565; cv=none; b=NpQVXzqLC1s8j4MFSpsyDPYTbShmRHJZ+ZCEssU4oDgD6CZnQ4NvHpQfvfRaX//NDO9QkNwPlNHX8jIVz46m7Yv3aZ0m3MsuZ1otH7oLhouOiuvANeFt11mXbLpmtXrY4GBsLW1axYw1p9Oofw60iCZWyKiT8TSx7z3aaFoTzUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740105565; c=relaxed/simple;
	bh=Wg8mRvWy9fgPoOYR0vLtVdNw4ohEhI/ruJmBDaYKbP8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lI8kEKaUtW0y+0Nz/XLoLbGgMWk0Vtkpt6JAQlZTraDqHgKKYzAZ4PE7vE51D9K47dfPeJufJOirENJs6AhU0rZCUTpKRLrEE7idM0mB1pbyHYykUy096bPzB1hxvtD4c3jNesVucfsMiLuvHUetIX0CYcJbS/Mi4mnfPI337Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=h1pZh2wD; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="h1pZh2wD"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 51L2cqQzB900794, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1740105532; bh=Wg8mRvWy9fgPoOYR0vLtVdNw4ohEhI/ruJmBDaYKbP8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=h1pZh2wDWAixMplqbTmALEboc214Kthlpfiold/2Mwpon/P4ZjBkg0QNxjJ3ipQ8u
	 UY+J+KCdZM3jP7mEKiTijFp2YLkv908qVjrNa2EDQwK45QbERYmtMNtRhQT0hyWFcA
	 cYSt6BEvXQxvFVtOwry1AiDWpu7LXwKJ4G1btyc+QZs4wctOB+NL6OtlMzsQdxs6X6
	 TeTGhbnaEQh8XQ55iixMhs0ZPQvjNfI9SivewIFriJgbcny6TP81aAZG2LzdTtMbmH
	 AIt3feY+fas5uPyK03w3dcT+rZbFpmdw1OTrvVvOrVuULLZoj7ips78v2vjUhFPin7
	 hulEz7aOJR8Gg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 51L2cqQzB900794
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 10:38:52 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Feb 2025 10:38:52 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 21 Feb 2025 10:38:50 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Fri, 21 Feb 2025 10:38:49 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Cezary Rojewski'" <cezary.rojewski@intel.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>
CC: "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>,
        "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "Flove(HsinFu)"
	<flove@realtek.com>,
        "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?=
	<shumingf@realtek.com>,
        Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of device_id tables
Thread-Topic: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of
 device_id tables
Thread-Index: AQHbg4iwYrimaa6ymEysW6pOC92G7bNRCNjA
Date: Fri, 21 Feb 2025 02:38:49 +0000
Message-ID: <d1fe2ca16a7c4c9c90bdd5a8480ca497@realtek.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-21-cezary.rojewski@intel.com>
In-Reply-To: <20250220112643.3813295-21-cezary.rojewski@intel.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDZXphcnkgUm9qZXdza2kgPGNl
emFyeS5yb2pld3NraUBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyMCwg
MjAyNSA3OjI3IFBNDQo+IFRvOiBicm9vbmllQGtlcm5lbC5vcmcNCj4gQ2M6IHRpd2FpQHN1c2Uu
Y29tOyBwZXJleEBwZXJleC5jejsgYW1hZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb207
DQo+IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsgT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUBy
ZWFsdGVrLmNvbT47DQo+IEZsb3ZlKEhzaW5GdSkgPGZsb3ZlQHJlYWx0ZWsuY29tPjsgYW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOw0KPiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5y
b2pld3NraUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAyMC8yNF0gQVNvQzogY29kZWNz
OiBydDEwMTVwOiBVcGRhdGUgZGVmaW5pdGlvbiBvZiBkZXZpY2VfaWQNCj4gdGFibGVzDQo+IA0K
PiANCj4gRXh0ZXJuYWwgbWFpbCA6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUg
dGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90DQo+IHJlcGx5LCBjbGljayBsaW5rcywgb3Igb3BlbiBh
dHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZA0KPiBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IEZvbGxvdyBQQ0ktYmFzZWQgZm9ybWF0
ICgxMEVDeHh4eCkgZm9yIEFDUEkgSURzIGJ5IGFkZGluZyByZWxldmFudA0KPiBlbnRyaWVzIHRv
IHRoZSBleGlzdGluZyB0YWJsZS4NCj4gDQo+IFdoaWxlIGF0IGl0LCB0aGVyZSBzaGFsbCBiZSBu
byBjb21tYSBhZnRlciB0aGUgdGVybWluYXRvciBlbnRyeSBhbmQNCj4gaW5pdGlhbGl6aW5nIGZp
ZWxkcyB3aXRoIDAgZm9yIHN0YXRpY2FsbHkgZGVmaW5lZCBzdHJ1Y3RzIGlzIHJlZHVuZGFudC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IENlemFyeSBSb2pld3NraSA8Y2V6YXJ5LnJvamV3c2tpQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBzb3VuZC9zb2MvY29kZWNzL3J0MTAxNXAuYyB8IDggKysrKyst
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9ydDEwMTVwLmMgYi9zb3VuZC9zb2Mv
Y29kZWNzL3J0MTAxNXAuYw0KPiBpbmRleCA0NGU3ZmUzYzMyZGEuLjMzOTE3NDM4MTk2ZiAxMDA2
NDQNCj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9ydDEwMTVwLmMNCj4gKysrIGIvc291bmQvc29j
L2NvZGVjcy9ydDEwMTVwLmMNCj4gQEAgLTEzMyw5ICsxMzMsMTEgQEAgTU9EVUxFX0RFVklDRV9U
QUJMRShvZiwgcnQxMDE1cF9kZXZpY2VfaWQpOw0KPiANCj4gICNpZmRlZiBDT05GSUdfQUNQSQ0K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCBydDEwMTVwX2FjcGlfbWF0Y2hb
XSA9IHsNCj4gLSAgICAgICB7ICJSVEwxMDE1IiwgMH0sDQo+IC0gICAgICAgeyAiUlRMMTAxOSIs
IDB9LA0KPiAtICAgICAgIHsgfSwNCj4gKyAgICAgICB7ICJSVEwxMDE1IiB9LA0KPiArICAgICAg
IHsgIlJUTDEwMTkiIH0sDQo+ICsgICAgICAgeyAiMTBFQzEwMTUiIH0sDQo+ICsgICAgICAgeyAi
MTBFQzEwMTkiIH0sDQo+ICsgICAgICAge30NCg0KVGhlcmUgYXJlIGRpZmZlcmVudCBzZXR0aW5n
cyBmb3IgUlRMMTAxNSwgUlRMMTAxOSwgMTBFQzEwMTUsIGFuZCAxMEVDMTAxOS4NClJUTDEwMTUg
YW5kIFJUTDEwMTkgYXJlIHVzZWQgZm9yIHBvd2VyaW5nIHVwIGFuZCBkb3duIHZpYSB0aGUgR1BJ
Ty4NCjEwRUMxMDE1IGFuZCAxMEVDMTAxOSBhcmUgdXNlZCBmb3IgdGhlIEkyQy1jb250cm9sbGVk
IGRyaXZlci4NClRoZXJlZm9yZSAxMEVDMTAxNSBhbmQgMTBFQzEwMTkgc2hvdWxkIGJlIHJlbW92
ZWQuDQoNCj4gIH07DQo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKGFjcGksIHJ0MTAxNXBfYWNwaV9t
YXRjaCk7DQo+ICAjZW5kaWYNCj4gLS0NCj4gMi4yNS4xDQoNCg==
