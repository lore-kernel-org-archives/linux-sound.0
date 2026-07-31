Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7007331EA8
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487889; cv=none; b=meGHMX2TJZJj9z9lmZnjEGNnpsVmJN45LUbnjpeeip04/ggWnyugcSU5gzTXjjsFN3O+WEfgPWrSPvMzF58Y2sPCTNQgoEstDAiHnKcDaUamU+wBf5XH7TPNTMqpaAuxjlA6a9eLpvOvU8PTbHH3HKBy90qHmyANXZz45XOh/aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487889; c=relaxed/simple;
	bh=hIpjhWK3G8KQoVf1su6niNlGgzWGnXd60VuO+8PtqE8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZtQP/gbPay7Xl5N6QP6QFdHanKVakKxHwFXUt351OYyNSyZr4Ntrsx061+X34zYDDnZFSbPO0DEKv6VwyWJvii4LJ+npqkyG7liKxmncLU/+PF19CGQbxSTUEmNoyninrKAstJk/K+gru0wHBwMX7lpPwIZAoQmdkGBy87MVt54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Q8ztbdsZ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Q8ztbdsZ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66V8p4heD1771958, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785487864; bh=hIpjhWK3G8KQoVf1su6niNlGgzWGnXd60VuO+8PtqE8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Q8ztbdsZlgD7mfsZf0iVfXM0DNxstrEoyF+EbmYyVAStSa0l7Ji8jBgyi4t2TZhbz
	 13WVgb0hw0vjk8zT7HDMsZodw940ag0LAj1JueQS+ydygVjmohWvI2B94foB0uzTc6
	 tSTo1A1mlHh1+5B9DvOm7KGiXcmLeqSQzGnbyReIGmozMB8x+JZJJvsEZwlssTYoWB
	 00+moUrnH7Pxl7oJGXvGk0VfyGNSybd4KvC9Ha+xKqSD/V0hT4WUUuv6fOXt5Bz+vw
	 gf2ACJR5K3PK4TkYjZPF0PxYo5coLxp+8u1k/sr24214UhA72D9zx/zljUiud7+JoC
	 bWpID4XynsJcw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66V8p4heD1771958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jul 2026 16:51:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Jul 2026 16:51:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 31 Jul 2026 16:51:04 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>, =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH v2 3/3] ASoC: rt766: add RT766/RT767 SDCA driver
Thread-Topic: [PATCH v2 3/3] ASoC: rt766: add RT766/RT767 SDCA driver
Thread-Index: AQHdHwmH4xuMhYi8+UqquE10Td5IZbaFzNIAgAECW9A=
Date: Fri, 31 Jul 2026 08:51:04 +0000
Message-ID: <05d20b887b654ebba569848b79c3df8b@realtek.com>
References: <20260729032246.3750820-1-shumingf@realtek.com>
 <40a15f17-4e3c-4304-8b68-8ccb8ef7ca4f@sirena.org.uk>
In-Reply-To: <40a15f17-4e3c-4304-8b68-8ccb8ef7ca4f@sirena.org.uk>
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

