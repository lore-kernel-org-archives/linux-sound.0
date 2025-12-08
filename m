Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E2B29C338;
	Mon,  8 Dec 2025 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765179034; cv=none; b=GdJ+quqW/Igm0VKi7TDv8X8ngbZ5Nha2Up4I4/u8T/GUZH4pLu7YSHslFayfq/7AK/So9CFUUucTB6dJGrl/tQFh4B8V0pt+i4xylQ7vVEJ4lrafnFuoAzzOuDLjhNCxQQj0AbuoPcniFY9BsbLumLC5NhiRkOHZUbKv0ZaTgpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765179034; c=relaxed/simple;
	bh=6gyPmhMp/IBVWdUi/pIh55RqoWgZ8nmpGM12fXP1+v0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NKJqXK2OSiO4j1Bj19hptAucZqLLKuWSi1lLywbn034Fk9tVghoZLW6dM7cNX3b+eJORkYnV++qN9gSkB1EiYpuU1KY3SovCaKJ9/rqgmTewpc1NaChn//Kj2RYYiblQQLlD+mtNm1YzHCDuDaFPFWXqwIkYFSgQ4KOKxVW5cBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=fail (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=fqLMZtZK reason="signature verification failed"; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="fqLMZtZK"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5B87Tvh263595613, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765178997; bh=6gyPmhMp/IBVWdUi/pIh55RqoWgZ8nmpGM12fXP1+v0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=fqLMZtZKQSLYAS3f0gOfDwKSIrGNQsPGPUdhCVMvOcUhEr7u6OcttR8LAsoU+Afua
	 pzAOlFPyiqFM2APs1MUqFBtuViYhxNvp7KcmEuhrd3pzJKMbolm4Hn5IRrFllojCPe
	 hQqfkyyivL1pJ8zSurW29q22Gwiu2HS6aR37d/TQg3ADFFeZEyn1s4W8QMNMOgH1lQ
	 TAnK/cDB7u8MpDXsHZkABia73s1LklpolRBO6MJkMkq/VLoym/6YKawyPrxfMm3hFv
	 SwVpRgsPQqySavlWl1MoWqhFiMZCDiLget9Woz6/mwwAwVSVsBpg1G7wCsTMUyzest
	 XtBWrKxfUU7bA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5B87Tvh263595613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 15:29:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 8 Dec 2025 15:29:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 8 Dec 2025 15:29:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::2fa5:eccb:34ee:7bb%10]) with mapi id
 15.02.1544.027; Mon, 8 Dec 2025 15:29:56 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>,
        "cezary.rojewski@intel.com"
	<cezary.rojewski@intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "perex@perex.cz" <perex@perex.cz>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Flove(HsinFu)" <flove@realtek.com>,
        =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
Thread-Topic: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the
 ALC5575
Thread-Index: AQHcYrFaS/5FqQdtw0yFH8gKhtK+rLUWxcwAgACdTlA=
Date: Mon, 8 Dec 2025 07:29:56 +0000
Message-ID: <2202b463075f4219bffc636fbafb0684@realtek.com>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-2-oder_chiou@realtek.com>
 <6c0639e2-dc59-4e0f-be42-224a98b37f75@kernel.org>
