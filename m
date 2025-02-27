Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812273209
	for <linux-sound@vger.kernel.org>; Thu, 27 Feb 2025 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740633148; cv=none; b=lN8LxY3Tb69mfXcHkaMGno1uSZuEgMIWY8cP9Uwq1C08rAU6A9riu+QxgFwvmmO8YW9hCNFA0oOWy+EThXgVdcjth+cnP26e5wK0Zl9kRKSYu2QvksrCBmh7t/OdR+XSf6iWBLrR9UG7CoZZCDAyBE014E5a1wk//75xV1724+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740633148; c=relaxed/simple;
	bh=2K5YTLRdxhmfdJEU/2YeRb+HY4/zm9ltaGJbQYX3Abc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aR35cd1pOstf24lddmOHD7t1BGOP3qeiLa7dLZiXhdQg/1YA1P1W6GnpGH98eXTf9Dka/gNbVh/mlZFJDKBAZyJ4gXEUkEelqHPO0Apc0aySTfAKq2+fjMvNVfr+i1JlKgEZSqLHc6Euzjaz205C7s/K5ecdROZ9tHSz1MD39Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=ZllENAng; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="ZllENAng"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 51R5Bff461228627, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1740633101; bh=2K5YTLRdxhmfdJEU/2YeRb+HY4/zm9ltaGJbQYX3Abc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ZllENAnggwTrCreE4tO/LUROHmGg1jar2yXf5whO2oielIm4oZR+3Oe/vfY5Ku81t
	 O79T9GmvO6wkL1gIjGKzjOGMXn/SUXkxcSUEjRC8sDJJFBxYWw6dDyRViULDC+f88w
	 +CLVtI0VUz3zRr/H8Sje+wbmZUMYfntkx5c46DHWbagFCZb0XX9Ae4HNHbfp/Qapbm
	 qvd9YEz6QXz/sMFICUwILqjX3ww9B78vh1LbpO6U5I6+DzUdUfsdVIpgCBJmjUBH/m
	 T9jRQ16JsKeMF22DmhZuooCRfKpBqTSwWtwHDV7HpbhAKNAVQNgSjh2PYdOVaTfPML
	 kMVamaGxG18EQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 51R5Bff461228627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 13:11:41 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Feb 2025 13:11:41 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 27 Feb 2025 13:11:41 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Thu, 27 Feb 2025 13:11:41 +0800
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
        =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
	<shumingf@realtek.com>,
        Jack Yu <jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of device_id tables
Thread-Topic: [PATCH 20/24] ASoC: codecs: rt1015p: Update definition of
 device_id tables
Thread-Index: AQHbg4iwYrimaa6ymEysW6pOC92G7bNRCNjAgAfPeoCAAavCAA==
Date: Thu, 27 Feb 2025 05:11:41 +0000
Message-ID: <fa960c2c016342e5addf2eba19881d64@realtek.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-21-cezary.rojewski@intel.com>
 <d1fe2ca16a7c4c9c90bdd5a8480ca497@realtek.com>
 <fcb19c07-9daf-4fa4-a856-5e8726a98873@intel.com>