PiA+ICtjb25maWcgU05EX1NPQ19SVDc2Nl9TRENBX1NEVw0KPiA+ICsJdHJpc3RhdGUgIlJlYWx0
ZWsgUlQ3NjYgU0RDQSBDb2RlYyAtIFNEVyINCj4gPiArCWRlcGVuZHMgb24gU09VTkRXSVJFDQo+
ID4gKwlkZXBlbmRzIG9uIFNORF9TT0NfU0RDQQ0KPiA+ICsJc2VsZWN0IFJFR01BUF9TT1VORFdJ
UkUNCj4gPiArCXNlbGVjdCBSRUdNQVBfU09VTkRXSVJFX01CUQ0KPiA+ICsNCj4gDQo+IERvZXMg
dGhpcyBuZWVkIFNORF9TT0NfU0RDQV9JUlEgYW5kIFNORF9TT0NfU0RDQV9ISUQ/DQoNClllcywg
d2lsbCBzZWxlY3QgdGhpcyB0d28gY29uZmlncy4NCg0KPiA+ICtzdGF0aWMgaW50IHJ0NzY2X3Nk
Y2FfbWJxX3NpemUoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgcmVnKQ0KPiA+ICt7
DQo+ID4gKwlzd2l0Y2ggKHJlZykgew0KPiA+ICsJY2FzZSBSVDc2Nl9WT0xVTUVfUkVHKFVBSiwg
VVNFUl9GVTQxLCAxKToNCj4gPiArCWNhc2UgUlQ3NjZfVk9MVU1FX1JFRyhVQUosIFVTRVJfRlU0
MSwgMik6DQo+ID4gKwljYXNlIFJUNzY2X1ZPTFVNRV9SRUcoVUFKLCBVU0VSX0ZVMzYsIDEpOg0K
PiA+ICsJY2FzZSBSVDc2Nl9WT0xVTUVfUkVHKFVBSiwgVVNFUl9GVTM2LCAyKToNCj4gPiArCWNh
c2UgUlQ3NjZfVk9MVU1FX1JFRyhNSUMsIFVTRVJfRlUxMTMsIDEpOg0KPiA+ICsJY2FzZSBSVDc2
Nl9WT0xVTUVfUkVHKE1JQywgVVNFUl9GVTExMywgMik6DQo+ID4gKwljYXNlIFJUNzY2X1ZPTFVN
RV9SRUcoTUlDLCBVU0VSX0ZVMTEzLCAzKToNCj4gPiArCWNhc2UgUlQ3NjZfVk9MVU1FX1JFRyhN
SUMsIFVTRVJfRlUxMTMsIDQpOg0KPiA+ICsJY2FzZSBSVDc2Nl9WT0xVTUVfUkVHKEFNUCwgVVNF
Ul9GVTIxLCAxKToNCj4gPiArCWNhc2UgUlQ3NjZfVk9MVU1FX1JFRyhBTVAsIFVTRVJfRlUyMSwg
Mik6DQo+ID4gKwkJcmV0dXJuIDI7DQo+IA0KPiBBcmUgdGhlIEZVMzMgZ2FpbiByZWdpc3RlcnMg
YWxzbyAyIGJ5dGVzPw0KDQpZZXMsIHdpbGwgYWRkIEZVMzMgZ2FpbiByZWdpc3RlcnMgaGVyZS4N
Cg0KPiA+ICtzdGF0aWMgdm9pZCBydDc2Nl9zZGNhX3Nkd19yZW1vdmUoc3RydWN0IHNkd19zbGF2
ZSAqc2xhdmUpIHsNCj4gPiArCXN0cnVjdCBydDc2Nl9zZGNhX3ByaXYgKnJ0NzY2ID0gZGV2X2dl
dF9kcnZkYXRhKCZzbGF2ZS0+ZGV2KTsNCj4gPiArDQo+ID4gKwlwbV9ydW50aW1lX2Rpc2FibGUo
JnNsYXZlLT5kZXYpOw0KPiA+ICsNCj4gPiArCW11dGV4X2Rlc3Ryb3koJnJ0NzY2LT5kaXNhYmxl
X2lycV9sb2NrKTsNCj4gPiArfQ0KPiANCj4gVGhlIG11dGV4IGlzIHVzZWQgYnkgdGhlIGludGVy
cnVwdCBjb2RlLCBwcm9iYWJseSBiZXR0ZXIgdG8gYWxsb2NhdGUgaXQgdXNpbmcNCj4gZGV2bSBz
byBpdCdzIG9yZGVyZWQgd2l0aCBldmVyeXRoaW5nIGVsc2UgZHVyaW5nIHRlYXJkb3duLg0KDQp3
aWxsIGZpeC4gVGhhbmtzLg0KDQo+ID4gK3N0YXRpYyBpbnQgcnQ3NjZfc2RjYV9wY21faHdfcGFy
YW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbQ0KPiAqc3Vic3RyZWFtLA0KPiA+ICsJCQkJc3Ry
dWN0IHNuZF9wY21faHdfcGFyYW1zICpwYXJhbXMsDQo+ID4gKwkJCQlzdHJ1Y3Qgc25kX3NvY19k
YWkgKmRhaSkNCj4gPiArew0KPiANCj4gPiArDQo+ID4gKwkvKiBzZXQgc2FtcGxpbmcgZnJlcXVl
bmN5ICovDQo+ID4gKwlzd2l0Y2ggKGRhaS0+aWQpIHsNCj4gPiArCWNhc2UgUlQ3NjZfQUlGMToN
Cj4gPiArCQlyZWdtYXBfd3JpdGUocnQ3NjYtPnJlZ21hcCwNCj4gPiArCQkJUlQ3NjZfU0RDQV9D
VEwoVUFKLCBDUzQxLA0KPiBTRENBX0NUTF9DU19TQU1QTEVSQVRFSU5ERVgpLA0KPiA+ICsJCQlz
YW1wbGluZ19yYXRlKTsNCj4gPiArCQlyZWdtYXBfd3JpdGUocnQ3NjYtPnJlZ21hcCwNCj4gPiAr
CQkJUlQ3NjZfU0RDQV9DVEwoVUFKLCBDUzM2LA0KPiBTRENBX0NUTF9DU19TQU1QTEVSQVRFSU5E
RVgpLA0KPiA+ICsJCQlzYW1wbGluZ19yYXRlKTsNCj4gPiArCQlicmVhazsNCj4gDQo+IEFyZSB0
aGVzZSBzZXBhcmF0ZSBwbGF5YmFjay9jYXB0dXJlIGNsb2Nrcz8gIElmIHNvIHNob3VsZCB3ZSBv
bmx5IGJlDQo+IHByb2dyYW1taW5nIHRoZSBvbmUgdGhhdCdzIGFjdGl2ZSwgb3IgaWYgdGhleSBo
YXZlIHRvIGJlIGluIHN5bmMgc2hvdWxkIHRoZSBEQUkNCj4gYmUgZmxhZ2dlZCBhcyBuZWVkaW5n
IHN5bW1ldHJpYyByYXRlcz8NCg0KV2lsbCBhZGQgc3ltbWV0cmljX3JhdGUgPSAxIGZvciB0aGlz
IERBSS4NCg0KPiA+ICtpbnQgcnQ3NjZfc2RjYV9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IHJlZ21hcCAqcmVnbWFwLCBzdHJ1Y3QNCj4gPiArc2R3X3NsYXZlICpzbGF2ZSkgew0KPiAN
Cj4gPiArCQkJcmF0ZXMgPSBydDc2Nl9maW5kX2R0X3JhdGVzKGRldiwgZnVuY19kYXRhX3B0ciwg
IklUIDQxIik7DQo+ID4gKwkJCWlmIChyYXRlcykNCj4gPiArCQkJCXJ0NzY2X3NkY2FfZGFpW1JU
NzY2X0RBSV9VQUpdLnBsYXliYWNrLnJhdGVzID0gcmF0ZXM7DQo+ID4gKw0KPiA+ICsJCQlyYXRl
cyA9IHJ0NzY2X2ZpbmRfZHRfcmF0ZXMoZGV2LCBmdW5jX2RhdGFfcHRyLCAiT1QgMzYiKTsNCj4g
PiArCQkJaWYgKHJhdGVzKQ0KPiA+ICsJCQkJcnQ3NjZfc2RjYV9kYWlbUlQ3NjZfREFJX1VBSl0u
Y2FwdHVyZS5yYXRlcyA9IHJhdGVzOw0KPiANCj4gVGhpcyBzaG91bGQgbW9kaWZ5IGEgbG9jYWwg
Y29weSByYXRoZXIgdGhhbiB0aGUgZ2xvYmFsIGluIGNhc2UgdGhlcmUncyBtdWx0aXBsZQ0KPiBk
ZXZpY2VzIHdpdGggZGlmZmVyZW50IGNvbmZpZ3MuDQoNCldpbGwgZml4Lg0K
