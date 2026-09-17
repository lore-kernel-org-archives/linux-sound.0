Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0276C299A82
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 06:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626275; cv=none; b=MQ2yySoIF+5Ec36frevDC03C2KB+8ScfG2+sp9J0o4GurQs2K1j1gJ5Z+raxqm3KzKuOa6VYQcFT7bJrd6ttFWOzjupfHfNHb9W3u0f9jGrg0GtPw9yz/KXVcRiCJQ3FnTrIXqG3c8T0YeP8oTJBnPx7SRO0qmpBafrmJvx045M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626275; c=relaxed/simple;
	bh=gRryFmSQ1tMi4eepV0V12vk4Ck8G+3DWzHU4u74HfKU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aWX1DL+xpJjjEPv2inkmyQMm5ROV4weANkaTiuJ3HJXdVsoOjR+1JshJoMkQkSzr4K+InrnrHbrd8S331vRzV3KlPvx1i+yP+jgVD2Xtf98aAXYjXq7nIrzR1MyMYIco/0fiuMXjMSNNLV6mp88eUcAdeuyM3dcyNagHflDoWQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Pjtg1XNt; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Pjtg1XNt"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68H6O7nnC3058782, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1789626247; bh=gRryFmSQ1tMi4eepV0V12vk4Ck8G+3DWzHU4u74HfKU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Pjtg1XNt4mhNMiI+MQcPf4PL47SyJHkDezoT/DgRdsuOAWQKPdzuuOUOIne9X/CJl
	 mxS5UwT6ItuSCKOETiEGVxbiT7h5Uv17vwpJc2nsZbK9/KKsyBrNbILP/5zBKQgCWC
	 aSAI3MXUYKWGbVzjVY514YRK6lmQ9EXIsLyuBqs/+nQsiyoytQbl6OnB1VG5Ff0d0b
	 JW7o5CaWveW//vRQcgesJmyS2lAiLVZ3/3tmoppeFANRP/xb5UH5SRxGTexrcSiJZS
	 7AzZXj3VKmGpYxBeR12spAnSPaoa+IFUjOsSYDM5Q99GKc00KO6Qxc7zwDRi80buJm
	 LHKfwloBF6MLA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68H6O7nnC3058782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Sep 2026 14:24:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 17 Sep 2026 14:24:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 17 Sep 2026 14:24:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Thu, 17 Sep 2026 14:24:06 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>, =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: rt712: add GPIOs for LED control
Thread-Topic: [PATCH] ASoC: rt712: add GPIOs for LED control
Thread-Index: AQHdRbxIAPU0WEF84kS7Yg+BDGvqC7bRNhIAgACSnKA=
Date: Thu, 17 Sep 2026 06:24:06 +0000
Message-ID: <6c0f94dee95c474d8fd7b5ad486f372a@realtek.com>
References: <20260916090513.2294466-1-shumingf@realtek.com>
 <3afc23b2-6072-4b65-b3e5-88cee7bf6997@sirena.org.uk>
In-Reply-To: <3afc23b2-6072-4b65-b3e5-88cee7bf6997@sirena.org.uk>
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

