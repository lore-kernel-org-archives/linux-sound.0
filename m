Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D51AB52B
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720090096; cv=none; b=FuOgfNe0AQTBr2BPrAZk0iWykuwe0ndGV+UhEVaOhfLSicgCDEgq7rGUr+WwGSGLrF58/Rl7qlkaig8+69Zy5aJ5X5Yeo7fFlurpymWjiWtA2jQv9E6/R2M+aRecoAFi+a/hN7wePsPgdAFsyLUFYDlNOg+/vTiUHE4n1bnpJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720090096; c=relaxed/simple;
	bh=021B+nDDFJYmPqQLiWBQg88Umc60oI4Ob+wRDtI3L1w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YYQrEuWOiq0lZdLwl8ZoFy62/v1K198N+myd6pQg+lTxHI34rnZvynDyWHCu1hjaLdP50IQuzm5tteILRvHjSdGo6E3bUdMB4x7KqU48rm265dXHJEVTw0ZwlFPt+RSsdLp3rQVJqBfusB6nV2BzBqIXrFKLYk8qg7JMLAoAi9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 464AldS733336488, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 464AldS733336488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Jul 2024 18:47:39 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 4 Jul 2024 18:47:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jul 2024 18:47:38 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Thu, 4 Jul 2024 18:47:38 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "tiwai@suse.de" <tiwai@suse.de>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "bard.liao@intel.com"
	<bard.liao@intel.com>
Subject: RE: [PATCH] ASoC: rt711-sdw: add missing readable registers
Thread-Topic: [PATCH] ASoC: rt711-sdw: add missing readable registers
Thread-Index: AQHazfPl1OvOzKc8KEScDZ0jlNoSqbHmYtrg
Date: Thu, 4 Jul 2024 10:47:38 +0000
Message-ID: <3680b9f0d42c4dcba146a4f2689c9988@realtek.com>
References: <20240704092327.652609-1-yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240704092327.652609-1-yung-chuan.liao@linux.intel.com>
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

PiBUaG9zZSByZWdpc3RlcnMgd2lsbCBiZSB1c2VkIHdoZW4gSkQgc291cmNlIGlzIFJUNzExX0pE
Ml8xUDhWXzFQT1JULg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmFyZCBMaWFvIDx5dW5nLWNodWFu
LmxpYW9AbGludXguaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogUGllcnJlLUxvdWlzIEJvc3Nh
cnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQoNCkFja2Vk
LWJ5OiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5jb20+DQoNClRoYW5rcy4NCg0KPiAg
c291bmQvc29jL2NvZGVjcy9ydDcxMS1zZHcuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzEx
LXNkdy5jIGIvc291bmQvc29jL2NvZGVjcy9ydDcxMS1zZHcuYw0KPiBpbmRleCA4Y2E4YmNkMTc3
YWIuLmRmZGE2YmI1YzZmOCAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9ydDcxMS1z
ZHcuYw0KPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzExLXNkdy5jDQo+IEBAIC0zOCw3ICsz
OCw5IEBAIHN0YXRpYyBib29sIHJ0NzExX3JlYWRhYmxlX3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2Ug
KmRldiwNCj4gdW5zaWduZWQgaW50IHJlZykNCj4gICAgICAgICBjYXNlIDB4ODMwMCAuLi4gMHg4
M2ZmOg0KPiAgICAgICAgIGNhc2UgMHg5YzAwIC4uLiAweDljZmY6DQo+ICAgICAgICAgY2FzZSAw
eGI5MDAgLi4uIDB4YjlmZjoNCj4gKyAgICAgICBjYXNlIDB4NzUyMDA4Og0KPiAgICAgICAgIGNh
c2UgMHg3NTIwMDk6DQo+ICsgICAgICAgY2FzZSAweDc1MjAwYjoNCj4gICAgICAgICBjYXNlIDB4
NzUyMDExOg0KPiAgICAgICAgIGNhc2UgMHg3NTIwMWE6DQo+ICAgICAgICAgY2FzZSAweDc1MjA0
NToNCj4gLS0NCj4gMi40My4wDQo+IA0KDQo=
