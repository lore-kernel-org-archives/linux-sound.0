Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC815249F9;
	Mon, 13 Jan 2025 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757985; cv=none; b=RgN8K6S7L5RKrZVtiYY194Kl88d1X7pnG6QLKWwIAPV9+fOHQq7inUXYi0comzNeyTL5NiA2t63oojHOLwepfqLwUW6NSwkDhsaOokSgmqFnONi/bd/llIZrdOYO/vR/1PxVfm5OleAbSupbPuqMx48Aeo7u16F62KXATS3fALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757985; c=relaxed/simple;
	bh=+Xd/JDPbfWhSZ1zN+xjntYZsSKZVeXnQB7aaWNCW11Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R63bF2CCetrLwURFsl8jaFFBFrvV7+1WWciR2vLP/u9/vkuTAhHjTziN6oD13i7nKlmFu5hA2+OyhvAASOePNyqTgQfQeaFfratsPNUBZYqG23rXKsIF9uHATvbixPpXOa4Enrd1UdedUNVt3Q7n3g+uq5YX3ef73cJM2foxvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FgSwVWTr; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FgSwVWTr"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50D8jnsj3672571
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 13 Jan 2025 02:45:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736757949;
	bh=+Xd/JDPbfWhSZ1zN+xjntYZsSKZVeXnQB7aaWNCW11Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=FgSwVWTrLoXFRqcmOPc/Jrybl6i0Kc0eoeE0L08db/KLb/xGejznMcUH64s3ZYtze
	 WZHJ8lfPvSf8rZnFiD4TICuxbEMN2DCuftLdc8cYpsg9vpzNqTgF4mR9Ya6Blam392
	 zMSMh6DjQ4ltHnKyP8kPxzbViZByT76G0Ldq2fvg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50D8jnth069396;
	Mon, 13 Jan 2025 02:45:49 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 02:45:48 -0600
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Mon, 13 Jan 2025 02:45:48 -0600
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "tiwai@suse.de" <tiwai@suse.de>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>,
        "P O,
 Vijeth" <v-po@ti.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "antheas.dk@gmail.com" <antheas.dk@gmail.com>,
        "stuart.a.hayhurst@gmail.com"
	<stuart.a.hayhurst@gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not
 found for tas2563 projects
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID
 not found for tas2563 projects
Thread-Index: AQHbWocC/VIw4o0NkEacY/Y8wduTTLMU3GUA//+cnR4=
Date: Mon, 13 Jan 2025 08:45:48 +0000
Message-ID: <d17798c25acf437cb2b1b7bf58fe947c@ti.com>
References: <20241230064910.1583-1-baojun.xu@ti.com>,<Z4TQ4MAjFwVOjWtt@smile.fi.intel.com>
In-Reply-To: <Z4TQ4MAjFwVOjWtt@smile.fi.intel.com>
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

DQpfPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gRnJvbTogQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6
IDEzIEphbnVhcnkgMjAyNSAxNjozNw0KPiBUbzogWHUsIEJhb2p1bg0KPiBDYzogdGl3YWlAc3Vz
ZS5kZTsgcm9iaCtkdEBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwuY29tOyBwZXJleEBwZXJl
eC5jejsgRGluZywgU2hlbmdoYW87IE5hdmFkYSBLYW55YW5hLCBNdWt1bmQ7IDEzOTE2Mjc1MjA2
QDEzOS5jb207IEhhbXBpaG9saSwgVmFsbGFiaGE7IFAgTywgVmlqZXRoOyBsaW51eC1zb3VuZEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpYW0uci5naXJk
d29vZEBpbnRlbC5jb207IHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb207IGJyb29uaWVA
a2VybmVsLm9yZzsgYW50aGVhcy5ka0BnbWFpbC5jb207IHN0dWFydC5hLmhheWh1cnN0QGdtYWls
LmNvbQ0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjFdIEFMU0E6IGhkYS90YXMy
NzgxOiBJZ25vcmUgU1VCU1lTX0lEIG5vdCBmb3VuZCBmb3IgdGFzMjU2MyBwcm9qZWN0cw0KPiAN
Cj4gT24gTW9uLCBEZWMgMzAsIDIwMjQgYXQgMDI64oCKNDk64oCKMTBQTSArMDgwMCwgQmFvanVu
IFh1IHdyb3RlOiA+IERyaXZlciB3aWxsIHJldHVybiBlcnJvciBpZiBubyBTVUJTWVNfSUQgZm91
bmQgaW4gQklPUyhhY3BpKS4gPiBJdCB3aWxsIGNhdXNlIGVycm9yIGluIHRhczI1NjMgcHJvamVj
dHMsIHdoaWNoIGhhdmUgbm8gU1VCU1lTX0lELiAuLuKAii4gPiArIC8qIE5vIHN1YnN5cyBpZCBp
biBvbGRlciB0YXMyNTYzDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJTdGFydA0KPiBUaGlzIG1lc3Nh
Z2Ugd2FzIHNlbnQgZnJvbSBvdXRzaWRlIG9mIFRleGFzIEluc3RydW1lbnRzLg0KPiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUg
c291cmNlIG9mIHRoaXMgZW1haWwgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPGh0
dHBzOi8vdXMtcGhpc2hhbGFybS1ld3QucHJvb2Zwb2ludC5jb20vRVdUL3YxL0czdkshdUJkblha
c0RWdUsxQVVpczBCeG9rRllsMFU4bXNLSnFRUVRhbThqQnI1czZBcXp3OVdFQWQ1TExGTjBlVnkw
TjIwQl9GN3dTVkRBRkdENzAkPg0KPiBSZXBvcnQgU3VzcGljaW91cw0KPiANCj4gWmpRY21RUllG
cGZwdEJhbm5lckVuZA0KPiANCj4gT24gTW9uLCBEZWMgMzAsIDIwMjQgYXQgMDI6NDk6MTBQTSAr
MDgwMCwgQmFvanVuIFh1IHdyb3RlOg0KPiA+IERyaXZlciB3aWxsIHJldHVybiBlcnJvciBpZiBu
byBTVUJTWVNfSUQgZm91bmQgaW4gQklPUyhhY3BpKS4NCj4gPiBJdCB3aWxsIGNhdXNlIGVycm9y
IGluIHRhczI1NjMgcHJvamVjdHMsIHdoaWNoIGhhdmUgbm8gU1VCU1lTX0lELg0KPiANCj4gLi4u
DQo+IA0KPiA+ICsgICAgICAgICAgICAgLyogTm8gc3Vic3lzIGlkIGluIG9sZGVyIHRhczI1NjMg
cHJvamVjdHMuICovDQo+ID4gKyAgICAgICAgICAgICBpZiAoIXN0cm5jbXAoaGlkLCAiSU5UODg2
NiIsIHNpemVvZigiSU5UODg2NiIpKSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZ290byBl
bmRfMjU2MzsNCj4gDQo+IElzIHRoaXMgSUQgd2FzIHVzZWQgb24gb2xkIHBsYXRmb3Jtcz8NCg0K
WWVzLiBBbmQgaXQgd2lsbCBuZXZlciBiZSB1c2VkIGluIG91ciBwcm9kdWN0IGFnYWluLg0KDQo+
IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiA=