In-Reply-To: <fcb19c07-9daf-4fa4-a856-5e8726a98873@intel.com>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDZXphcnkgUm9qZXdza2kgPGNl
emFyeS5yb2pld3NraUBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjYs
IDIwMjUgNTo0MiBQTQ0KPiBUbzogT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFsdGVrLmNvbT47
IGJyb29uaWVAa2VybmVsLm9yZw0KPiBDYzogdGl3YWlAc3VzZS5jb207IHBlcmV4QHBlcmV4LmN6
OyBhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbTsNCj4gbGludXgtc291bmRAdmdl
ci5rZXJuZWwub3JnOyBGbG92ZShIc2luRnUpIDxmbG92ZUByZWFsdGVrLmNvbT47DQo+IGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsgU2h1bWluZyBb6IyD5pu46YqYXQ0KPiA8c2h1
bWluZ2ZAcmVhbHRlay5jb20+OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPjsgRGVyZWsg
W+aWueW+t+e+qV0NCj4gPGRlcmVrLmZhbmdAcmVhbHRlay5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMjAvMjRdIEFTb0M6IGNvZGVjczogcnQxMDE1cDogVXBkYXRlIGRlZmluaXRpb24gb2YN
Cj4gZGV2aWNlX2lkIHRhYmxlcw0KPiANCj4gDQo+IEV4dGVybmFsIG1haWwgOiBUaGlzIGVtYWls
IG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdA0KPiByZXBs
eSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUg
dGhlIHNlbmRlciBhbmQNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IA0K
PiBPbiAyMDI1LTAyLTIxIDM6MzggQU0sIE9kZXIgQ2hpb3Ugd3JvdGU6DQo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IENlemFyeSBSb2pld3NraSA8Y2V6YXJ5LnJv
amV3c2tpQGludGVsLmNvbT4NCj4gPj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIwLCAyMDI1
IDc6MjcgUE0NCj4gPj4gVG86IGJyb29uaWVAa2VybmVsLm9yZw0KPiA+PiBDYzogdGl3YWlAc3Vz
ZS5jb207IHBlcmV4QHBlcmV4LmN6Ow0KPiBhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVs
LmNvbTsNCj4gPj4gbGludXgtc291bmRAdmdlci5rZXJuZWwub3JnOyBPZGVyIENoaW91IDxvZGVy
X2NoaW91QHJlYWx0ZWsuY29tPjsNCj4gPj4gRmxvdmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5j
b20+OyBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207DQo+ID4+IENlemFyeSBSb2pl
d3NraSA8Y2V6YXJ5LnJvamV3c2tpQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogW1BBVENIIDIw
LzI0XSBBU29DOiBjb2RlY3M6IHJ0MTAxNXA6IFVwZGF0ZSBkZWZpbml0aW9uIG9mDQo+IGRldmlj
ZV9pZA0KPiA+PiB0YWJsZXMNCj4gPj4NCj4gPj4NCj4gPj4gRXh0ZXJuYWwgbWFpbCA6IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90DQo+
ID4+IHJlcGx5LCBjbGljayBsaW5rcywgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJl
Y29nbml6ZSB0aGUgc2VuZGVyIGFuZA0KPiA+PiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+
ID4+DQo+ID4+DQo+ID4+DQo+ID4+IEZvbGxvdyBQQ0ktYmFzZWQgZm9ybWF0ICgxMEVDeHh4eCkg
Zm9yIEFDUEkgSURzIGJ5IGFkZGluZyByZWxldmFudA0KPiA+PiBlbnRyaWVzIHRvIHRoZSBleGlz
dGluZyB0YWJsZS4NCj4gPj4NCj4gPj4gV2hpbGUgYXQgaXQsIHRoZXJlIHNoYWxsIGJlIG5vIGNv
bW1hIGFmdGVyIHRoZSB0ZXJtaW5hdG9yIGVudHJ5IGFuZA0KPiA+PiBpbml0aWFsaXppbmcgZmll
bGRzIHdpdGggMCBmb3Igc3RhdGljYWxseSBkZWZpbmVkIHN0cnVjdHMgaXMgcmVkdW5kYW50Lg0K
PiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3Nr
aUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIHNvdW5kL3NvYy9jb2RlY3MvcnQxMDE1cC5j
IHwgOCArKysrKy0tLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0
MTAxNXAuYyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQxMDE1cC5jDQo+ID4+IGluZGV4IDQ0ZTdmZTNj
MzJkYS4uMzM5MTc0MzgxOTZmIDEwMDY0NA0KPiA+PiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3J0
MTAxNXAuYw0KPiA+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0MTAxNXAuYw0KPiA+PiBAQCAt
MTMzLDkgKzEzMywxMSBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBydDEwMTVwX2RldmljZV9p
ZCk7DQo+ID4+DQo+ID4+ICAgI2lmZGVmIENPTkZJR19BQ1BJDQo+ID4+ICAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhY3BpX2RldmljZV9pZCBydDEwMTVwX2FjcGlfbWF0Y2hbXSA9IHsNCj4gPj4gLSAg
ICAgICB7ICJSVEwxMDE1IiwgMH0sDQo+ID4+IC0gICAgICAgeyAiUlRMMTAxOSIsIDB9LA0KPiA+
PiAtICAgICAgIHsgfSwNCj4gPj4gKyAgICAgICB7ICJSVEwxMDE1IiB9LA0KPiA+PiArICAgICAg
IHsgIlJUTDEwMTkiIH0sDQo+ID4+ICsgICAgICAgeyAiMTBFQzEwMTUiIH0sDQo+ID4+ICsgICAg
ICAgeyAiMTBFQzEwMTkiIH0sDQo+ID4+ICsgICAgICAge30NCj4gPg0KPiA+IFRoZXJlIGFyZSBk
aWZmZXJlbnQgc2V0dGluZ3MgZm9yIFJUTDEwMTUsIFJUTDEwMTksIDEwRUMxMDE1LCBhbmQgMTBF
QzEwMTkuDQo+ID4gUlRMMTAxNSBhbmQgUlRMMTAxOSBhcmUgdXNlZCBmb3IgcG93ZXJpbmcgdXAg
YW5kIGRvd24gdmlhIHRoZSBHUElPLg0KPiA+IDEwRUMxMDE1IGFuZCAxMEVDMTAxOSBhcmUgdXNl
ZCBmb3IgdGhlIEkyQy1jb250cm9sbGVkIGRyaXZlci4NCj4gPiBUaGVyZWZvcmUgMTBFQzEwMTUg
YW5kIDEwRUMxMDE5IHNob3VsZCBiZSByZW1vdmVkLg0KPiANCj4gU29ycnkgZm9yIHRoZSBkZWxh
eSBpbiByZXNwb25zZSBhbmQgdGhhbmsgZm9yIHlvdSB0aGUgZmVlZGJhY2suDQo+IA0KPiBJJ20g
c3VycHJpc2VkIHRoaXMgaGFzbid0IGNvbWUgdXAgZWFybGllciBpbiB0aGUgZGlzY3Vzc2lvbi4g
SSdsbA0KPiBwcm9iYWJseSBjdXQgb2ZmIHByb2JsZW1hdGljIHBhdGNoZXMgc28gdGhhdCBtYWpv
cml0eSBjYW4gYmUgbWVyZ2VkLg0KPiBJdCdzIGltcG9ydGFudCB0byBoYXZlIHNvbWUgZm9sbG93
IHVwIHRob3VnaCwgb24gdGhlIHN1YmplY3QgeW91DQo+IG1lbnRpb25lZC4gQ29ycmVjdCBtZSBp
ZiBJJ20gd3JvbmcgYnV0IGZyb20gdGhlIC5jIGZpbGVzIGl0IHNlZW1zOg0KPiANCj4gZm9yIERU
L0FSTSBydDEwMTUgJiBydDEwMTVwIGFyZSByZXByZXNlbnRlZCBieToNCj4gICAgICAgICAuY29t
cGF0aWJsZSA9ICJyZWFsdGVrLHJ0MTAxNSINCj4gICAgICAgICAuY29tcGF0aWJsZSA9ICJyZWFs
dGVrLHJ0MTAxNXAiDQo+IA0KPiBmb3IgQUNQSS94ODYgcnQxMDE1ICYgcnQxMDE1cCBhcmUgcmVw
cmVzZW50ZWQgYnk6DQo+ICAgICAgICAgIjEwRUMxMDE1Ig0KPiAgICAgICAgICJSVEwxMDE1Ig0K
PiANCj4gVGhlIGZpcnN0IHBhaXIgaXMgbmljZSBhbmQgY2xlYW4sIHRoZSBzZWNvbmQgaXMgY29u
ZnVzaW5nIGFuZCBlcnJvcg0KPiBwcm9uZS4gRG8geW91IGtub3cgd2hlcmUgdGhlIHNlY29uZCBw
YWlyIG9yaWdpbmF0ZWQgZnJvbT8NCjEwRUMgaXMgZGVmaW5lZCBieSB0aGUgUENJIGRvbWFpbiwg
YW5kIFJUTCBpcyBkZWZpbmVkIGJ5IHRoZSBQTlAgZG9tYWluLg0KVG8gZGlzdGluZ3Vpc2ggdGhl
c2UsIDEwMTUsIDEwMTksIGFuZCA1NjgyIHVzZSBkaWZmZXJlbnQgZHJpdmVycywNCndpdGggdGhl
IFJUTCBwcmVmaXggYmVpbmcgdXNlZCB0byBpbnN0ZWFkIG9mIHRoZSBwIHBvc3RmaXggaW4gdGhl
IERULg0K
