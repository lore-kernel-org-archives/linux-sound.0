Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38061A705C;
	Fri, 27 Jun 2025 04:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000271; cv=none; b=mDhNtQMQwFk9Ed0McMjDS2xcwP1/NFwRTGeo/eG8QW+aipvIVCtNKnlhqVn2fDpPUdH+X2mPYdzM3e/t6t9GZsJZ5lYJg38lIaphxchof1zPE1nksA24+M5zHYcUyr627A2MFVlHoDfB3ZicDlz6GlKHrQIl2Mboxh3hx7kmJwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000271; c=relaxed/simple;
	bh=ioWUImYH/NHoRctZbvnT74UnjKm9PIAYzlU7tSarR6A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=U9kLnviBtKiuQJioFl0eIXQNlzJR8V2E3UCe3fN1QCrG/qT2Z9x4wK0vdKIBXkva38QUKyOmMNtcOCeZBO+fz4GeBg/pTQk8SXfjhYwAnVXUTDX9HbsDPAXVTvlV5Du2OF7ET/vC2frSCILyL0eLj2cnKdWnmu5UnU33xi4Ih+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wmfGUjYM; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wmfGUjYM"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55R4vUu52650629;
	Thu, 26 Jun 2025 23:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751000250;
	bh=ioWUImYH/NHoRctZbvnT74UnjKm9PIAYzlU7tSarR6A=;
	h=From:To:CC:Subject:Date;
	b=wmfGUjYMefVao4i02x2/u7u6UYIEe2e4LFCNQaDBFD1t3vVSbGd6rT8ycswCbtxxQ
	 hEgHg61dEigc7p78eOeG65ax/SXn6/Yk5owvou8b3JL5doxOL8IUip+2AD1nW4gTc5
	 C5MLF9XhmnzHsN/xazAsSsxxAwWXNujHLlGV7DAQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55R4vUS9073281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 23:57:30 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 23:57:29 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.055; Thu, 26 Jun 2025 23:57:29 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "tiwai@suse.de" <tiwai@suse.de>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "Ding,
 Shenghao" <shenghao-ding@ti.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family of
 codecs
Thread-Topic: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family
 of codecs
Thread-Index: AdvnF9HmTFLrcLE5ScmquuxsqrwJVA==
Date: Fri, 27 Jun 2025 04:57:29 +0000
Message-ID: <3c54f7d51e1941cbb8a15147c99d64ee@ti.com>
Accept-Language: en-US
Content-Language: en-US
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

VGhhbmtzIGZvciBxdWljayByZXZpZXcuDQo+IEZyb206IFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSAyNywgMjAyNSAxOjA5IEFNDQo+IFRv
OiBIb2xhbHUgWW9nZW5kcmEsIE5pcmFuamFuIDxuaXJhbmphbi5oeUB0aS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjMgMi80XSBkdC1iaW5kaW5nczogc291bmQ6IGJpbmRpbmdzIGZvcg0K
PiB0YWM1eDF4IGZhbWlseSBvZiBjb2RlY3MNCj4gT24gVGh1LCAyNiBKdW4gMjAyNSAyMzo0Mzoz
MSArMDUzMCwgTmlyYW5qYW4gSCBZIHdyb3RlOg0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC90aSx0YWM1eDF4LnlhbWwNCi4uLg0KPiB5YW1sbGludCB3YXJuaW5n
cy9lcnJvcnM6DQo+IA0KPiBkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOg0KPiBXYXJuaW5n
OiBEdXBsaWNhdGUgY29tcGF0aWJsZSAidGksdGFhNTQxMiIgZm91bmQgaW4gc2NoZW1hcyBtYXRj
aGluZw0KPiBXYXJuaW5nOiBEdXBsaWNhdGUgY29tcGF0aWJsZSAidGksdGFhNTIxMiIgZm91bmQg
aW4gc2NoZW1hcyBtYXRjaGluZw0KPiBXYXJuaW5nOiBEdXBsaWNhdGUgY29tcGF0aWJsZSAidGks
dGFkNTIxMiIgZm91bmQgaW4gc2NoZW1hcyBtYXRjaGluZw0KVGhlIGR1cGxpY2F0ZSBjb21wYXRp
YmxlIGFyZSBhbHJlYWR5IHJlbW92ZWQgYXMgcGFydCBvZiB0aGUgcGF0Y2ggc2VyaWVzIA0KaW4g
cGF0Y2ggW3YzLDQvNF0gZHQtYmluZGluZ3M6IHNvdW5kOiBkZXZpY2Ugc3VwcG9ydCBsaXN0IGZv
ciBwY202MjQwIC4NCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0
cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjUwNjI2MTgxMzM0LjEyMDAtNS1uaXJhbmphbi5oeUB0aS5j
b20vDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgc3RpbGwgYWRkaXRpb25hbCBhY3Rpb24gaXMgcmVx
dWlyZWQuIA0KDQpSZWdhcmRzDQpOaXJhbmphbiBIIFkNCg==
