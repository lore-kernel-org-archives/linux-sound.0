Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52499186A;
	Mon, 13 Jan 2025 06:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736750498; cv=none; b=XiqNbVegvGbvsckk5R+OeJqnEOx13AkWSnqIeIlj1hUW9DsLGmacV9NgvTAxkDgszfIn2ALL5WMCImpFJdqz3LZ4WIvuJ0VcKgOllG4rgqmMUHSKV/y4l6AO7MT1UkUYbNxeI5Z6q5YHKnCDiMtYKg/dkr5gKBhevQtp8lbcOzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736750498; c=relaxed/simple;
	bh=KUYmARATJitK6FR6ZE4aasaWBGVMWRUJ3055hw3PwXM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nAxE/YNB14Z3bp6hh3Jno4yX50T7ehZwSo6ugtzZRPTGnkZ1GKfIxcoQ8smAw407EdFEzVViG5QrVZfnncfUdew+zzzy7uca8WEfmfdz/QeYdO9b9J1mcZo7RpW2Rc1oArE2xExZntrtAcX62Ydj4NjVKWMCRT7lXkduV/XBMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ui5EmrYG; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ui5EmrYG"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50D6f3Fw041981;
	Mon, 13 Jan 2025 00:41:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736750463;
	bh=KUYmARATJitK6FR6ZE4aasaWBGVMWRUJ3055hw3PwXM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ui5EmrYG+GO6jU79tTWEIjQ4Ch6fv1ZY7CI55sHFTRvQaFgXTMemalDecyXzqRkfL
	 MaAsV9tNtGMsZdUkZV849waCmG97Natc91Uw2bkhlzfLUq0fBVAJmUFzAKDa402nk4
	 fsTJR6x0Bvu0NDsGfwqY6ydoXeZoQT6xArua0NsE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50D6f3cC027931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 00:41:03 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 00:41:02 -0600
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Mon, 13 Jan 2025 00:41:02 -0600
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Navada Kanyana,
 Mukund" <navada@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>,
        "P O, Vijeth" <v-po@ti.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "antheas.dk@gmail.com"
	<antheas.dk@gmail.com>,
        "stuart.a.hayhurst@gmail.com"
	<stuart.a.hayhurst@gmail.com>,
        "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not
 found for tas2563 projects
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID
 not found for tas2563 projects
