Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0643ABD
	for <linux-sound@vger.kernel.org>; Sat, 14 Sep 2024 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726304590; cv=none; b=swh3RXqzw2lgfPwQem4+LOV5uzaEtHRJfd0cb+mwx2AmbxQia1kybiyhlbw/REaIIqeUZQNyMCw0IvqxLfilSYGSBAMF2a6+BWXeCmppK8fI2+QaWcXZ0SQlf1c5YFus/sYGqye7bkeypUAP6nDIJqzOvDryLTcJAYBs4l1bPQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726304590; c=relaxed/simple;
	bh=zHaPfmH1uy+sp6jfXKJHvDDzleYlSMbTiEF1xvDvzSo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QStQl6h7dq5UjOooeWnK257Zs/1hExYuvDWZfuCl4JOWBODtaxf8eyzUFleRM7nBgwmiEPCp9Gs2IoYv8XzijiOH21LtDwUmfvrpMgxee7q94m4nikn8pRZ07Mx57K87i6lLYLodjwb7bq4uuBk54ZMaUY9FibWlMyXACnQ6t3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=ebO94xG6; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="ebO94xG6"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48E92D0f8012331, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726304533; bh=zHaPfmH1uy+sp6jfXKJHvDDzleYlSMbTiEF1xvDvzSo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ebO94xG65K5RtfD0os7T6WMIukuHnHSPMHr1fzWHNWTx0yj5xheUYwbb3WKoXRuHv
	 Mm44nRjmHUS8ZozPEQHIeecJwdNuBmiehmnuKwJeK6d5SakYHCZt6yRIc5dRF66ih0
	 PANv+9Zck5bIIWBKO8bzgeKfpgglTqztUx80WtH9RRyGfOt885M8toNPT+EgRHdtqE
	 +6LwYgdW0f1NLNVSiFM6e+QwF6XrgzlcvOpe9yhGxUHrDZMozULMIOxjjMsAsqpvg9
	 7eACgkcLGACk8h64UNtFCuWDZVdq8/DasoxG3VGw4GGZgzAeYJNnlsGgVs180hUYB7
	 s7rZ64vK+YPPA==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48E92D0f8012331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Sep 2024 17:02:13 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 14 Sep 2024 17:02:14 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 14 Sep 2024 17:02:13 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Sat, 14 Sep 2024 17:02:13 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>,
        "oliva@gnu.org" <oliva@gnu.org>
Subject: RE: [PATCH] ASoC: rt1320: reads patch code from firmware file
Thread-Topic: [PATCH] ASoC: rt1320: reads patch code from firmware file
Thread-Index: AQHbBbbLOAEHeMH+J0S1VP9eWqY1VbJVWDuAgAEfzhA=
Date: Sat, 14 Sep 2024 09:02:13 +0000
Message-ID: <daf1b32a8c53434794608b0c241c2da8@realtek.com>
References: <20240913082733.2189491-1-shumingf@realtek.com>
 <2aa00670-d820-43cb-b479-c9aca7d0c243@sirena.org.uk>
In-Reply-To: <2aa00670-d820-43cb-b479-c9aca7d0c243@sirena.org.uk>
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

