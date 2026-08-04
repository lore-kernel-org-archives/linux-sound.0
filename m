Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689BF44D01F
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840185; cv=none; b=SMuFHfR6z5xMB/Ucdzkf5CMiYDNHSwOw9R/3EaN+stmukq87e1Q6N1psPq6PxAxUKYOiOjKt6EKB+nvR9tWZAPkxwF30lpePsC8ReTahd5qRv3XM//C0SvF7l98ejvcK9OKsxMHSuCRQFaDF8MPGWJSWnlR46pvVgkZ5OvRB72I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840185; c=relaxed/simple;
	bh=1BnYQ/a7UbfL9Be5m3tPwESsD/Qn/PlY2mefjPGtCTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DN8of0iqJ8nWpI0UvpYatOU+zhuPUteY+Gck+oCYNzGkc+C500sDeaQSmiRU3WHOkH3iva0q/UNaCimpIzei2fsQAKmmwe/VgdJi9Yenh8u34LR0Ho/Z2w8mH2t5rLQr/TFeV5rqWFQALkvVSegfBiajZhFB0LGUvhXP3PVLiw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=kl+gvare; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="kl+gvare"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 674AgNeyD987884, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785840143; bh=1BnYQ/a7UbfL9Be5m3tPwESsD/Qn/PlY2mefjPGtCTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=kl+gvareHz4LxIcgjuBkbrAfkwav2KhCPi/itTTBV+paRk2YS/eofks0oW4leXY9D
	 HWgLxE6sLhgDjkoLAf6liMrrsvCNlN9ZN4m3pId2H8ixOQy4oxJAD+4Dn8++LLBXhn
	 KiatwafOoB6vt5MdRh0d7mWTKmscsWH4eH8gHiaeurnabdn7zt+UhBbQkIc9zw8R/a
	 KLUT9IY0UXFnA7XUs4D7CWiNnmssmRhsKNQwzafxBlg6TOmZQHsjAied6Wx3WTcf3L
	 ArAC3oaB8yD6pCJxRW7MCsETRKhEn7nPEcciOwzhvWzcsxRtYBz0rEvVzC/phx31PI
	 e33tY2V/hPMOg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 674AgNeyD987884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Aug 2026 18:42:23 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Aug 2026 18:42:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Tue, 4 Aug 2026 18:42:22 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>, =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>
Subject: RE: [PATCH v4] ASoC: rt766: add RT766/RT767 SDCA driver
Thread-Topic: [PATCH v4] ASoC: rt766: add RT766/RT767 SDCA driver
Thread-Index: AQHdIycEYuI4XYt32UmeXSh/m9xZkbaNLDkAgACI9gA=
Date: Tue, 4 Aug 2026 10:42:22 +0000
Message-ID: <388eb77fd7144ba28ccb02d54e5ec5c9@realtek.com>
References: <20260803090355.381491-1-shumingf@realtek.com>
 <anG/WjB5sCbaEEFC@opensource.cirrus.com>
In-Reply-To: <anG/WjB5sCbaEEFC@opensource.cirrus.com>
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

PiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgaW5pdGlhbCBTRENBIG11bHRpLWZ1bmN0aW9uIGNvZGVj
IGRyaXZlciBmb3IgdGhlIFJUNzY2DQo+IGFuZCBSVDc2Ny4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFNodW1pbmcgRmFuIDxzaHVtaW5nZkByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiArc3Rh
dGljIGludCBydDc2Nl9zZGNhX2lycV9jdGwoc3RydWN0IHJ0NzY2X3NkY2FfcHJpdiAqcnQ3NjYs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QNCj4gc2RjYV9mdW5jdGlvbl9kYXRhICpmdW5jdGlvbiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdA0K
PiBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50LA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0DQo+IHNkY2FfaW50ZXJy
dXB0X2luZm8gKmluZm8sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBib29sDQo+IGVuYWJsZWQpDQo+ID4gK3sNCj4gPiArICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcnQ3NjYtPnNsYXZlLT5kZXY7DQo+ID4gKyAgICAgc3RydWN0
IHNkY2FfaW50ZXJydXB0ICppbnRlcnJ1cHQ7DQo+ID4gKyAgICAgc3RydWN0IHNkY2FfY29udHJv
bCAqY29udHJvbDsNCj4gPiArICAgICBzdHJ1Y3Qgc2RjYV9lbnRpdHkgKmVudGl0eTsNCj4gPiAr
ICAgICBpcnFfaGFuZGxlcl90IGhhbmRsZXI7DQo+ID4gKyAgICAgaW50IGksIGosIGlycSwgcmV0
Ow0KPiA+ICsNCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgZnVuY3Rpb24tPm51bV9lbnRpdGll
czsgaSsrKSB7DQo+ID4gKyAgICAgICAgICAgICBlbnRpdHkgPSAmZnVuY3Rpb24tPmVudGl0aWVz
W2ldOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBlbnRpdHktPm51
bV9jb250cm9sczsgaisrKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbnRyb2wgPSAm
ZW50aXR5LT5jb250cm9sc1tqXTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgaXJxID0gY29u
dHJvbC0+aW50ZXJydXB0X3Bvc2l0aW9uOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgc3dpdGNoIChTRENBX0NUTF9UWVBFKGVudGl0eS0+dHlwZSwNCj4gY29udHJvbC0+c2VsKSkg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjYXNlIFNEQ0FfQ1RMX1RZUEVfUyhHRSwgREVU
RUNURURfTU9ERSk6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGFuZGxlciA9
IHJ0NzY2X3NkY2FfaXJxX2pkX2hhbmRsZXI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNhc2UgU0RDQV9DVExfVFlQ
RV9TKEhJREUsDQo+IEhJRFRYX0NVUlJFTlRPV05FUik6DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaGFuZGxlciA9IHJ0NzY2X3NkY2FfaXJxX2J0bl9oYW5kbGVyOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBkZWZhdWx0Og0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBpbnRlcnJ1cHQgPSAmaW5mby0+aXJxc1tpcnFdOw0KPiA+ICsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgaWYgKGVuYWJsZWQpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXQgPSBzZGNhX2lycV9kYXRhX3BvcHVsYXRlKGRldiwNCj4gcnQ3NjYtPnJlZ21h
cCwgY29tcG9uZW50LA0KPiA+ICsNCj4gZnVuY3Rpb24sIGVudGl0eSwgY29udHJvbCwNCj4gPiAr
DQo+IGludGVycnVwdCk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJl
dCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC0+cHJp
diA9IHJ0NzY2Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNkY2Ff
aXJxX3JlcXVlc3QoZGV2LCBpbmZvLCBpcnEsDQo+IGludGVycnVwdC0+bmFtZSwNCj4gPiArDQo+
IGhhbmRsZXIsIGludGVycnVwdCk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2
X2VycihkZXYsICJmYWlsZWQgdG8NCj4gcmVxdWVzdCBpcnEgJXM6ICVkXG4iLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtPm5hbWUs
DQo+IHJldCk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZGNh
X2lycV9jbGVhbnVwX2xhdGUoZGV2LA0KPiBmdW5jdGlvbiwgaW5mbyk7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
ZXZfZGJnKGRldiwgIlJlcXVlc3RpbmcgSVJRICVkDQo+IEludGVycnVwdE5hbWU9JXNcbiIsIGly
cSwgaW50ZXJydXB0LT5uYW1lKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZGNhX2lycV9mcmVlKGRldiwgaW5m
bywgaXJxLA0KPiBpbnRlcnJ1cHQtPm5hbWUsIGludGVycnVwdCk7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGV2X2RiZyhkZXYsICJGcmVlaW5nIElSUSAlZFxuIiwgaXJxKTsN
Cj4gDQo+IFlvdSBjYW4gc3RpbGwgbGVhayB0aGUgbmFtZSBoZXJlLCBpZiB0aGUgbWFjaGluZSBk
cml2ZXIgd2FzIHRvDQo+IGNhbGw6DQo+IA0KPiBydDc2Nl9zZGNhX3NldF9qYWNrX2RldGVjdChj
b21wb25lbnQsIGphY2ssIGRhdGEpOw0KPiBydDc2Nl9zZGNhX3NldF9qYWNrX2RldGVjdChjb21w
b25lbnQsIE5VTEwsIE5VTEwpOw0KPiBydDc2Nl9zZGNhX3NldF9qYWNrX2RldGVjdChjb21wb25l
bnQsIGphY2ssIGRhdGEpOw0KPiANCj4gSSBtZWFuIGlmIHdlIGFyZSBoYXBweSB0aGF0IHdpbGwg
bmV2ZXIgaGFwcGVuIEkgZ3Vlc3MgaXRzIGZpbmUsIGJ1dCBnaXZlbiB3ZQ0KPiBhbGxvdyB0aGUg
bWFjaGluZSBkcml2ZXIgdG8gY2xlYXIgdGhlIElSUSBzZWVtcyB3aXNlIHRvIGFsbG93IGl0IHRv
IHJlLWFsbG9jYXRlDQo+IGl0IHRvby4NCg0KV2lsbCBmaXgsIHRoYW5rcyBmb3IgcG9pbnRpbmcg
aXQgb3V0Lg0KDQo+IFRoYW5rcywNCj4gQ2hhcmxlcw0K
