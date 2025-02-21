Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4B819D087
	for <linux-sound@vger.kernel.org>; Fri, 21 Feb 2025 02:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740103756; cv=none; b=ebr6zj4nDliWGC5un/b0IK6IcP6CbvdkZxO5q8VBCLaTZqXyVLp4KlV984xpczLgIHlas+trcUveeuDGctopZReeSwmHb3J2+Gs6yDrnemDMVRNqw5rx8G9ADyIDqa+stmZDmvKXtEVlrmwjxBuJF8OJAq0Xtq4VPoHiywtRAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740103756; c=relaxed/simple;
	bh=tdkXuz98R/vfNXUuF3tWUUgXgtBcugF5rb5yeaeZ2mw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TTorl2G06znEAqGXsDW2RfE2ZvMdrRjeEEdusuphPbrnbdM4QO8LApZjpCQ0C0EnB6y0dbeanRgcl+VAcBNBnbmeHBCWdzFCzyNUsMLdIIFLQZ3TObAFai1P0yGOEfD2qR4dlIlSbnk4uG1rwZM19+I1DfjPqzJAIs+bd5+IpEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=GWhjoITx; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="GWhjoITx"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 51L28e9L2850005, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1740103721; bh=tdkXuz98R/vfNXUuF3tWUUgXgtBcugF5rb5yeaeZ2mw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=GWhjoITx0bHiJbjVknbd7HDvSYO0tR9w/QDXA7sk8scm27gfTfk9wb0/JeSGcaxlg
	 pcavsh1jH1CgS2TJZ2e0i1uT1rJA+lp2hcIhyX4hCYCoDkT70ohBDvZTFx6bUwYHqU
	 hrJenXtGC8rkho5mTvkirIcQdvvxZCXSfXQh6wgBkRHmxKnc8dazs8rYyd4K/U6HgD
	 9HuTMTHT+w+vZuZivQOcVFcPGLt057rEOq7JvbzcThQ8l9RIxpTSZx4awqXQOihvV8
	 it+Tgm/6Hh21qeBzRhNp9cZc9X4aqzbZ8ZeD+7KSlFAR4erhTdcjIQRLUtEhif9Dt+
	 SdDmdtobv8CDg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 51L28e9L2850005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 10:08:40 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Feb 2025 10:08:40 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 21 Feb 2025 10:08:39 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547]) by
 RTEXMBS01.realtek.com.tw ([fe80::f5bd:6ac9:46d:9547%5]) with mapi id
 15.01.2507.035; Fri, 21 Feb 2025 10:08:39 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>
CC: "tiwai@suse.com" <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>,
        "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        Oder Chiou
	<oder_chiou@realtek.com>,
        "Flove(HsinFu)" <flove@realtek.com>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH 24/24] ASoC: codecs: rt5682s: Update definition of device_id tables
Thread-Topic: [PATCH 24/24] ASoC: codecs: rt5682s: Update definition of
 device_id tables
Thread-Index: AQHbg4jec2aiK+k7G0GGbyw2WCM4GbNRAlIw
Date: Fri, 21 Feb 2025 02:08:38 +0000
Message-ID: <121d215bcc3746ddae410f2f9c80e654@realtek.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
 <20250220112643.3813295-25-cezary.rojewski@intel.com>
In-Reply-To: <20250220112643.3813295-25-cezary.rojewski@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

PiBGb2xsb3cgUENJLWJhc2VkIGZvcm1hdCAoMTBFQ3h4eHgpIGZvciBBQ1BJIElEcyBieSBhZGRp
bmcgcmVsZXZhbnQgZW50cmllcyB0bw0KPiB0aGUgZXhpc3RpbmcgdGFibGUuDQo+IA0KPiBXaGls
ZSBhdCBpdCwgdGhlcmUgc2hhbGwgYmUgbm8gY29tbWEgYWZ0ZXIgdGhlIHRlcm1pbmF0b3IgZW50
cnkgYW5kIGluaXRpYWxpemluZw0KPiBmaWVsZHMgd2l0aCAwIGZvciBzdGF0aWNhbGx5IGRlZmlu
ZWQgc3RydWN0cyBpcyByZWR1bmRhbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9q
ZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgc291bmQvc29jL2Nv
ZGVjcy9ydDU2ODJzLmMgfCA3ICsrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVj
cy9ydDU2ODJzLmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY4MnMuYyBpbmRleA0KPiBjZTJlODhl
MDY2ZjMuLjVhZDBjYzNmYWI3ZiAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9ydDU2
ODJzLmMNCj4gKysrIGIvc291bmQvc29jL2NvZGVjcy9ydDU2ODJzLmMNCj4gQEAgLTMzMTAsMTMg
KzMzMTAsMTQgQEAgc3RhdGljIHZvaWQgcnQ1Njgyc19pMmNfcmVtb3ZlKHN0cnVjdCBpMmNfY2xp
ZW50DQo+ICpjbGllbnQpDQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
cnQ1Njgyc19vZl9tYXRjaFtdID0gew0KPiAgICAgICAgIHsuY29tcGF0aWJsZSA9ICJyZWFsdGVr
LHJ0NTY4MnMifSwNCj4gLSAgICAgICB7fSwNCj4gKyAgICAgICB7fQ0KPiAgfTsNCj4gIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIHJ0NTY4MnNfb2ZfbWF0Y2gpOw0KPiANCj4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgcnQ1Njgyc19hY3BpX21hdGNoW10gPSB7DQo+IC0gICAg
ICAgeyJSVEw1NjgyIiwgMCx9LA0KPiAtICAgICAgIHt9LA0KPiArICAgICAgIHsgIlJUTDU2ODIi
IH0sDQo+ICsgICAgICAgeyAiMTBFQzU2ODIiIH0sDQo+ICsgICAgICAge30NCg0KVGhlIHJ0NTY4
MnMgYW5kIHJ0NTY4MiBhcmUgZGlmZmVyZW50IGNvZGVjIGRyaXZlcnMuDQpUaGUgcnQ1NjgycyB1
c2VzIFJUTDU2ODIgQVBDSSBJRCBhbmQgcnQ1NjgyIHVzZXMgMTBFQzU2ODIuDQoNCj4gIH07DQo+
ICBNT0RVTEVfREVWSUNFX1RBQkxFKGFjcGksIHJ0NTY4MnNfYWNwaV9tYXRjaCk7DQo+IA0KPiAt
LQ0KPiAyLjI1LjENCj4gDQoNCg==