PiA+ICsgKiBUaGUgJ3BhdGNoIGNvZGUnIGlzIHdyaXR0ZW4gdG8gdGhlIHBhdGNoIGNvZGUgYXJl
YS4NCj4gPiArICogVGhlIHBhdGNoIGNvZGUgYXJlYSBpcyB1c2VkIGZvciBTRENBIHJlZ2lzdGVy
IGV4cGFuc2lvbiBmbGV4aWJpbGl0eS4NCj4gPiArICovDQo+ID4gK3N0YXRpYyB2b2lkIHJ0MTMy
MF9sb2FkX21jdV9wYXRjaChzdHJ1Y3QgcnQxMzIwX3Nkd19wcml2ICpydDEzMjApIHsNCj4gPiAr
CXN0cnVjdCBzZHdfc2xhdmUgKnNsYXZlID0gcnQxMzIwLT5zZHdfc2xhdmU7DQo+ID4gKwljb25z
dCBzdHJ1Y3QgZmlybXdhcmUgKnBhdGNoOw0KPiA+ICsJY2hhciBmaWxlbmFtZVsxMjhdOw0KPiA+
ICsJdW5zaWduZWQgaW50IGFkZHIsIHZhbDsNCj4gPiArCWNvbnN0IHVuc2lnbmVkIGludCAqcHRy
Ow0KPiA+ICsJaW50IHJldCwgaTsNCj4gPiArDQo+ID4gKwlpZiAocnQxMzIwLT52ZXJzaW9uX2lk
IDw9IFJUMTMyMF9WQikNCj4gPiArCQlzdHJzY3B5KGZpbGVuYW1lLCBSVDEzMjBfVkFCX01DVV9Q
QVRDSCwgc2l6ZW9mKGZpbGVuYW1lKSk7DQo+ID4gKwllbHNlDQo+ID4gKwkJc3Ryc2NweShmaWxl
bmFtZSwgUlQxMzIwX1ZDX01DVV9QQVRDSCwgc2l6ZW9mKGZpbGVuYW1lKSk7DQo+ID4gKw0KPiA+
ICsJLyogbG9hZCB0aGUgcGF0Y2ggY29kZSBoZXJlICovDQo+ID4gKwlyZXQgPSByZXF1ZXN0X2Zp
cm13YXJlKCZwYXRjaCwgZmlsZW5hbWUsICZzbGF2ZS0+ZGV2KTsNCj4gDQo+IFdoeSBub3QganVz
dA0KPiANCj4gCWNvbnN0IGNoYXIgKmZpbGVuYW1lOw0KPiANCj4gCWlmIChydDEzMjAtPnZlcnNp
b25faWQgPD0gUlQxMzIwX1ZCKQ0KPiAJCWZpbGVuYW1lID0gUlQxMzIwX1ZBQl9NQ1VfUEFUQ0g7
DQo+IAllbHNlDQo+IAkJZmlsZW5hbWUgPSBSVDEzMjBfVkNfTUNVX1BBVENIOw0KPiANCj4gCXJl
dCA9IHJlcXVlc3RfZmlybXdhcmUoJnBhdGNoLCBmaWxlbmFtZSwgJnNsYXZlLT5kZXYpOw0KPiAN
Cj4gKGllLCB3aGF0IGRvZXMgdGhlIGNvcHkgaW50byB0aGUgYnVmZmVyIGRvPykNCg0KV2lsbCBm
aXgNCg0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQlwdHIgPSAoY29uc3QgdW5zaWduZWQgaW50ICop
cGF0Y2gtPmRhdGE7DQo+ID4gKwkJZm9yIChpID0gMDsgaSA8IChwYXRjaC0+c2l6ZSAvIHNpemVv
Zih1bnNpZ25lZCBpbnQpKTsgaSArPSAyKSB7DQo+ID4gKwkJCWFkZHIgPSBwdHJbaV07DQo+ID4g
KwkJCXZhbCA9IHB0cltpICsgMV07DQo+ID4gKwkJCXJlZ21hcF93cml0ZShydDEzMjAtPnJlZ21h
cCwgYWRkciwgdmFsKTsNCj4gPiArCQl9DQo+IA0KPiBTaG91bGRuJ3QgdGhpcyBiZSB1c2luZyBh
IHNwZWNpZmljYWxseSBzaXplZCB0eXBlIGluIGNhc2Ugd2UgYnVpbGQgb24gc29tZQ0KPiBhcmNo
aXRlY3R1cmUgd2hlcmUgaW50IGlzIGEgZGlmZmVyZW50IHNpemU/ICBXZSBzaG91bGQgYWxzbyB2
YWxpZGF0ZSB0aGF0IHRoZSBmaWxlDQo+IGlzIGFuIGV2ZW4gbnVtYmVyIG9mIHJlZ2lzdGVyL3Zh
bHVlIGNvbWJpbmF0aW9ucyB0byBtYWtlIHN1cmUgaXQncyBub3QgY29ycnVwdCwNCj4gY2hlY2tp
bmcgdGhlIHZhbHVlIG9mIHJlZ21hcF93cml0ZSgpIHRvIG1ha2Ugc3VyZSB0aGUgcmVnaXN0ZXIg
bnVtYmVycyBhcmUNCj4gT0sgd291bGQgcHJvYmFibHkgYmUgZ29vZC4NCg0KVGhhbmtzIGZvciBy
ZXZpZXdpbmcuIFdpbGwgdXBkYXRlIHRoZSB2MiBwYXRjaC4NCg==
