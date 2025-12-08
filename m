Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3BB67A;
	Mon,  8 Dec 2025 05:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765173374; cv=none; b=VIRsAYBsdCgJR2QzyxZnMxhcgsSu4+bKsRUDZvoPpZtpwAY1h8x0iO81+0jChIN3CZGiCCJIKTaQ8L7JfH/WKFV4HjE+U+AEQaIh45cUz7U1dE5Vn65jiBToGrE3Qw3fl5jGRHCnC0h4QIIDa/7eXUC44NHgMxVBuADHxyd1//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765173374; c=relaxed/simple;
	bh=EqdCuYh60ICB+VnZZ8RAriuFMePctRfxZN3C6KTIH2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H/rRTnGKmVob+5TzPlYFZ7OjNfqi6Hgu6MCN+aHDYdShzMtUx/VAFknoqN97hFQUeWzg0b2f9cEHjqqr3u9zC/37HCs+qj5n0pVZME79l8SFVlHagsHNSZEMxT1dz3S4dCcdU0GdrbB89X3Clj6zfm7LlfwiHbEKP5cYpP1LVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=fail (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Nhkvz3Cd reason="signature verification failed"; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Nhkvz3Cd"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5B85tghT73468989, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765173342; bh=EqdCuYh60ICB+VnZZ8RAriuFMePctRfxZN3C6KTIH2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Nhkvz3CdDJxomrfqN8WoJT6un91M2DfMGWIf+AclRHYeJJ2eHehcfwSCH1D2S7c4L
	 whhk96Df9ys/rAnS6K91O/YAh5ZeTPyrbN1zuWeW0cDVWOCSPB2Md1fuEFU3OY+iDP
	 RDydH2JcT2DqVZvLq1FcIhjvAZnNBGjXOaxj8r+LyLm+GqXN52l9UinqcJyfseE7nK
	 QdgsPclmTiYsBn9J0D8H0ajSBwwbfCls8G61tYqU1Wn7t1ROkUKXsGa6HbfePRrRVd
	 E+HXC+XalgF0A0TUoQd/m+2diotQygrTDtI+cH8/XzRMavCZIC6Wr/+P6shWRzK59V
	 hpWRPxH5t5sxA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5B85tghT73468989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 13:55:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 8 Dec 2025 13:55:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 8 Dec 2025 13:55:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::2fa5:eccb:34ee:7bb%10]) with mapi id
 15.02.1544.027; Mon, 8 Dec 2025 13:55:42 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
