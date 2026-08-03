Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8B3932FF
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 06:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737984; cv=none; b=dN7xvUdxzR4/Brma7Ihl/yBku2s9BbUBLt852zeybjNfQzP/IeTWe5Bj6KCWlpZDfqMYpvrSXGnfPlKQj46QVu2m0Xh2SoToxSHvqop7GV0awRfeqM3YEj/icHuw8GeCk1HQLm8LInl5bJVCw/siqULld6r88gP6K8Dyy/xn/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737984; c=relaxed/simple;
	bh=gJMfjaCUNPsgoVPSLjgSvpnOdKC/q5dHLM1U/9TGOZM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W9i9nJDN+r/QvoJ1FEcWh3oylJJKtuQbGVza1wexrD9iUez936WPp5txAg68B4NcpD9NxEVckGRDgukqmjAAwUQQXkU7mTimkQbcxrseUmi9sQwnYj20p7wgUf+xpeZHE9cuj8J5wVSQAwvtH6zPOj5u1VVPHPendzh6WrADIqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Esi+ae3i; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Esi+ae3i"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6736J2ohC059327, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785737942; bh=gJMfjaCUNPsgoVPSLjgSvpnOdKC/q5dHLM1U/9TGOZM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Esi+ae3iizXI55xW2RNiw9fzqTAisF0IgUgW9dTqu7gNg5sJVLsLPesvReVRi2Hk0
	 uwLU5P1S7/w0ofKHPrCXSUtvtUAKOmfZ1y7TxLX0Kop4Z4C/YhJam2hESDUs1hnSvy
	 d3sUk3C7PRvixH5oq6TUXmu776urXaC/vyH0PwIWOkcBix55zq+CGXa1tud8MuhmfL
	 z1lMyLcD0/CwPpuKtwurKR8BDbDUvim/CEIxaiSL0RndiUbPGBrDcCMN/NMid79jcL
	 U86GzFCZehCzTce+/lShNm8cmqr1Umnjy3LUe/45lxZVIyTKJcssLJ1iwPZX8QGxiE
	 ykvXWzGkM9YCg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6736J2ohC059327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Aug 2026 14:19:02 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 3 Aug 2026 14:19:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 3 Aug 2026 14:19:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Mon, 3 Aug 2026 14:19:03 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>, =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>
Subject: RE: [PATCH v3] ASoC: rt766: add RT766/RT767 SDCA driver
Thread-Topic: [PATCH v3] ASoC: rt766: add RT766/RT767 SDCA driver
Thread-Index: AQHdIMx1LSrA1zXxVkqmdAx2nPYM6LaHLvWAgASuuIA=
Date: Mon, 3 Aug 2026 06:19:02 +0000
Message-ID: <83a748883695468eafd125be3c90d5e3@realtek.com>
References: <20260731091037.4144022-1-shumingf@realtek.com>
 <amy1NRAeDxB683hr@opensource.cirrus.com>
In-Reply-To: <amy1NRAeDxB683hr@opensource.cirrus.com>
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

