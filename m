Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2529C1F95C;
	Wed, 31 Dec 2025 02:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148051; cv=none; b=u11ANF6tcXqyhzxxtdTrrJSzzVefUpbS6cOt8OA3stlMEuClXtAiGCwHdTp+FfARdl02DClvJJRa4irozNkaSqQbvA/p3eWscJJYOIQ353UsPHDuU8BCbBJMyE8vfHiSb/qKUJ7+WhS/uLIp288qqgbutDkWshcdkSqMJHxTB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148051; c=relaxed/simple;
	bh=XR6rKn9MfBnuHrf+SFg25Qnko+Xx0LMcYu8Q9RctwyQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mC4LM+vqOgZo1aCXZoqTm3YlAIGniriUw7rsTIFMG39JGX7d97zzJAeqCrOkNdgTJ+QCN5C61RGOMAcl4mfHCBBkn5uYf+m6lNH4lQgdVRmhBaMrdl0iSCl4aL/y0eYUdiaZJdhDt35uo8EIAVc47El5YKPk2RGgB3f7Tq+E+P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=fail (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=LIttljs1 reason="signature verification failed"; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="LIttljs1"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BV2Qk7rA255715, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1767148006; bh=XR6rKn9MfBnuHrf+SFg25Qnko+Xx0LMcYu8Q9RctwyQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=LIttljs1ORQvL5Z5zkKmp/Gm96VotgVRPmaMGRJZSQHtM1/HVIqKxtEAH2jbQlya4
	 WdfUP8dAyK15l6djj6ssUjEOytwOe3QFnw1oSOcTnBoswguq6Gb8eN+9eZv9eVeuo9
	 itrtkD14dj4IyJjOW7LAPB3Ac9APAHm0QFEtRghT/hW60RIKftUpQuDxuWI/Md1Pxr
	 xutquBOHEIxxaliCFKyfMotKltv54OYk7HnkMTcdc4Ma21cUqWtHks/jx6gvLwEOXu
	 niW2CnVxxjkckMzMzJEpV+RpgyQaiWxp2l1JbV+dR/BTkrb2PU/4da4S1qaaxtjhGg
	 i/Ob7cCqgl7/A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BV2Qk7rA255715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Dec 2025 10:26:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 31 Dec 2025 10:26:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 31 Dec 2025 10:26:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Wed, 31 Dec 2025 10:26:46 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Rob Herring'" <robh@kernel.org>
CC: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Flove(HsinFu)" <flove@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
Thread-Topic: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
Thread-Index: AQHcdkLqh/rMpMzvnkCUGMXyQR8FMrU598uAgAEVLoA=
Date: Wed, 31 Dec 2025 02:26:46 +0000
Message-ID: <2f37dcd86a9c41808b918371a23dfebb@realtek.com>
References: <20251226083914.1052653-1-oder_chiou@realtek.com>
 <20251230175333.GA854335-robh@kernel.org>
In-Reply-To: <20251230175333.GA854335-robh@kernel.org>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDMxLCAyMDI1IDE6NTQgQU0N
Cj4gVG86IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+DQo+IENjOiBjZXphcnku
cm9qZXdza2lAaW50ZWwuY29tOyBicm9vbmllQGtlcm5lbC5vcmc7IGxnaXJkd29vZEBnbWFpbC5j
b207DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgcGVyZXhAcGVy
ZXguY3o7DQo+IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgRmxvdmUoSHNpbkZ1KSA8
ZmxvdmVAcmVhbHRlay5jb20+OyBTaHVtaW5nIFutUw0KPiCu0bvKXSA8c2h1bWluZ2ZAcmVhbHRl
ay5jb20+OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPjsgRGVyZWsgW6TovHcNCj4guHFd
IDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSAzLzRd
IEFTb0M6IGR0LWJpbmRpbmdzOiByZWFsdGVrLHJ0NTU3NTogYWRkIHN1cHBvcnQgZm9yDQo+IEFM
QzU1NzUNCj4gDQo+IA0KPiBFeHRlcm5hbCBtYWlsIDogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZy
b20gb3V0c2lkZSB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QNCj4gcmVwbHksIGNsaWNrIGxpbmtz
LCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5k
DQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gRnJpLCBEZWMg
MjYsIDIwMjUgYXQgMDQ6Mzk6MTRQTSArMDgwMCwgT2RlciBDaGlvdSB3cm90ZToNCj4gPiBBdWRp
byBjb2RlYyB3aXRoIEkyUywgSTJDIGFuZCBTUEkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBP
ZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBSb2Ig
SGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGlu
Z3Mvc291bmQvcmVhbHRlayxydDU1NzUueWFtbCAgICAgICAgfCA2MQ0KPiArKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9yZWFsdGVrLHJ0NTU3NS55YW1sDQo+IA0KPiBXaGVyZSdzIHRoZSByZXN0IG9mIHRoZSBzZXJp
ZXM/IFlvdSBhcmUgbWlzc2luZyBhbiBJbi1SZXBseS1UbyBoZWFkZXIgYW5kIHRoYXQNCj4gYnJl
YWtzIHRoZSB0b29scyAoYjQpLg0KPiANCkhpIFJvYiwNCg0KU29ycnkgYWJvdXQgdGhhdCChWCB0
aGlzIHdhcyBhIHNlbmQtZW1haWwgdGhyZWFkaW5nIGlzc3VlLg0KSSdsbCByZXNlbmQgdGhlIGZ1
bGwgdjExIHNlcmllcyB3aXRoIHByb3BlciBJbi1SZXBseS1UbyBoZWFkZXJzLg0KDQpUaGFua3Ms
DQpPZGVyDQo=