CC: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "perex@perex.cz" <perex@perex.cz>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Flove(HsinFu)"
	<flove@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?=
	<shumingf@realtek.com>,
        Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH v8 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Thread-Topic: [PATCH v8 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Thread-Index: AQHcYrFaKydGtVTIOUeezPiWPUvKu7USN3yAgAAAOwCABQqdwA==
Date: Mon, 8 Dec 2025 05:55:41 +0000
Message-ID: <d78ec6446eab41349c55d6952de80275@realtek.com>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-3-oder_chiou@realtek.com>
 <20251205-stylish-numbat-of-awe-10edcd@quoll>
 <8e537cb4-08a0-4ecb-90f5-01ff2d4b32f8@kernel.org>
In-Reply-To: <8e537cb4-08a0-4ecb-90f5-01ff2d4b32f8@kernel.org>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgNSwgMjAyNSA0OjMy
IFBNDQo+IFRvOiBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29tPg0KPiBDYzogY2V6
YXJ5LnJvamV3c2tpQGludGVsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21h
aWwuY29tOw0KPiByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRA
a2VybmVsLm9yZzsgcGVyZXhAcGVyZXguY3o7DQo+IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZzsgRmxvdmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+OyBTaHVtaW5nIFutUw0KPiCu
0bvKXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29t
PjsgRGVyZWsgW6TovHcNCj4guHFdIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY4IDIvMl0gQVNvQzogZHQtYmluZGluZ3M6IHJlYWx0ZWsscnQ1NTc1OiBh
ZGQgYmluZGluZ3MgZm9yDQo+IEFMQzU1NzUNCj4gDQo+IA0KPiBFeHRlcm5hbCBtYWlsIDogVGhp
cyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QN
Cj4gcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+
IA0KPiANCj4gT24gMDUvMTIvMjAyNSAwOTozMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToN
Cj4gPg0KPiA+PiArDQo+ID4+ICsgIHJlZzoNCj4gPj4gKyAgICBtYXhJdGVtczogMQ0KPiA+PiAr
DQo+ID4NCj4gPiBZb3UgbGlzdGVkIHNvIG1hbnkgImltcHJlc3NpdmUiIGFuZCAicmljaCIgZmVh
dHVyZXMgdGhhdCBmb3Igc3VyZSB0aGlzDQo+ID4gaXMgaW5jb21wbGV0ZS4NCj4gPg0KPiA+IFBs
ZWFzZSBwb3N0IGNvbXBsZXRlIGJpbmRpbmdzIGZvciAiaW1wcmVzc2l2ZSIgZGV2aWNlLg0KPiA+
DQo+ID4gWW91IG1pc3Mgc3VwcGxpZXMsIHlvdSBtaXNzIGFsbCB0aGUgQUkgcmVsYXRlZCBoeXBl
IChubyBjbHVlIHdoYXQgdGhhdA0KPiA+IHdvdWxkIGJlLCBidXQgZm9yIHN1cmUgTlBVIGZlZWxz
IGxpa2UgbmVlZGluZyByZW1vdGVwcm9jIG9yIGF0IGxlYXN0DQo+ID4gc29tZSBvdGhlciB3YXkg
dG8gY29tbXVuaWNhdGUpLiBXZSBhbGwga25vdyB0aGF0IEFJIGlzIHBvd2VyIGh1bmdyeSwNCj4g
PiBzbyBpdCBpcyBpbXBvc3NpYmxlIHRvIHJ1biBpdCB3aXRob3V0IGVsZWN0cmljaXR5ICh0aHVz
IHN1cHBsaWVzKS4NCj4gPg0KPiANCj4gQWxzbyB0d28gc3RhbmRhcmQgbml0cywgaW4gY2FzZSBJ
IGRpZCBub3QgYXNrIGFib3V0IHRoZW0gYmVmb3JlOg0KPiANCj4gQSBuaXQsIHN1YmplY3Q6IGRy
b3Agc2Vjb25kL2xhc3QsIHJlZHVuZGFudCAiYmluZGluZ3MiLiBUaGUgImR0LWJpbmRpbmdzIiBw
cmVmaXgNCj4gaXMgYWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhlc2UgYXJlIGJpbmRpbmdzLg0KPiBT
ZWUgYWxzbzoNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTctcmMzL3Nv
dXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmkNCj4gbmRpbmdzL3N1Ym1pdHRpbmctcGF0
Y2hlcy5yc3QjTDE4DQoNClRoZSBzdWJqZWN0IHdpbGwgYmUgY2hhbmdlIHRvDQpBU29DOiBkdC1i
aW5kaW5nczogcmVhbHRlayxydDU1NzU6IGFkZCBzdXBwb3J0IGZvciBBTEM1NTc1DQoNCj4gUGxl
YXNlIG9yZ2FuaXplIHRoZSBwYXRjaCBkb2N1bWVudGluZyB0aGUgY29tcGF0aWJsZSAoRFQgYmlu
ZGluZ3MpIGJlZm9yZQ0KPiB0aGUgcGF0Y2ggdXNpbmcgdGhhdCBjb21wYXRpYmxlLg0KPiBTZWUg
YWxzbzoNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTQtcmM2L3NvdXJj
ZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmkNCj4gbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hl
cy5yc3QjTDQ2DQoNCkkgd2lsbCByZW9yZGVyIHRoZSBwYXRjaGVzIHNvIHRoYXQgdGhlIERUIGJp
bmRpbmdzIGNvbWUgZmlyc3QuDQoNClRoYW5rcy4NCg0K
