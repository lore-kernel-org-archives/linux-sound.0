Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D98F3AB27C
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641254; cv=none; b=QS652kW7Ko+dfrLM10OZBuZRXz7YJxWiimZeaSoM/FL9h2yFgyVlODwcscC0IdWxvOI4uGiHQoE1Cf2ORozFnXXyfzx+FZi86LT5nax4yecUAndtJV4JPMaSqTVrA0LdQBp6jpvx5mjEmppf1ir0yhIo1LKEirJkLMrWqmwCcmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641254; c=relaxed/simple;
	bh=51fwlOR8ZGQMeHDRWp6pTCeM3XDOLtbpIqhOBpiuL6o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sNnG9588qqvaAhy07jMvJNgeHDsoeIjpKRzQ6zRArtLPfOja/CSGnj8Prg5NP7hD02Vz9BSLvgk8qD40Q4gqXMT/kkZLkgvdCCTLhHv6ESRMDk5gCeyJNjEAkzbsv8eOnLY7rzhHSuv75RiudUGHmk7Qoh1pQdaEot1H2LC+lwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=RivegpGn; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="RivegpGn"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6389eKwJ52926542, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775641220; bh=51fwlOR8ZGQMeHDRWp6pTCeM3XDOLtbpIqhOBpiuL6o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RivegpGn+CD7L66QrWfoVx8vdT7wVtygTgWgX/zdfiJgg8u3iRLeD6zuP0fqw96mM
	 0XPimh56gdtzR3nOGRVFDrI023lfzIa3IfN6ui6Co2efrMQRw7Fqpl/u8wXo1NVkTz
	 D4B5WCAND4Sn6VvZzM+Tq0pKxDtHXlLEw3eMNTbtKS8wlZ4XPI8WGNLRPF8fKqVthI
	 xPZ9vRw004t+5l1G28wpPC+nynodyY4tK1PrEcSAlp/b8JWtEBthCwEWqzIfuIMx/b
	 x1vb1VEJceDdFrn6HNevvsyLKtVm6J58YOQ65i4klaTNlkCeT37tjaqf1ecAXT8faA
	 1tp9u9TDG9ZIg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6389eKwJ52926542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 17:40:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 17:40:20 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 17:40:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Wed, 8 Apr 2026 17:40:15 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: SDCA: restore the settings if power is lost during
 suspend
Thread-Topic: [PATCH] ASoC: SDCA: restore the settings if power is lost during
 suspend
Thread-Index: AQHcxzWMkthJJxXjP0+Tgp1kq2e8vrXUXbyAgACHJnA=
Date: Wed, 8 Apr 2026 09:40:15 +0000
Message-ID: <0f4584c21f1943a18c2e25295daab931@realtek.com>
References: <20260408085607.3813488-1-shumingf@realtek.com>
 <adYeL2xsalE5dcY6@opensource.cirrus.com>
In-Reply-To: <adYeL2xsalE5dcY6@opensource.cirrus.com>
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

PiBPbiBXZWQsIEFwciAwOCwgMjAyNiBhdCAwNDo1NjowN1BNICswODAwLCBzaHVtaW5nZkByZWFs
dGVrLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5j
b20+DQo+ID4NCj4gPiBXZSBzaG91bGQgcmVzdG9yZSB0aGUgTUlQSS1kZWZpbmVkIHJlZ2lzdGVy
cyB3aGVuIHRoZSBkZXZpY2UgaXMgYXR0YWNoZWQuDQo+ID4gSWYgYSBmdW5jdGlvbiBzdGF0dXMg
aW50ZXJydXB0IG9jY3VycywgdGhlIGRldmljZSB3aWxsIHRyaWdnZXIgYW4gaW50ZXJydXB0IHRv
DQo+IHJlbG9hZCB0aGUgc2V0dGluZ3MuDQo+ID4NCj4gDQo+IEFyZSB5b3UgYWN0dWFsbHkgaGl0
dGluZyB0aGlzIGluIHByYWN0aWNlPyBXaGF0IGlzIHRoZSBzaXR1YXRpb24gd2hlcmUgdGhlIGRl
dmljZQ0KPiBsb3NlcyBwb3dlciBidXQgaXQgaXNuJ3QgY292ZXJlZCBieSB0aGUgbm9ybWFsIHN1
c3BlbmQvcmVzdW1lIGZsb3c/DQoNClRoaXMgaXMgYSBzY2VuYXJpbyB3aGVyZSB0aGUgbWFjaGlu
ZSBlbnRlcnMgaGliZXJuYXRpb24gYW5kIGN1dHMgcG93ZXIgdG8gdGhlIGNvZGVjLg0KSSBzaW11
bGF0ZWQgdGhpcyBjYXNlIGFuZCB2ZXJpZmllZCB0aGF0IGl0IHdvcmtzIGFzIGV4cGVjdGVkLg0K
DQo=