In-Reply-To: <6c0639e2-dc59-4e0f-be42-224a98b37f75@kernel.org>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgOCwgMjAyNSAyOjA1
IFBNDQo+IFRvOiBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29tPjsgY2V6YXJ5LnJv
amV3c2tpQGludGVsLmNvbTsNCj4gYnJvb25pZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwu
Y29tOyByb2JoQGtlcm5lbC5vcmc7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2Vy
bmVsLm9yZw0KPiBDYzogcGVyZXhAcGVyZXguY3o7IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZzsgRmxvdmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+OyBTaHVtaW5nIFvojIMNCj4g
5pu46YqYXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsu
Y29tPjsgRGVyZWsgW+aWueW+tw0KPiDnvqldIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY4IDEvMl0gQVNvQzogcnQ1NTc1OiBBZGQgdGhlIGNvZGVjIGRy
aXZlciBmb3IgdGhlDQo+IEFMQzU1NzUNCj4gDQo+IA0KPiBFeHRlcm5hbCBtYWlsIDogVGhpcyBl
bWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QNCj4g
cmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2du
aXplIHRoZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0K
PiANCj4gT24gMDEvMTIvMjAyNSAxMTo1OSwgT2RlciBDaGlvdSB3cm90ZToNCj4gPiArDQo+ID4g
K3N0YXRpYyBpbnQgcnQ1NTc1X2kyY19yZWFkKHZvaWQgKmNvbnRleHQsIHVuc2lnbmVkIGludCBy
ZWcsIHVuc2lnbmVkIGludA0KPiAqdmFsKQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCA9IGNvbnRleHQ7DQo+ID4gKyAgICAgc3RydWN0IHJ0NTU3NV9wcml2ICpy
dDU1NzUgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gPiArDQo+ID4gKyAgICAgcmVn
bWFwX3JlYWQocnQ1NTc1LT5kc3BfcmVnbWFwLCByZWcgfCBSVDU1NzVfRFNQX01BUFBJTkcsDQo+
IHZhbCk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtz
dGF0aWMgaW50IHJ0NTU3NV9pMmNfd3JpdGUodm9pZCAqY29udGV4dCwgdW5zaWduZWQgaW50IHJl
ZywgdW5zaWduZWQgaW50IHZhbCkNCj4gPiArew0KPiA+ICsgICAgIHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQgPSBjb250ZXh0Ow0KPiA+ICsgICAgIHN0cnVjdCBydDU1NzVfcHJpdiAqcnQ1NTc1
ID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7DQo+ID4gKw0KPiA+ICsgICAgIHJlZ21hcF93
cml0ZShydDU1NzUtPmRzcF9yZWdtYXAsIHJlZyB8IFJUNTU3NV9EU1BfTUFQUElORywNCj4gdmFs
KTsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBydDU1NzVfcmVnbWFwID0gew0KPiA+ICsgICAg
IC5yZWdfYml0cyA9IDE2LA0KPiA+ICsgICAgIC52YWxfYml0cyA9IDMyLA0KPiA+ICsgICAgIC5y
ZWdfc3RyaWRlID0gNCwNCj4gPiArICAgICAubWF4X3JlZ2lzdGVyID0gMHhmZmZjLA0KPiA+ICsg
ICAgIC5yZWFkYWJsZV9yZWcgPSBydDU1NzVfcmVhZGFibGVfcmVnaXN0ZXIsDQo+ID4gKyAgICAg
LnJlZ19yZWFkID0gcnQ1NTc1X2kyY19yZWFkLA0KPiA+ICsgICAgIC5yZWdfd3JpdGUgPSBydDU1
NzVfaTJjX3dyaXRlLA0KPiA+ICsgICAgIC51c2Vfc2luZ2xlX3JlYWQgPSB0cnVlLA0KPiA+ICsg
ICAgIC51c2Vfc2luZ2xlX3dyaXRlID0gdHJ1ZSwNCj4gPiArfTsNCj4gDQo+IE9GIGRldmljZSBJ
RCB0YWJsZSBnb2VzIGFyb3VuZCBoZXJlIC0gdG9nZXRoZXIgd2l0aCBJMkMuDQpJIHdpbGwgY29y
cmVjdCBpdC4NCg0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lk
IHJ0NTU3NV9pMmNfaWRbXSA9IHsNCj4gPiArICAgICB7ICJydDU1NzUiIH0sDQo+ID4gKyAgICAg
eyB9DQo+ID4gK307DQo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBydDU1NzVfaTJjX2lk
KTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnQ1NTc1X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqaTJjKQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0IHJ0NTU3NV9wcml2ICpydDU1NzU7
DQo+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJmkyYy0+ZGV2Ow0KPiA+ICsgICAgIGlu
dCByZXQsIHZhbDsNCj4gPiArDQo+ID4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19TTkRfU09DX1JU
NTU3NV9TUEkpDQo+IA0KPiBObyBpZmRlZnMgaW4gZHJpdmVyIGNvZGUuDQoNCkkgYW0gbm90IHVu
ZGVyc3RhbmRpbmcgZXhhY3RseS4NCklmIHRoZSBtYWNoaW5lIGlzIHdpdGhvdXQgU1BJIGludGVy
ZmFjZSBhbmQgdGhlIGNvZGVjIHdpdGggZmxhc2gsIHRoZQ0KQ09ORklHX1NORF9TT0NfUlQ1NTc1
X1NQSSBjYW4gYmUgZGlzYWJsZWQuDQoNCj4gPiArICAgICBpZiAoIXJ0NTU3NV9zcGkgJiYgb2Zf
ZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5vZl9ub2RlLA0KPiBydDU1NzVfb2ZfbWF0Y2hbMV0u
Y29tcGF0aWJsZSkpDQo+IA0KPiBObywgdXNlIGRyaXZlciBtYXRjaCBkYXRhIGlmIGV2ZXIsIGJ1
dCB0aGlzIGlzIGp1c3Qgd3JvbmcuIFlvdSBzYWlkIGl0DQo+IGRlcGVuZHMgb24gU1BJIGZsYXNo
LCBub3QgU1BJIGludGVyZmFjZS4NCg0KSSB3aWxsIG1vZGlmeSBpdCB0byB1c2UgdGhlIG1hdGNo
IGRhdGEgYXMgZm9sbG93aW5nLg0Kc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnQ1
NTc1X29mX21hdGNoW10gPSB7DQoJeyAuY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0NTU3NSIsIC5k
YXRhID0gKHZvaWQgKilSVDU1NzVfV0lUSF9GTEFTSCB9LA0KCXsgLmNvbXBhdGlibGUgPSAicmVh
bHRlayxydDU1NzUtdXNlLXNwaSIsIC5kYXRhID0gKHZvaWQgKilSVDU1NzVfV0lUSE9VVF9GTEFT
SCB9LA0KCXsgfQ0KfTsNCg0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FUFJPQkVfREVGRVI7
DQo+ID4gKyNlbmRpZg0KPiA+ICsNCj4gPiArICAgICBydDU1NzUgPSBkZXZtX2t6YWxsb2MoZGV2
LCBzaXplb2Yoc3RydWN0IHJ0NTU3NV9wcml2KSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBHRlBfS0VSTkVMKTsNCj4gPiArICAgICBpZiAocnQ1NTc1ID09IE5VTEwpDQo+IA0K
PiBUaGlzIGlzIG5vdCBMaW51eCBjb2Rpbmcgc3R5bGUuIE9wZW4gZXhpc3RpbmcgZHJpdmVycy4g
SXQncyBldmVyeXdoZXJlDQo+IHdyaXR0ZW4gKCFmb28pDQpJIHdpbGwgY29ycmVjdCBpdC4NCg0K
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgIGkyY19z
ZXRfY2xpZW50ZGF0YShpMmMsIHJ0NTU3NSk7DQo+ID4gKw0KPiA+ICsgICAgIHJ0NTU3NS0+aTJj
ID0gaTJjOw0KPiA+ICsNCj4gPiArICAgICBydDU1NzUtPmRzcF9yZWdtYXAgPSBkZXZtX3JlZ21h
cF9pbml0X2kyYyhpMmMsDQo+ICZydDU1NzVfZHNwX3JlZ21hcCk7DQo+ID4gKyAgICAgaWYgKElT
X0VSUihydDU1NzUtPmRzcF9yZWdtYXApKSB7DQo+ID4gKyAgICAgICAgICAgICByZXQgPSBQVFJf
RVJSKHJ0NTU3NS0+ZHNwX3JlZ21hcCk7DQo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
IkZhaWxlZCB0byBhbGxvY2F0ZSByZWdpc3RlciBtYXA6ICVkXG4iLCByZXQpOw0KPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIHJ0NTU3
NS0+cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdChkZXYsIE5VTEwsIGkyYywNCj4gJnJ0NTU3NV9y
ZWdtYXApOw0KPiA+ICsgICAgIGlmIChJU19FUlIocnQ1NTc1LT5yZWdtYXApKSB7DQo+ID4gKyAg
ICAgICAgICAgICByZXQgPSBQVFJfRVJSKHJ0NTU3NS0+cmVnbWFwKTsNCj4gPiArICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIHJlZ2lzdGVyIG1hcDogJWRcbiIs
IHJldCk7DQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgIH0NCj4gPiAr
DQo+ID4gKyAgICAgcmVnbWFwX3JlYWQocnQ1NTc1LT5yZWdtYXAsIFJUNTU3NV9JRCwgJnZhbCk7
DQo+ID4gKyAgICAgaWYgKHZhbCAhPSBSVDU1NzVfREVWSUNFX0lEKSB7DQo+ID4gKyAgICAgICAg
ICAgICBkZXZfZXJyKGRldiwgIkRldmljZSB3aXRoIElEIHJlZ2lzdGVyICUwOHggaXMgbm90IHJ0
NTU3NVxuIiwNCj4gdmFsKTsNCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiA+
ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgcmVnbWFwX3JlYWQocnQ1NTc1LT5yZWdtYXAsIFJU
NTU3NV9JRF8xLCAmdmFsKTsNCj4gPiArICAgICBpZiAoIXZhbCkgew0KPiA+ICsgICAgICAgICAg
ICAgZGV2X2VycihkZXYsICJUaGlzIGlzIG5vdCBmb3JtYWwgdmVyc2lvblxuIik7DQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICsgICAg
IHJldHVybiBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJfY29tcG9uZW50KGRldiwNCj4gJnJ0NTU3NV9z
b2NfY29tcG9uZW50X2RldiwgcnQ1NTc1X2RhaSwNCj4gPiArICAgICAgICAgICAgIEFSUkFZX1NJ
WkUocnQ1NTc1X2RhaSkpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IGkyY19k
cml2ZXIgcnQ1NTc1X2kyY19kcml2ZXIgPSB7DQo+ID4gKyAgICAgLmRyaXZlciA9IHsNCj4gPiAr
ICAgICAgICAgICAgIC5uYW1lID0gInJ0NTU3NSIsDQo+ID4gKyAgICAgICAgICAgICAub3duZXIg
PSBUSElTX01PRFVMRSwNCj4gDQo+IFBsZWFzZSBkcm9wIGl0Lg0KPiANCj4gUGxlYXNlIHJ1biBz
dGFuZGFyZCBrZXJuZWwgdG9vbHMgZm9yIHN0YXRpYyBhbmFseXNpcywgbGlrZSBjb2NjaW5lbGxl
LA0KPiBzbWF0Y2ggYW5kIHNwYXJzZSwgYW5kIGZpeCByZXBvcnRlZCB3YXJuaW5ncy4gQWxzbyBw
bGVhc2UgY2hlY2sgZm9yDQo+IHdhcm5pbmdzIHdoZW4gYnVpbGRpbmcgd2l0aCBXPTEgZm9yIGdj
YyBhbmQgY2xhbmcuIE1vc3Qgb2YgdGhlc2UNCj4gY29tbWFuZHMgKGNoZWNrcyBvciBXPTEgYnVp
bGQpIGNhbiBidWlsZCBzcGVjaWZpYyB0YXJnZXRzLCBsaWtlIHNvbWUNCj4gZGlyZWN0b3J5LCB0
byBuYXJyb3cgdGhlIHNjb3BlIHRvIG9ubHkgeW91ciBjb2RlLiBUaGUgY29kZSBoZXJlIGxvb2tz
DQo+IGxpa2UgaXQgbmVlZHMgYSBmaXguIEZlZWwgZnJlZSB0byBnZXQgaW4gdG91Y2ggaWYgdGhl
IHdhcm5pbmcgaXMgbm90IGNsZWFyLg0KPiANCj4gPiArICAgICAgICAgICAgIC5vZl9tYXRjaF90
YWJsZSA9IG9mX21hdGNoX3B0cihydDU1NzVfb2ZfbWF0Y2gpLA0KPiANCj4gWW91IGhhdmUgd2Fy
bmluZyBoZXJlLiBEcm9wIG9mX21hdGNoX3B0ci4NCkkgd2lsbCByZW1vdmUgaXQuDQoNClRoYW5r
cywNCk9kZXINCg==