PiA+ICsJZGV2X2RiZygmcnQ3MTItPnNsYXZlLT5kZXYsICIlczogZ3Bpb19waW49JWRcbiIsIF9f
ZnVuY19fLA0KPiA+ICtncGlvX3Bpbik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcG1fcnVudGltZV9y
ZXN1bWUocnQ3MTItPmNvbXBvbmVudC0+ZGV2KTsNCj4gPiArCWlmIChyZXQgPCAwICYmIHJldCAh
PSAtRUFDQ0VTKQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+IA0KPiBUaGlzIHBtX3J1bnRpbWVfcmVz
dW1lKCkgdXNhZ2UgY2FuIHJhY2Ugd2l0aCBhdXRvc3VzcGVuZCwgaWYgdGhlDQo+IGF1dG9zdXNw
ZW5kIHRpbWVyIGlzIGFib3V0IHRvIGV4cGlyZSBpdCBjb3VsZCBkbyBzbyBiZWZvcmUgd2UgYWN0
dWFsbHkgdXBkYXRlDQo+IHRoZSByZWdpc3RlciB2YWx1ZXMgc28gdGhlIHdyaXRlcyB3b24ndCBh
Y3R1YWxseSBoYXBwZW4uICBJdCdzIHZlcnkgdW5saWtlbHkgdG8NCj4gYWN0dWFsbHkgaGFwcGVu
IGJ1dCB0aGUgcmlzayBpcyB0aGVyZS4NCg0KVGhhbmtzIGZvciByZXZpZXcuIA0KSSB3aWxsIHVz
ZSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgaW5zdGVhZC4NCg0KPiA+ICsJc3dpdGNoIChn
cGlvX3Bpbikgew0KPiA+ICsJY2FzZSAzOg0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSA0Og0K
PiA+ICsJCXJ0NzEyX3NkY2FfaW5kZXhfdXBkYXRlX2JpdHMocnQ3MTIsIFJUNzEyX1ZFTkRPUl9I
REFfQ1RMLA0KPiA+ICsJCQlSVDcxMl9IREFfTEVHQUNZX0NPTkZJR19DVEwwLCAweDAwMGMsIDB4
MDAwNCk7DQo+IA0KPiBUaGlzIGRvZXNuJ3QgZG8gYW55IGxvY2tpbmcgd2l0aCBvdGhlciByZWdt
YXAgdXNlcnMgYW5kIGdwaW9saWIgd29uJ3QgaG9sZCBhDQo+IGxvY2sgZm9yIHVzIC0gc2luY2Ug
cnQ3MTJfc2RjYV9pbmRleF91cGRhdGVfYml0cygpIGlzIGEgcmVhZC9tb2RpZnkvd3JpdGUNCj4g
Y3ljbGUgdGhpcyBjb3VsZCBsZWFkIHRvIGNvcnJ1cHRpb24uDQoNClN1cmUuIE1heSBJIGFkZCBh
IGxvY2sgaW4gdGhlIGNhbGxiYWNrIGluc3RlYWQgb2Ygb25seSBsb2NraW5nIHJ0NzEyX3NkY2Ff
aW5kZXhfdXBkYXRlX2JpdHMoKT8NCkkgd2lsbCBzZW5kIHYyIGFmdGVyd2FyZC4NCg0KPiA+ICtz
dGF0aWMgdm9pZCBydDcxMl9zZGNhX2dwaW9faW5pdChzdHJ1Y3QgcnQ3MTJfc2RjYV9wcml2ICpy
dDcxMikgew0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlydDcxMi0+Z3Bpb19jaGlwID0g
cnQ3MTJfc2RjYV90ZW1wbGF0ZV9jaGlwOw0KPiA+ICsJcnQ3MTItPmdwaW9fY2hpcC5wYXJlbnQg
PSAmcnQ3MTItPnNsYXZlLT5kZXY7DQo+ID4gKwlydDcxMi0+Z3Bpb19jaGlwLmZ3bm9kZSA9IGRl
dl9md25vZGUoJnJ0NzEyLT5zbGF2ZS0+ZGV2KTsNCj4gPiArDQo+ID4gKwlyZXQgPSBkZXZtX2dw
aW9jaGlwX2FkZF9kYXRhKCZydDcxMi0+c2xhdmUtPmRldiwgJnJ0NzEyLT5ncGlvX2NoaXAsDQo+
IHJ0NzEyKTsNCj4gPiArCWlmIChyZXQgIT0gMCkNCj4gPiArCQlkZXZfZXJyKCZydDcxMi0+c2xh
dmUtPmRldiwgIkZhaWxlZCB0byBhZGQgR1BJT3M6ICVkXG4iLCByZXQpOyB9DQo+IA0KPiBUaGUg
Z3Bpb2xpYiB1c2FnZSBlaXRoZXIgbmVlZHMgdG8gYmUgY29uZGl0aW9uYWwgb24gZ3Bpb2xpYiBv
ciB3ZSBuZWVkIHRoZQ0KPiBkcml2ZXIgdG8gZGVwZW5kIG9uIGl0LiAgRWl0aGVyIGlzIGZpbmUu
DQoNCkFkZCB0aGUgJ0lTX0VOQUJMRUQoQ09ORklHX0dQSU9MSUIpJyBjaGVjayBiZWZvcmUgY2Fs
bGluZyBydDcxMl9zZGNhX2dwaW9faW5pdCgpLg0KDQo+ID4NCj4gPiArCS8qIGluaXRpYWxpemUg
R1BJT3MgKi8NCj4gPiArCXJ0NzEyX3NkY2FfZ3Bpb19pbml0KHJ0NzEyKTsNCj4gPiArDQo+ID4g
IAlpZiAoIXJ0NzEyLT5maXJzdF9od19pbml0KQ0KPiA+ICAJCXJldHVybiAwOw0KPiA+DQo+IA0K
PiBUaGlzIHdpbGwgaGFwcGVuIGV2ZXJ5IHRpbWUgdGhlIGNhcmQgYmluZHMgYW5kIHVzZXMgZGV2
bSwgSSdkIGV4cGVjdCBpdCB0bw0KPiBoYXBwZW4gd2hlbiB0aGUgU291bmRXaXJlIGRldmljZSBi
aW5kcyByYXRoZXIgdGhhbiBkdXJpbmcgQVNvQyBsZXZlbA0KPiBpbml0aWFsaXNhdGlvbi4gIFdl
IGRvbid0IHdhbnQgdG8gY29udGludWFsbHkgcmVnaXN0ZXIgYW5kIHVucmVnaXN0ZXIgdGhlIEdQ
SU9zLg0KDQpXaWxsIG1vdmUgdG8gc2R3X2RyaXZlci5wcm9iZSgpLg0KDQo+ID4gQEAgLTI3MSw3
ICsyNzYsNiBAQCBlbnVtIHsNCj4gPiAgCVJUNzEyX0NMS19GUkVRXzIyXzU3OTJNSFogPSA0LA0K
PiA+ICB9Ow0KPiA+DQo+ID4gLQ0KPiA+ICBpbnQgcnQ3MTJfc2RjYV9pb19pbml0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IHNkd19zbGF2ZSAqc2xhdmUpOw0KPiA+IGludCBydDcxMl9zZGNh
X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcmVnbWFwICpyZWdtYXAsDQo+ID4gIAkJ
CXN0cnVjdCByZWdtYXAgKm1icV9yZWdtYXAsIHN0cnVjdCBzZHdfc2xhdmUgKnNsYXZlKTsNCj4g
DQo+IFVucmVsYXRlZCB3aGl0ZXNwYWNlIGNoYW5nZS4NCg0KV2lsIGZpeA0K