PiA+ICtzdGF0aWMgaW50IHJ0NzY2X3NkY2FfaXJxX2N0bChzdHJ1Y3QgcnQ3NjZfc2RjYV9wcml2
ICpydDc2NiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdA0KPiBzZGNhX2Z1bmN0aW9uX2RhdGEgKmZ1bmN0aW9uLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0DQo+IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QNCj4gc2Rj
YV9pbnRlcnJ1cHRfaW5mbyAqaW5mbywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wNCj4gZW5hYmxlZCkNCj4gPiArew0KPiA+
ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZydDc2Ni0+c2xhdmUtPmRldjsNCj4gPiArICAg
ICBzdHJ1Y3Qgc2RjYV9pbnRlcnJ1cHQgKmludGVycnVwdDsNCj4gPiArICAgICBzdHJ1Y3Qgc2Rj
YV9jb250cm9sICpjb250cm9sOw0KPiA+ICsgICAgIHN0cnVjdCBzZGNhX2VudGl0eSAqZW50aXR5
Ow0KPiA+ICsgICAgIGlycV9oYW5kbGVyX3QgaGFuZGxlcjsNCj4gPiArICAgICBpbnQgaSwgaiwg
aXJxLCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBmdW5jdGlvbi0+bnVt
X2VudGl0aWVzOyBpKyspIHsNCj4gPiArICAgICAgICAgICAgIGVudGl0eSA9ICZmdW5jdGlvbi0+
ZW50aXRpZXNbaV07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IGVu
dGl0eS0+bnVtX2NvbnRyb2xzOyBqKyspIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29u
dHJvbCA9ICZlbnRpdHktPmNvbnRyb2xzW2pdOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBp
cnEgPSBjb250cm9sLT5pbnRlcnJ1cHRfcG9zaXRpb247DQo+ID4gKw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBzd2l0Y2ggKFNEQ0FfQ1RMX1RZUEUoZW50aXR5LT50eXBlLA0KPiBjb250cm9s
LT5zZWwpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNhc2UgU0RDQV9DVExfVFlQRV9T
KEdFLCBERVRFQ1RFRF9NT0RFKToNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBo
YW5kbGVyID0gcnQ3NjZfc2RjYV9pcnFfamRfaGFuZGxlcjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY2FzZSBTRENB
X0NUTF9UWVBFX1MoSElERSwNCj4gSElEVFhfQ1VSUkVOVE9XTkVSKToNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBoYW5kbGVyID0gcnQ3NjZfc2RjYV9pcnFfYnRuX2hhbmRsZXI7
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGRlZmF1bHQ6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGludGVycnVwdCA9ICZpbmZvLT5pcnFzW2lycV07DQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICBpZiAoZW5hYmxlZCkgew0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldCA9IHNkY2FfaXJxX2RhdGFfcG9wdWxhdGUoZGV2LA0KPiBydDc2
Ni0+cmVnbWFwLCBjb21wb25lbnQsDQo+ID4gKw0KPiBmdW5jdGlvbiwgZW50aXR5LCBjb250cm9s
LA0KPiA+ICsNCj4gaW50ZXJydXB0KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJy
dXB0LT5wcml2ID0gcnQ3NjY7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0gc2RjYV9pcnFfcmVxdWVzdChkZXYsIGluZm8sIGlycSwNCj4gaW50ZXJydXB0LT5uYW1lLA0K
PiA+ICsNCj4gaGFuZGxlciwgaW50ZXJydXB0KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAocmV0KSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0bw0KPiByZXF1ZXN0IGlycSAlczogJWRcbiIsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVw
dC0+bmFtZSwNCj4gcmV0KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9kYmcoZGV2LCAiUmVxdWVzdGluZyBJ
UlEgJWQNCj4gSW50ZXJydXB0TmFtZT0lc1xuIiwgaXJxLCBpbnRlcnJ1cHQtPm5hbWUpOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNkY2FfaXJxX2ZyZWUoZGV2LCBpbmZvLCBpcnEsDQo+ID4gKyBpbnRlcnJ1cHQt
Pm5hbWUsIGludGVycnVwdCk7DQo+IA0KPiBZb3UgbmVlZCB0byBhbHNvIGZyZWUgdGhlIElSUSBu
YW1lIGFsbG9jYXRlZCBieQ0KPiBzZGNhX2lycV9kYXRhX3BvcHVsYXRlKCkgaGVyZSBvciBpdCB3
aWxsIGxlYWsgaWYgdGhlIGphY2sgaXMgcmUtZW5hYmxlZC4NCg0KVGhhbmtzIGZvciByZXZpZXcu
DQpJIHdpbGwgY2FsbCBzZGNhX2lycV9jbGVhbnVwKCkgdG8gZnJlZSB0aGUgSVJRLg0KDQo+ID4g
K3N0YXRpYyB2b2lkIHJ0NzY2X3NkY2FfcmVtb3ZlKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAq
Y29tcG9uZW50KSB7DQo+ID4gKyAgICAgc3RydWN0IHJ0NzY2X3NkY2FfcHJpdiAqcnQ3NjYgID0N
Cj4gPiArc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50KTsNCj4gPiArDQo+
ID4gKyAgICAgc2RjYV9pcnFfY2xlYW51cChjb21wb25lbnQtPmRldiwgcnQ3NjYtPnVhal9mdW5j
X2RhdGEsDQo+IHJ0NzY2LT5pcnFfaW5mbyk7DQo+ID4gKyAgICAgc2RjYV9pcnFfY2xlYW51cChj
b21wb25lbnQtPmRldiwgcnQ3NjYtPmhpZF9mdW5jX2RhdGEsDQo+ID4gK3J0NzY2LT5pcnFfaW5m
byk7IH0NCj4gDQo+IFRoZXNlIHNob3VsZCBiZSBzZGNhX2lycV9jbGVhbnVwX2xhdGUoKSwgdG8g
ZW5zdXJlIHRoZXkgZnJlZSB0aGUgbmFtZXMgYXMNCj4gd2VsbC4gQWx0aG91Z2gsIHdvcnRoIG5v
dGluZyB0aGlzIG9ubHkgZG9lcyBhbnl0aGluZyBpZg0KPiBydDc2Nl9zZGNhX3NldF9qYWNrX2Rl
dGVjdCgpIGRpZG4ndCBhbHJlYWR5IGNsZWFuIGV2ZXJ5dGhpbmcgdXAsIG5vdCBzdXJlIGlmDQo+
IHRoYXQgaXMgZ3VhcmFudGVlZCBvciBub3QuDQoNClN1cmUsIHdpbGwgdXNlIHNkY2FfaXJxX2Ns
ZWFudXBfbGF0ZSgpLg0KDQo+IFRoYW5rcywNCj4gQ2hhcmxlcw0K
