Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CA93BED59
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 10:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435911; cv=none; b=tXT2rnEQUvY4u3jPJkXcq5ny2Sbm/ylW6BzBCnFJJ+DK5h8dG88rjgAYrMSBhxFEx/PAEO7NUIMyZzkrSmgGfbyNvLkEq1IKnpqBObYzneJN9SpUG3fCKAgetvfkI6F1pwINUSnr66zWmE8LI8LrIOk03ugHMKeowGTl2PCH91M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435911; c=relaxed/simple;
	bh=gC0VJeZkzBXTtycM5Rxa4ZYpoUe5KqAGvra1EJcFkvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WlbYAg+Y0Ev2ScayS1ZBD0KttSZIXTl0leTykpGHhhW4/nfex5BQNV1hkBxl1wqm8tz2eSWT8N+3a7z2UrrfJVSWN+i05QepgmeLPiOoMCOZpJghE8unjonxPNK+LRXvgEhNjGKfbpnjdrraxkxZUshNpbMRjQVpVNZdMryCLss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=lzTL1Y1C; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="lzTL1Y1C"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62PApOHP13231511, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774435884; bh=gC0VJeZkzBXTtycM5Rxa4ZYpoUe5KqAGvra1EJcFkvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=lzTL1Y1C5Rw4XDAWRzpIPXXrXh8FiUX2Ialcbrl7OWWNB2hjEwAZl2OQusjJLQJHm
	 dbZO2lu4Iy0zcmfLZuMUmpZXxthjCW6HhvgvSR7NX0r/FCfKXRY0A0kB30jnu1BYKy
	 jmY/sjpr6pnk92l5ZDfptuQUUe30cw3w/cdE+lppNOvnw7pOid+yGQGecQJGNIeouF
	 OxJDgfxMVS5k6VnL/YagvRW7aUCpXK5j5t9/u4bdeHaY5p08ax9e+RFcDCPJbFk41l
	 4dXOZ0ViUx5ghOHSIKeGjnR+ieVf1hGZyql7TyivoSg5ghX+QyM+csgf99hkOJ6qiM
	 qWW0AErvEcjmw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62PApOHP13231511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2026 18:51:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Mar 2026 18:51:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Mar 2026 18:51:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::46e9:fab9:b2cf:c99b%10]) with mapi id
 15.02.1748.010; Wed, 25 Mar 2026 18:51:25 +0800
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
Subject: RE: [PATCH 1/2] ASoC: SDCA: remove the max count of initialization
 table
Thread-Topic: [PATCH 1/2] ASoC: SDCA: remove the max count of initialization
 table
Thread-Index: AQHcvDialHrdkBa/BEmBa/W4w46s/LW+fdmAgACScEA=
Date: Wed, 25 Mar 2026 10:51:24 +0000
Message-ID: <1bdba8facd57429ca8a191dcd0496c5e@realtek.com>
References: <20260325092017.3221640-1-shumingf@realtek.com>
 <acOyOZ4fxUoQ0p5L@opensource.cirrus.com>
In-Reply-To: <acOyOZ4fxUoQ0p5L@opensource.cirrus.com>
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

PiBPbiBXZWQsIE1hciAyNSwgMjAyNiBhdCAwNToyMDoxN1BNICswODAwLCBzaHVtaW5nZkByZWFs
dGVrLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5j
b20+DQo+ID4NCj4gPiBUaGUgbnVtYmVyIG9mIHRoZSBpbml0aWFsaXphdGlvbiB0YWJsZSBtYXkg
ZXhjZWVkIDIwNDguDQo+ID4gVGhlcmVmb3JlLCB0aGlzIHBhdGNoIHJlbW92ZXMgdGhlIGxpbWl0
YXRpb24gYW5kIGFsbG93cyB0aGUgZHJpdmVyIHRvDQo+ID4gYWxsb2NhdGUgbWVtb3J5IGR5bmFt
aWNhbGx5IGJhc2VkIG9uIHRoZSBzaXplIG9mIHRoZSBpbml0aWFsaXphdGlvbiB0YWJsZS4NCj4g
DQo+IFdlIHdlcmUgY29uY2VybmVkIHRoaXMgbWlnaHQgYmUgYSBsaXR0bGUgdG9vIGxvdy4gQXJl
IHdlIHN1cmUgd2Ugd2FudCB0bw0KPiByZW1vdmUgdGhlIGxpbWl0IHJhdGhlciB0aGFuIGp1c3Qg
aW5jcmVhc2luZyB0aGUgYWxsb3dlZCBzaXplPyBJIGZlZWwgbGlrZSBJIGNhbg0KPiBzZWUgYXJn
dW1lbnRzIGZvciBib3RoIHdheXMsIG9uIG9uZSBoYW5kIHRoaXMgaXMgaW5wdXQgdG8gdGhlIGRy
aXZlciByYXRoZXINCj4gdGhhbiBwYXJ0IG9mIGl0IHNvIGl0IGZlZWxzIHNlbnNpYmxlIHRvIHNh
bml0eSBjaGVjayBpdCwgb24gdGhlIG90aGVyIGhhbmQgaXRzIHRoZQ0KPiBCSU9TIHNvIHJlYWxs
eSB3ZSBzaG91bGQgYmUgYWJsZSB0byB0cnVzdCB0aGF0Lg0KDQpJIHRoaW5rIHdlIHNob3VsZCB0
cnVzdCB0aGUgQklPUy4NCklmIHRoZSBCSU9TIGlzIHVwZGF0ZWQsIHRoZSBudW1iZXIgbWF5IGlu
Y3JlYXNlLg0KSXQncyBkaWZmaWN1bHQgdG8gZGVmaW5lIGEgZml4ZWQgdmFsdWUgZm9yIHRoaXMg
YXJndW1lbnQuDQoNCg==
