Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FE11D86DC
	for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 05:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769576589; cv=none; b=AVVXSbuj+9D/JiVoExtNi8aEn3NJPlFiG5Vs0x2iPj95CrOd8so/ycHU7/buVd9po1+Chrae+fOD1qMg+1e3X+Ugp69BXqbR9rSo+fRKfpj7uzsLKBneGndj9HgBM/kMv8lVUScd+gr4sKlvdl+kfRa3JT+lrksS7NQVfxGe0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769576589; c=relaxed/simple;
	bh=x67ClHGGWYpPipKbnNJRfiE5SCl5YRH0New5z0bgc0E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NAXWYskMo3xL108fWa8vLA8es2I0H+vaAaHunQ9T2fKaIdwnz5utMdwXijdWtzyMAPgMjfcGAC1te0UcWI/O07zc9I82kjvE6zxL9NGUckK6fyKrlx0Ey1NQPHLcbkN58fywFcwF0ZsNCNWHGqhvRatvC7yClaYS+Jxfwm/CECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=NbQFZaBx; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="NbQFZaBx"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60S52uEX2254455, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1769576577; bh=x67ClHGGWYpPipKbnNJRfiE5SCl5YRH0New5z0bgc0E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=NbQFZaBxg1mn6p+nO76QhQy/6k6i8L7F//B29MP/UzkVhR4iK+eSmp3UaDwK/Ou7c
	 B8qSFQeGk+rZiq7PTF2v15AQdsFzPPsYkYxSs3bcrlLSmQQft7FxSZNrFnfaudv0La
	 3jYzHZCP0ZqBupAvTtoJFXsnmfcQ2LtfPr5EnsPW+acNe93wxhSjzOilbEo5hn8jzA
	 dbgjYSkVKn2PIYWtqzCKtcoBIjWXCw58Udp0aZ9F/IebGeZ57pTP2T5zcqnRsrG6j4
	 9nt7Vdfg4vsOoDb0peJGODaKWCFVZrjaVPIsRRXPIZ+hYXrKP3EWmslcq8q8gd1kzl
	 C0mROwKF+FV+Q==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60S52uEX2254455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jan 2026 13:02:57 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 28 Jan 2026 13:02:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 28 Jan 2026 13:02:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Wed, 28 Jan 2026 13:02:56 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "Flove(HsinFu)" <flove@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: rt5575: Fix undefined references to SPI functions
Thread-Topic: [PATCH] ASoC: rt5575: Fix undefined references to SPI functions
Thread-Index: AQHcjoMjQFXU4gT37UK5Kblojtm3FrVkcIIAgAITFHA=
Date: Wed, 28 Jan 2026 05:02:56 +0000
Message-ID: <5c56f5d1cfc04d2cb9cb897fb3aecabe@realtek.com>
References: <20260126051758.3728312-1-oder_chiou@realtek.com>
 <e259f5f3-072f-4b2d-9191-9a0717212beb@sirena.org.uk>
In-Reply-To: <e259f5f3-072f-4b2d-9191-9a0717212beb@sirena.org.uk>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMjcsIDIwMjYgNToyMiBBTQ0K
PiBUbzogT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFsdGVrLmNvbT4NCj4gQ2M6IGxnaXJkd29v
ZEBnbWFpbC5jb207IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsNCj4gYWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnOyBGbG92ZShIc2luRnUpIDxmbG92ZUByZWFsdGVrLmNvbT47IFNodW1p
bmcgW61TDQo+IK7Ru8pdIDxzaHVtaW5nZkByZWFsdGVrLmNvbT47IEphY2sgWXUgPGphY2sueXVA
cmVhbHRlay5jb20+OyBEZXJlayBbpOi8dw0KPiC4cV0gPGRlcmVrLmZhbmdAcmVhbHRlay5jb20+
OyBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gQVNvQzogcnQ1NTc1OiBGaXggdW5kZWZpbmVkIHJlZmVyZW5jZXMgdG8gU1BJIGZ1bmN0aW9u
cw0KPiANCj4gT24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgMDE6MTc6NThQTSArMDgwMCwgT2RlciBD
aGlvdSB3cm90ZToNCj4gPiBUaGUga2VybmVsIHRlc3Qgcm9ib3QgcmVwb3J0ZWQgdGhlIGZvbGxv
d2luZyBidWlsZCBlcnJvcnM6DQo+IA0KPiBUaGlzIGJyZWFrcyBhbiB4ODYgYWxsbW9kY29uZmln
IGJ1aWxkOg0KPiANCj4gRVJST1I6IG1vZHBvc3Q6ICJydDU1NzVfc3BpX2Z3X2xvYWQiIFtzb3Vu
ZC9zb2MvY29kZWNzL3NuZC1zb2MtcnQ1NTc1LmtvXQ0KPiB1bmRlZmkNCj4gbmVkIQ0KPiBFUlJP
UjogbW9kcG9zdDogInJ0NTU3NV9zcGlfZ2V0X2RldmljZSINCj4gW3NvdW5kL3NvYy9jb2RlY3Mv
c25kLXNvYy1ydDU1NzUua29dIHVuZA0KPiBlZmluZWQhDQoNCkkgdHJpZWQgdG8gcmVwcm9kdWNl
IHRoZSByZXBvcnRlZCBtb2Rwb3N0IGVycm9yIHdpdGggbWFrZSBhbGxtb2Rjb25maWcNCm9uIG15
IGxvY2FsIG1hY2hpbmUsIGJ1dCB0aGUgYnVpbGQgcGFzc2VkIHN1Y2Nlc3NmdWxseS4NCg0KSW4g
bXkgZ2VuZXJhdGVkIC5jb25maWcgZnJvbSBhbGxtb2Rjb25maWcsIEkgaGF2ZToNCkNPTkZJR19T
TkRfU09DX1JUNTU3NT1tDQpDT05GSUdfU05EX1NPQ19SVDU1NzVfU1BJPXkNCg0KSSBhbHNvIGF0
dGVtcHRlZCB0byBtYW51YWxseSBmb3JjZSBDT05GSUdfU05EX1NPQ19SVDU1NzVfU1BJPW0gdG8g
c2VlIGlmDQp0aGF0IHRyaWdnZXJlZCB0aGUgaXNzdWUuIEhvd2V2ZXIsIEtidWlsZCBwcm9kdWNl
ZCB0aGUgZm9sbG93aW5nIHdhcm5pbmcNCmFuZCBhdXRvbWF0aWNhbGx5IHJldmVydGVkIGl0IHRv
ICd5JyAoc2luY2UgaXQgaXMgYSBib29sZWFuIGluIEtjb25maWcpOg0KLmNvbmZpZzoxMTM5Mzp3
YXJuaW5nOiBzeW1ib2wgdmFsdWUgJ20nIGludmFsaWQgZm9yIFNORF9TT0NfUlQ1NTc1X1NQSQ0K
DQpDb3VsZCB5b3UgcGxlYXNlIGNoZWNrIGlmIHRoZXJlIG1pZ2h0IGJlIGEgbWlzbWF0Y2ggaW4g
dGhlIGFwcGxpZWQNCnBhdGNoZXMgb3IgYSBzcGVjaWZpYyAuY29uZmlnIHN0YXRlIEkgc2hvdWxk
IGJlIGF3YXJlIG9mPyBJIHdhbnQgdG8gbWFrZQ0Kc3VyZSBJIGFtIHRlc3RpbmcgdW5kZXIgdGhl
IHNhbWUgY29uZGl0aW9ucy4NCg0KVGhhbmtzDQo=
