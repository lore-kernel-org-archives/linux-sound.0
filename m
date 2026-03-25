Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454283C2794
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435911; cv=none; b=QEgBL3dQJcw+RRzfRwuxN/xDLjNdoPhl5ksA9eZeMXNTbrT4ZZTOL35kUPhrtRQJtj2eosRdvlVEQVTupmWi0rJaYQadtSnRt37ffRgLFvfb0PLoFNfivHmnYvS8p+ttEsq9ifEYPEl6vddvvuQOVYgXPKLL0MLvxQm24aiYwxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435911; c=relaxed/simple;
	bh=khYk5smUcsNuj9FZh0AcsSszTX03tCW6Rt3uT7IWe8s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s+p9jJ+fIDLAJztDhp9T7aC4MEMd8kHyq3DEOiWQ832gfhFB1SVTNtJTwDdFeu/l+ewl1PUT3v+SGs+1CLw9Y6D+ZR3DBd8RlXzo3D1Yns/Kbg1OL/0EmRJEmoRf6vKOXr6444hXjfab0zfZ8Vv9MmZMD8n5s4Y+f3LweMzMw9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=p293YdgD; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="p293YdgD"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62PApPHk93231513, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774435885; bh=khYk5smUcsNuj9FZh0AcsSszTX03tCW6Rt3uT7IWe8s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=p293YdgDToUSFH7wyDXpWv0kEK0Cpdwjf9l7Q0WFUHdc9wqvQWoKeu4eTgEh4QXlk
	 Ts+v1zKPYX+8lAU21MAA4AWyLdBiOHqvLCT4EgwoxlYinJH7D7d93OCtylE1b4b7iI
	 3uZnlaGFKevGFQ3bXfJPaPMoifN91GFuaKiWax1/FSQMpB83t+CoR1uAgjTLeoMC7R
	 vJz3ATvehBJpWQTKOqotyKQ8GN6aeouzMHmJX3Wk2CbbsZXqFng9j1OgnwS+z0dUHu
	 Q1SMDPDqh1n13H3jomW3groX4q9vxw0dL+77JWaWaUrOuTk1Uny23MgaTePEypnkOO
	 CJrllfWiFNRNA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62PApPHk93231513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2026 18:51:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Mar 2026 18:51:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::46e9:fab9:b2cf:c99b%10]) with mapi id
 15.02.1748.010; Wed, 25 Mar 2026 18:51:26 +0800
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
Subject: RE: [PATCH 2/2] ASoC: SDCA: fix finding wrong entity
Thread-Topic: [PATCH 2/2] ASoC: SDCA: fix finding wrong entity
Thread-Index: AQHcvDigKgn35KOl5UG7sst3DrsZZbW+glOAgACPjqA=
Date: Wed, 25 Mar 2026 10:51:25 +0000
Message-ID: <738a67aa724b40cbb94764cc3567a5b0@realtek.com>
References: <20260325092028.3221671-1-shumingf@realtek.com>
 <acO1+yld0mhWjxvW@opensource.cirrus.com>
In-Reply-To: <acO1+yld0mhWjxvW@opensource.cirrus.com>
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

PiA+IFRoaXMgcGF0Y2ggZml4ZXMgYW4gaXNzdWUgbGlrZToNCj4gPiB3aGVyZSBzZWFyY2hpbmcg
Zm9yIHRoZSBlbnRpdHkgJ0ZVIDExJyBjb3VsZCBpbmNvcnJlY3RseSBtYXRjaCAnRlUgMTEzJyBm
aXJzdC4NCj4gPiBUaGUgZHJpdmVyIHNob3VsZCBmaXJzdCBwZXJmb3JtIGFuIGV4YWN0IG1hdGNo
IG9uIHRoZSBmdWxsIHN0cmluZyBuYW1lLg0KPiA+IElmIG5vIGV4YWN0IG1hdGNoIGlzIGZvdW5k
LCBpdCBjYW4gdGhlbiBmYWxsIGJhY2sgdG8gYSBwYXJ0aWFsIG1hdGNoLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogU2h1bWluZyBGYW4gPHNodW1pbmdmQHJlYWx0ZWsuY29tPg0KPiANCj4gQ291
bGQgdXNlIGEgZml4ZXMgdGFnOg0KPiANCj4gRml4ZXM6IDQ4ZmE3N2FmMmY0YSAoIkFTb0M6IFNE
Q0E6IEFkZCB0ZXJtaW5hbCB0eXBlIGludG8gaW5wdXQvb3V0cHV0IHdpZGdldA0KPiBuYW1lIikN
Cg0KV2lsbCBhZGQgdGhlIGZpeGVkIHRhZy4NCg0KPiA+IC0tLQ0KPiA+ICBzb3VuZC9zb2Mvc2Rj
YS9zZGNhX2Z1bmN0aW9ucy5jIHwgMTEgKysrKysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9z
b3VuZC9zb2Mvc2RjYS9zZGNhX2Z1bmN0aW9ucy5jDQo+ID4gYi9zb3VuZC9zb2Mvc2RjYS9zZGNh
X2Z1bmN0aW9ucy5jIGluZGV4IDBiN2Q5N2RjYjIzNi4uMDc4N2JmMDI0ZDIxDQo+ID4gMTAwNjQ0
DQo+ID4gLS0tIGEvc291bmQvc29jL3NkY2Evc2RjYV9mdW5jdGlvbnMuYw0KPiA+ICsrKyBiL3Nv
dW5kL3NvYy9zZGNhL3NkY2FfZnVuY3Rpb25zLmMNCj4gPiBAQCAtMTYwMiw5ICsxNjAyLDE4IEBA
IHN0YXRpYyBzdHJ1Y3Qgc2RjYV9lbnRpdHkNCj4gKmZpbmRfc2RjYV9lbnRpdHlfYnlfbGFiZWwo
c3RydWN0IHNkY2FfZnVuY3Rpb25fZGF0YSAqDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhcg0KPiA+ICplbnRpdHlfbGFiZWwp
ICB7DQo+ID4gICAgICAgaW50IGk7DQo+ID4gKyAgICAgc3RydWN0IHNkY2FfZW50aXR5ICplbnRp
dHkgPSBOVUxMOw0KPiANCj4gTWlub3Igbml0IHB1dCB0aGlzIGFib3ZlIHRoZSBpbnQgaTsNCg0K
U3VyZSwgd2lsbCBmaXgNCg0KPiBCdXQgbG9va3MgbGlrZSBhIGdvb2QgZml4LCB0aGFua3MgZm9y
IHNwb3R0aW5nIHRoYXQuDQo+IA0KPiBUaGFua3MsDQo+IENoYXJsZXMNCg==
