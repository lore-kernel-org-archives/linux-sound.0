Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9A95FEED;
	Wed, 18 Dec 2024 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508657; cv=none; b=RUjiryHwAWDtfTnyc51gFwMfNdBtmtfBYtgcM2sXr5q8vqgE0cNrFnkFdzBXho8Bg1ktsFxUEESt3TOzkg3yVbGU3cKh8vW+GUJcEqTTaQQJUfOICfYmsrVl8erJ/G9aodkNMMTkzigWnuHewRxwB8KvvdfVArEOCtj4ScwFH2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508657; c=relaxed/simple;
	bh=OdPgnuPEvg2me4FUk+zANV3GaADLz8Vv4Re8b4EYaD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W7FfVC/XKMFK89CUbeDmkDj7H+QBw7AGRmnmXvgA4Bn6VpNKvszj96yr5ZzNEdma9PJju29ufK4iDZKh5kjEKH+oe7JxVtBr6tWSgfeSKTdzH+pdGIPktoD/571A8Ub9ydq0uKZfZLtKAhJm2s/qzBbALyxRf6da0N1H/mtRiz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=BFyU8TTR; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="BFyU8TTR"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4BI7uohrF1956710, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1734508610; bh=OdPgnuPEvg2me4FUk+zANV3GaADLz8Vv4Re8b4EYaD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=BFyU8TTRpze+e7yBscrLWf86ODW5wQRD5imL95AFXtAP0k+76eTqW8Ou97QQKlhyD
	 CyYph6jxcNEWXfY6vxoXt6oYS1VdV1BhRHexnflooUr7JqTZPOZU11rOW9sKJeVkjb
	 LC7bxegI8KFTKG1bfnNqvK/mJTYqvy5jwrGFDx9r8aAIv78Ipeg+ngRhrmunsD7pCo
	 s0/4cLPHyF8s/wHVyCzJju0TR4ZdijAn3I9I/23Pgk7umRIucW7tl5QUOZ7rv9yNCI
	 UUH+HiG/Nnpt6UiIzJoIHuCIZGjZqXU9rw/xVGlE5TZzyVtWlzUvab7UvRhRNLqZ+t
	 iIlVPrc5nhrbQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4BI7uohrF1956710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Dec 2024 15:56:50 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Dec 2024 15:56:50 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 18 Dec 2024 15:56:50 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Wed, 18 Dec 2024 15:56:50 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Oder Chiou
	<oder_chiou@realtek.com>
CC: Jack Yu <jack.yu@realtek.com>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "peter.ujfalusi@linux.intel.com"
	<peter.ujfalusi@linux.intel.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "sanyog.r.kale@intel.com"
	<sanyog.r.kale@intel.com>,
        "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        "Flove(HsinFu)" <flove@realtek.com>
Subject: RE: [PATCH 5/5] ASoC: rt722-sdca: Make use of new expanded MBQ regmap
Thread-Topic: [PATCH 5/5] ASoC: rt722-sdca: Make use of new expanded MBQ
 regmap
Thread-Index: AQHbUIvtON9PX5Jn+EOcADyToDdHSbLrim/A
Date: Wed, 18 Dec 2024 07:56:49 +0000
Message-ID: <67b4ae369da2499da6f511671b61b13a@realtek.com>
References: <20241217135921.3572496-1-ckeepax@opensource.cirrus.com>
 <20241217135921.3572496-6-ckeepax@opensource.cirrus.com>
In-Reply-To: <20241217135921.3572496-6-ckeepax@opensource.cirrus.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
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

PiBOb3cgdGhlIE1CUSByZWdtYXAgaW1wbGVtZW50YXRpb24gaGFuZGxlcyBtdWx0aXBsZSBzaXpl
cywgdGhpcyBkcml2ZXIgY2FuDQo+IGNvbWJpbmUgaXRzIHR3byByZWdpc3RlciBtYXBzIGludG8g
b25lLiBTbyByZW1vdmUgbWJxX3JlZ21hcCBhbmQgY29tYmluZQ0KPiBhbGwgdGhlIHJlZ2lzdGVy
cyBpbnRvIHJlZ21hcC4NCj4gDQo+IEFsc28gYXMgcnQ3MjJfc2RjYV9hZGNfbXV4X2dldC9wdXQo
KSBvbmx5IGV4aXN0IHRvIGFjY2VzcyBtYnFfcmVnbWFwLA0KPiByYXRoZXIgdGhhbiBkb2luZyBh
bnkgcHJvY2Vzc2luZywgdGhlc2UgY2FuIG5vdyBiZSBkcm9wcGVkIGFuZCB0aGUgbm9ybWFsDQo+
IERBUE0gaGVscGVycyB1c2VkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxlcyBLZWVwYXgg
PGNrZWVwYXhAb3BlbnNvdXJjZS5jaXJydXMuY29tPg0KPiAtLS0NCj4gDQo+IE5vdGUgdGhpcyBw
YXRjaCBpcyBvbmx5IGJ1aWxkIHRlc3RlZCwgYXMgSSBkbyBub3QgaGF2ZSBydDcyMiBoYXJkd2Fy
ZSwgd291bGQgYmUNCj4gZ3JlYXQgaXMgc29tZW9uZSBjb3VsZCB0ZXN0Lg0KPiANCj4gVGhhbmtz
LA0KPiBDaGFybGVzDQoNCkhpIENoYXJsZXMsDQoNClRoYW5rcyBmb3IgdGhlc2UgcGF0Y2hlcyB0
byBleHBhbmQgU2RXIE1CUSByZWdtYXAgc3VwcG9ydC4NCldlIG5lZWQgdG8gZG8gbW9yZSB0ZXN0
cyB3aXRoIHJ0NzIyIGJlZm9yZSBtZXJnaW5nIHRoaXMgY2hhbmdlIG9mIHJ0NzIyIGNvZGVjIGRy
aXZlci4NCg0KDQo=