Thread-Index: AQHbZA9NnmoXJhOoa0iNViC5/ohYcbMTM9uAgAENrYs=
Date: Mon, 13 Jan 2025 06:41:02 +0000
Message-ID: <311e99af8c6d4041ac2c19b115a8c0ab@ti.com>
References: <20250111095728.1232-1-baojun.xu@ti.com>,<87ldvgtp36.wl-tiwai@suse.de>
In-Reply-To: <87ldvgtp36.wl-tiwai@suse.de>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IEZyb206IFRha2Fz
aGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCj4gU2VudDogMTIgSmFudWFyeSAyMDI1IDE2OjI2DQo+
IFRvOiBYdSwgQmFvanVuDQo+IENjOiB0aXdhaUBzdXNlLmRlOyByb2JoK2R0QGtlcm5lbC5vcmc7
IGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsgbGdpcmR3b29kQGdtYWlsLmNvbTsg
cGVyZXhAcGVyZXguY3o7IERpbmcsIFNoZW5naGFvOyBOYXZhZGEgS2FueWFuYSwgTXVrdW5kOyAx
MzkxNjI3NTIwNkAxMzkuY29tOyBIYW1waWhvbGksIFZhbGxhYmhhOyBQIE8sIFZpamV0aDsgbGlu
dXgtc291bmRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBs
aWFtLnIuZ2lyZHdvb2RAaW50ZWwuY29tOyB5dW5nLWNodWFuLmxpYW9AbGludXguaW50ZWwuY29t
OyBicm9vbmllQGtlcm5lbC5vcmc7IGFudGhlYXMuZGtAZ21haWwuY29tOyBzdHVhcnQuYS5oYXlo
dXJzdEBnbWFpbC5jb207IGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBbRVhU
RVJOQUxdIFJlOiBbUEFUQ0ggdjFdIEFMU0E6IGhkYS90YXMyNzgxOiBJZ25vcmUgU1VCU1lTX0lE
IG5vdCBmb3VuZCBmb3IgdGFzMjU2MyBwcm9qZWN0cw0KPiANCj4gT24gU2F0LCAxMSBKYW4gMjAy
NSAxMDrigIo1NzrigIoyOCArMDEwMCwgQmFvanVuIFh1IHdyb3RlOiA+ID4gRHJpdmVyIHdpbGwg
cmV0dXJuIGVycm9yIGlmIG5vIFNVQlNZU19JRCBmb3VuZCBpbiBCSU9TKGFjcGkpLiA+IEl0IHdp
bGwgY2F1c2UgZXJyb3IgaW4gdGFzMjU2MyBwcm9qZWN0cywgd2hpY2ggaGF2ZSBubyBTVUJTWVNf
SUQuID4gQ2hhbmdlIHN0cm5jbXAgdG8gc3RyY21wIHRvIGF2b2lkIHdhcm5pbmcNCj4gWmpRY21R
UllGcGZwdEJhbm5lclN0YXJ0DQo+IFRoaXMgbWVzc2FnZSB3YXMgc2VudCBmcm9tIG91dHNpZGUg
b2YgVGV4YXMgSW5zdHJ1bWVudHMuDQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzb3VyY2Ugb2YgdGhpcyBlbWFpbCBhbmQg
a25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiA8aHR0cHM6Ly91cy1waGlzaGFsYXJtLWV3dC5w
cm9vZnBvaW50LmNvbS9FV1QvdjEvRzN2SyF2eGRySGZ3Rl9xZnpvZ1lFX3h0b1g3bFRvekg3MFhP
S0EwSFJ1LWlvQnZVdkN2OFFOa21Bc1IxV3VydlI5WmxoN0dtVTdBJD4NCj4gUmVwb3J0IFN1c3Bp
Y2lvdXMNCj4gDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCj4gDQo+IE9uIFNhdCwgMTEgSmFu
IDIwMjUgMTA6NTc6MjggKzAxMDAsDQo+IEJhb2p1biBYdSB3cm90ZToNCj4gPg0KPiA+IERyaXZl
ciB3aWxsIHJldHVybiBlcnJvciBpZiBubyBTVUJTWVNfSUQgZm91bmQgaW4gQklPUyhhY3BpKS4N
Cj4gPiBJdCB3aWxsIGNhdXNlIGVycm9yIGluIHRhczI1NjMgcHJvamVjdHMsIHdoaWNoIGhhdmUg
bm8gU1VCU1lTX0lELg0KPiA+IENoYW5nZSBzdHJuY21wIHRvIHN0cmNtcCB0byBhdm9pZCB3YXJu
aW5nIGZvciB3ZWlyZCBsZW5ndGguDQo+IA0KPiBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIGxvZ2lj
Lg0KPiBUaGUgdXNlIG9mIHN0cm5jbXAoKSB0aGVyZSBhbHJlYWR5IG1hdGNoZXMgb25seSB3aXRo
IHRoZSBleGFjdCBzdHJpbmcNCj4gIklOVDg4NjYiLCBub3QgdGhlIHN1YnN0cmluZywgYmVjYXVz
ZSB5b3UgdXNlIHNpemVvZigiSU5UODg2NiIpIHdoaWNoDQo+IGlzIDggaW5jbHVkaW5nIHRoZSBO
VUwtdGVybWluYXRvci4NCj4gVGhlIG9ubHkgbWVyaXQgb2Ygc3RybmNtcCgpIGluIHRoaXMgY2Fz
ZSBpcyB0aGF0IGl0IGNhbiBiZSB1c2VkIGZvciBhbg0KPiB1bnRlcm1pbmF0ZWQgY2hhciBhcnJh
eS4NCj4gDQo+IEluIHdoaWNoIHNpdHVhdGlvbiBkbyB5b3Ugc2VlIHRoZSBwcm9ibGVtIGFuZCBo
b3cgZG9lcyB5b3VyIHBhdGNoDQo+IGltcHJvdmUgLyBmaXggaXQ/ICBQbGVhc2UgZ2l2ZSBhIG1v
cmUgY29uY3JldGUgZXhhbXBsZS4NCj4gDQoNCkJlY2F1c2UgaXQgd2lsbCBoYXZlIFNtYXRjaCBT
dGF0aWMgQ2hlY2tlciB3YXJuaW5nOg0KDQoJc291bmQvcGNpL2hkYS90YXMyNzgxX2hkYV9pMmMu
YzoxNDYgdGFzMjc4MV9yZWFkX2FjcGkoKQ0KCXdhcm46IHN0cm5jbXAoKSB3aXRoIHdlaXJkIGxl
bmd0aDogNyB2cyA4DQoNCnNvdW5kL3BjaS9oZGEvdGFzMjc4MV9oZGFfaTJjLmMNCiAgICAxNDQg
ICAgICAgICBpZiAoSVNfRVJSKHN1YikpIHsNCiAgICAxNDUgICAgICAgICAgICAgICAgIC8qIE5v
IHN1YnN5cyBpZCBpbiBvbGRlciB0YXMyNTYzIHByb2plY3RzLiAqLw0KLS0+IDE0NiAgICAgICAg
ICAgICAgICAgaWYgKCFzdHJuY21wKGhpZCwgIklOVDg4NjYiLCBzaXplb2YoIklOVDg4NjYiKSkp
DQoNClRoaXMgcGF0Y2ggd2lsbCBhdm9pZCB0aGlzIHdhcm5pbmcsIGFuZCB0aGlzIGhpZCB3aWxs
IGJlIGEgbnVsbCB0ZXJtaW5hdGVkDQoiSU5UODg2NiIsIHNvIGhhdmUgbm8gZGlmZmVyZW50IHdo
ZW4gdGhpcyBjb2RlIHdhcyBnbyB0aHJvdWdoLg0KDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBUYWth
c2hpDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmFvanVuIFh1IDxiYW9qdW4ueHVAdGku
Y29tPg0KPiA+IC0tLQ0KPiA+ICBzb3VuZC9wY2kvaGRhL3RhczI3ODFfaGRhX2kyYy5jIHwgMiAr
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3RhczI3ODFfaGRhX2kyYy5jIGIvc291
bmQvcGNpL2hkYS90YXMyNzgxX2hkYV9pMmMuYw0KPiA+IGluZGV4IDBlNDJiODdkYWRiOC4uNjFh
ZWM5MmY2NTM2IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3BjaS9oZGEvdGFzMjc4MV9oZGFfaTJj
LmMNCj4gPiArKysgYi9zb3VuZC9wY2kvaGRhL3RhczI3ODFfaGRhX2kyYy5jDQo+ID4gQEAgLTE0
Myw3ICsxNDMsNyBAQCBzdGF0aWMgaW50IHRhczI3ODFfcmVhZF9hY3BpKHN0cnVjdCB0YXNkZXZp
Y2VfcHJpdiAqcCwgY29uc3QgY2hhciAqaGlkKQ0KPiA+ICAgICAgIHN1YiA9IGFjcGlfZ2V0X3N1
YnN5c3RlbV9pZChBQ1BJX0hBTkRMRShwaHlzZGV2KSk7DQo+ID4gICAgICAgaWYgKElTX0VSUihz
dWIpKSB7DQo+ID4gICAgICAgICAgICAgICAvKiBObyBzdWJzeXMgaWQgaW4gb2xkZXIgdGFzMjU2
MyBwcm9qZWN0cy4gKi8NCj4gPiAtICAgICAgICAgICAgIGlmICghc3RybmNtcChoaWQsICJJTlQ4
ODY2Iiwgc2l6ZW9mKCJJTlQ4ODY2IikpKQ0KPiA+ICsgICAgICAgICAgICAgaWYgKCFzdHJjbXAo
aGlkLCAiSU5UODg2NiIpKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVuZF8yNTYz
Ow0KPiA+ICAgICAgICAgICAgICAgZGV2X2VycihwLT5kZXYsICJGYWlsZWQgdG8gZ2V0IFNVQlNZ
UyBJRC5cbiIpOw0KPiA+ICAgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihzdWIpOw0KPiA+IC0t
DQo+ID4gMi40My4wDQo+ID4NCj4gPg0KPiANCj4g
