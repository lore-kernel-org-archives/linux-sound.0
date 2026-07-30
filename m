Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166036829D
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 02:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379656; cv=none; b=YL/cSBFxxQO8JWAH2OR1bqkamX3OFCAzz3407FCD7RcO1RWDoPXlMFv4PSUPG+v3WSJb7AbpErhjBGyX2H+ba+EJNQRA5yi6/+irhHR4p8ih+Ia1RDs2yikQYK4XGajs4XzOfRv9x6Nj2kCMI2G4mU7vAg/ccL0/SE7kKJOYguI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379656; c=relaxed/simple;
	bh=tIGnZHxxu3RuLrubSm1AcDKC3je14WUF9adGIgUenKU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AqX7RzFeHhTEqkKj5gpvbatC2jUdUCZY9Yxh9Yy2GTj5EXM8sdjhyZ6BhyoNVSi7+RcC9bXCQ61s4tp8uucHqewTOzgNk+f8HH/Q2YwTlHeE5a1G8KsTnO3uB+TJdcuwzv3nwXPufuY26GOaS3noNvjMOxwQhqC4RtRzrjhmoM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=D1QVRJif; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="D1QVRJif"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66U2lAY41909980, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785379630; bh=tIGnZHxxu3RuLrubSm1AcDKC3je14WUF9adGIgUenKU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=D1QVRJif/45825KAbqFIUphvOzjBbZU6IM/AOXBqEvYX5dEi3ajxVCn63L2HnKwkm
	 FNe57iuqq7uMxnoC4IshcGP3LBb7X2k9r41CGua5qoLw8Mktg0V2jBbbN35Gjf+O89
	 NO92OKW7nj+NUn1CPN2uckcUV6RI5Q7Xn2YgF45blI1F+hSI0pM15WP4YWAMtHImFY
	 Bpgzj/wd3pMQMgKt+Cceemhx86P22Dm8y4RlXf3YFlTcmxaYSd0qEh4pFlrJkDpV7i
	 Zsi8PbHohR8WdmAi8csaeV4RiSRNzCeRf/5QV37q0mVZKXaBAyMZjqC9bVZRzcJ/s3
	 shcb5rA856fHg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66U2lAY41909980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jul 2026 10:47:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 30 Jul 2026 10:47:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 30 Jul 2026 10:47:10 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Jack Yu <jack.yu@realtek.com>, =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: rt722: reset codec to fix abnormal sound
Thread-Topic: [PATCH] ASoC: rt722: reset codec to fix abnormal sound
Thread-Index: AQHdHm+mg4iDW2o480mOb/Z7lOCMSbaEj3QAgABI/GA=
Date: Thu, 30 Jul 2026 02:47:10 +0000
Message-ID: <1976f2661500474787fba73b496f2190@realtek.com>
References: <20260728090111.3676617-1-shumingf@realtek.com>
 <950e515e-0d5c-44c7-bc14-d9bdbe841182@sirena.org.uk>
In-Reply-To: <950e515e-0d5c-44c7-bc14-d9bdbe841182@sirena.org.uk>
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

PiA+IFRoZSBhdWRpbyBvdXRwdXQgbWF5IGJlY29tZSBhYm5vcm1hbCBhZnRlciBhIHdhcm0gcmVi
b290IGZyb20NCj4gV2luZG93cy4NCj4gPiBSZXNldCB0aGUgY29kZWMgb25jZSBkdXJpbmcgaGFy
ZHdhcmUgaW5pdGlhbGl6YXRpb24gdG8gcmVzdG9yZSBpdCB0byBhDQo+ID4ga25vd24gc3RhdGUg
YW5kIHByZXZlbnQgdGhlIGlzc3VlLg0KPiANCj4gPiBAQCAtMTg4OCw2ICsxODk5LDkgQEAgaW50
IHJ0NzIyX3NkY2FfaW9faW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBzZHdfc2xh
dmUgKnNsYXZlKQ0KPiA+ICAJcnQ3MjItPmh3X3ZpZCA9ICh2YWwgJiAweDBmMDApID4+IDg7DQo+
ID4gIAlkZXZfZGJnKCZzbGF2ZS0+ZGV2LCAiJXMgaHdfdmlkPTB4JXhcbiIsIF9fZnVuY19fLCBy
dDcyMi0+aHdfdmlkKTsNCj4gPg0KPiA+ICsJaWYgKCFydDcyMi0+Zmlyc3RfaHdfaW5pdCkNCj4g
PiArCQlydDcyMl9zZGNhX3Jlc2V0KHJ0NzIyKTsNCj4gPiArDQo+ID4gIAlydDcyMl9zZGNhX2Rt
aWNfcHJlc2V0KHJ0NzIyKTsNCj4gPiAgCXJ0NzIyX3NkY2FfYW1wX3ByZXNldChydDcyMik7DQo+
ID4gIAlydDcyMl9zZGNhX2phY2tfcHJlc2V0KHJ0NzIyKTsNCj4gDQo+IFNsaXJoZ2x5IHNlcGFy
YXRlIGlzc3VlIGJ1dCB5b3UgcHJvYmFibHkgbmVlZCBhIF9qYWNrX2luaXQoKSBhZnRlciB0aGUg
cmVzZXQgLQ0KPiB5b3VyIG90aGVyIGRldmljZXMgZG8gdGhhdCwgSSB0aGluayB0aGVyZSdzIHNv
bWUgcmFjZXMgdGhlcmUuDQoNClVuZGVyc3Rvb2QuIEknbGwgYWRkIF9qYWNrX2luaXQoKSBhZnRl
ciB0aGUgcmVzZXQgdG8gYXZvaWQgaXRzIHNldHRpbmdzIGJlaW5nIHJlc2V0IGJ5IHRoZSByZXNl
dC4NCg==
