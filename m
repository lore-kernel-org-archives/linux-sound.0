Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF01A26AC3
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 05:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227121; cv=none; b=G6Gyi14l9VnpZrSrToNvXaSMAtcmZmHplsfTyzq5edGVxpjwzkc9y6WI9Hmho0XNreWrVMMzCs+6efKwQrrQJmyQv6P0jnX+M+cyt01TXwIAdshGWBVftn3AbdVMRsp3Ghyys+qINzo2O87aUYkVV4UVsZ7r7mFmfdfJ8SHhqkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227121; c=relaxed/simple;
	bh=x9v5UevyOyBgNPlDoLzxQj95qsFUZd4K05WVya9enhc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cVH/1bImvEQQ5UPy+1HgWeBezMkhqN+CfW/nCkFI6cwowsMUcEzJ6PgjHMEj/LBKU598PxzaYqgb7RaIo2IXUWT3IGb9EzbkomILMLhO2NsgrrMfL6CdvFqsWOKiaCacZmCMli5xqVRyxMVObrx9wJSjU2a1xtnVl9wZK3WD7tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=QjlvCjZ8; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="QjlvCjZ8"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68O5IGZZ0950017, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790227096; bh=x9v5UevyOyBgNPlDoLzxQj95qsFUZd4K05WVya9enhc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=QjlvCjZ8+Xj2k7RUb9peletvgWWcXx3Los5j30UekNcDT9njNrzARrRTAui59Ha1t
	 O3MwbX7zXVUr54H3uKEn/tNkvw5scVITN5w6JQ8PcQiPvEOvqk7E1a3d1CQZ3XmZkL
	 qJOlvzyPDtA27O88XRgbQytRPUaGAeNlNoxNdsywMs5iYAc02sBvL0blMVEUFl9r/w
	 CaviAimCCz37G9zg1eUQ7NEbvTR1Emy0yfnVQ/fZuOGStBa+tp9mnVJIb2zlYx9GZ4
	 An3b8e4prZiD5T+xtd4hzQlENxeAaXPzlRD4eAaa5qXPxIqGZCa1YRWiyXfBfGO9QN
	 6MBBOvtw808gw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68O5IGZZ0950017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Sep 2026 13:18:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 24 Sep 2026 13:18:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Thu, 24 Sep 2026 13:18:16 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>, =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH 1/3] soundwire: intel_auxdevice: add rt766/rt767 codec to
 wake_capable_list
Thread-Topic: [PATCH 1/3] soundwire: intel_auxdevice: add rt766/rt767 codec to
 wake_capable_list
Thread-Index: AQHdS0rlqa6acFpAwEm7NwmAV6bY3rbbkroAgAEYwhA=
Date: Thu, 24 Sep 2026 05:18:15 +0000
Message-ID: <7a61abc07cd2469289d877b70723b973@realtek.com>
References: <20260923110127.3419683-1-shumingf@realtek.com>
 <arPHDk4C5U4xAonI@sirena.co.uk>
In-Reply-To: <arPHDk4C5U4xAonI@sirena.co.uk>
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

PiA+DQo+ID4gcnQ3NjYvcnQ3NjcgaGF2ZSB3YWtlIGNhcGFiaWxpdHkuIEFkZCBpdCB0byB0aGUg
d2FrZV9jYXBhYmxlX2xpc3QuDQo+IA0KPiBBcyBJIHRoaW5rIEkndmUgbWVudGlvbmVkIGJlZm9y
ZSB5b3VyIHBhdGNoIHNlcmllc2VzIGFyZSBhbHdheXMgcG9zdGVkIGEgYml0DQo+IHN0cmFuZ2Vs
eSwgdGhleSdyZSBub3QgdGhyZWFkZWQgdG9nZXRoZXIgYW5kIHlvdSBuZXZlciBzdXBwbHkgYSBj
b3ZlciBsZXR0ZXIuDQo+IFRoaXMgbWFrZXMgaXQgaGFyZCB0byB3b3JrIHdpdGggdGhlbSwgdG9v
bGluZyBnZXRzIGNvbmZ1c2VkIGJ5IHRoZQ0KPiBub24tc3RhbmRhcmQgcHJlc2VudGF0aW9uLg0K
PiANCj4gWW91IG1pZ2h0IHdhbnQgdG8gbG9vayBhdCBiNCB0byBzZW5kIHRoZSBwYXRjaGVzLCBl
c3BlY2lhbGx5IGl0J3Mgd2ViDQo+IHN1Ym1pc3Npb24gZW5kcG9pbnQgd2hpY2ggYXZvaWRzIGhh
dmluZyB0byBjb25maWd1cmUgbWFpbDoNCj4gDQo+ICAgIGh0dHBzOi8vYjQuZG9jcy5rZXJuZWwu
b3JnL2VuL2xhdGVzdC9jb250cmlidXRvci9vdmVydmlldy5odG1sDQoNClNvcnJ5LCB3aWxsIHVz
ZSBiNCB0b29sIHRvIHNlbmQgdjIgYW5kIHN1cHBseSBhIGNvdmVyIGxldHRlci4NCg0K
