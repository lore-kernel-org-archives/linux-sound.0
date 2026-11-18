Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972789;
	b=bppM2A/EVtePY81JimJ1w2YlfhrLzOuhKWNUxxVg8mzG4jnI0tDK/d1dIf+sdtQI6B4D
	 874CW6T5jFeyQsBueanKhcRpUg6dUKxJ6nhjGfKo9uv0HsoWtp7NRT7tlR3YssD9vM8IO
	 FL0FBRpGWeWlo8xpyNjxO5o5tnbQqGrmzK7iR1EmwzRF35EEO/b3LYrG0HtfxfU0I+MsA
	 Ufk18I6VQ9ggD3FU54/IZm0AcW2XFgTkkMvDGGbutVtiQZ7N/ZsMqwrDJwLZ8Bgqzn+/N
	 t+7I2ovAVaUaWHTYpBLTVexTzU7cO+ePc4MciNXOPY1S94El2XuusQiWknvfWE7yAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972789;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=kZ4Qj45/nVhw+wEM+ObjY6ynwG6t9Cb17VAEzM7ECRs=;
	b=lMbbHMtEVpc2SbZMhAR427pVmQch+MiWIo3qEIyZlT+bWM9tMJsIGvRiFotSOdBTYm2v
	 o3WDL4In6F70jLtlu/+/+93LuOWih6odSE1xdGOavFIf9ukqj1tX0fSFIA4anotZOyQOM
	 m4/WWvSb/A/aZ8ociq/FCbag2SUSmUrtMeyIga0Z3oIVbCGq0AvyRp09tZTAAe8Qom+Ic
	 OJqssplyDURG5VTEohz7gBOk41SaFghxzI1bYFRTil7ZHqYWlczsF8oJ+FxpsVSDjxLDV
	 yezlzaPvTPEISMZESo7n+fTu2tbgY8E+9U21dosuw+0dACeLQjrXyUfIVcn2LXTZ3lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=EvrG5hEB;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3762606A31C;
	Wed, 18 Nov 2026 03:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3762606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=EvrG5hEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794972736;
	bh=kZ4Qj45/nVhw+wEM+ObjY6ynwG6t9Cb17VAEzM7ECRs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=EvrG5hEBm7nyHplPFHKkRNi9Is9MA1A10r7VixEaXzmvH22wvQF7UW1wilJ9El1UB
	 NihiLqRmJ11Q//zyTXyxa6XTUlKnFQvui9RP7kyIG72zEjHWdUA011EqEIrBqkC8q3
	 4P1z/6LTjsGOaS8DYhv/KrWSePpxxZIYsGxZfXYs=
X-QQ-mid: esmtpgz10t1794972720t90f23719
X-QQ-Originating-IP: qbeV1AKGN9RpP899OZoSsXcI9sL6Pb84dNgTbM8l/hs=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 11:31:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14367264520237322865
EX-QQ-RecipientCnt: 8
From: Haowen Tu <tuhaowen@uniontech.com>
To: broonie@kernel.org
Cc: peda@lysator.liu.se,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ASoC: max9860: Register the supply notifier after initializing regmap
Date: Wed, 18 Nov 2026 11:31:56 +0800
Message-ID: <BF435C6BC6FC2868+20261118033156.3845276-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NIUeOSCg5F579AqUo6IpBoajuRETgnAzykTAdbg0yqVdDJGeW3Z/PVdV
	P1j/JgA4PFAC0dW0GyygZMLBOz2gax7zG2xemXdJlRA8C+oBnlOEnqINPMFvIxm2A9oEWAn
	WjzjclSrv2tz0iA+SHDRBpUV7difXPuy/o+rx5vcAJEUuFGHeDDiuvP97Qw4TCtxTQ9o3cS
	0fHOtwCOThmKS/6Xy8ymAKLtBB2Sibm/UubSTTltHIzvLD1IKp53v301Ke0b6k8havwRdrk
	yssNlVi8Xye42OkuEsj6n+8WS4SZZ+YXqP6uwpJHG6cooKglyUVz4qpAkYFHVkBYSJbq5Sx
	obceK6Mj/Dmhkr/bfXffVQJJVuNbenVzRpEWkdCLS0Pt2I9UQUQwpO9lp685yk9GcapRYDN
	Xv0cPoNAgROeorcOAKYGtzY0fXfdeT5i5MWnE5TbC0nSPhNP3yiXyuYFyKqHxiyPj9sGzfO
	mbKx8t7P5fU84R7xzQvKkkoeju5AAMIlbDhoWYkcUIHssikNZeNO6x0/Ez670OAmmHTQXTO
	EgjeQWOM6y7eejMRK2ZxLUXOm7iQQicr465ZO5NXpWmourvvHiOER1HOIe1idWoeGjBLGwO
	fvdJy6+wLRp2w6UBUUuH2rus72Hbe5CaAM6Q81AkkbUfmC8p0RlVEdYItnELs+q6sOt/R+/
	mPHKsqqTmtoic64o7RWH32W5r0m+q2iODFjW6KSuqBag6gladZ4/4XTaH327BGz2f7XyKvn
	wHnI8idw9HH/J3Uabjb5/7VFzfWjOnVqrHCAL0h9Omo5oW6ydRCE1hUIsqi/k1JqknUNLLN
	bwwvgSaP2U0DabvGk0HwP6uz9Nle3ojZ8XG++Iks3th7fXB6qOk/t6wHx1aD99uvpaW26AL
	VlUntPe/pE1vTNA2+cehph5pnzHrXaW1Og+rJ6gvxVE5vkW5yxNIMaXtwWmTTP1IYYeMzYH
	PQuTenQegYtMZRjCO6flS0c1GGebuHCa6sSkdkuVhE5PIg+AmYLF7ipsJ+Tvq4gWnvXflob
	ldTPGMviKUy7V5v6Zc18b0cxRtTls=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The DVDDIO notifier accesses max9860->regmap when the supply is disabled,
but probe registers it before initializing the regmap. If
devm_regmap_init_i2c() fails, the error path disables DVDDIO with an error
pointer stored in max9860->regmap. When the supply is switched off, the
notifier passes this pointer to the regcache helpers.

Register the notifier only after regmap initialization has succeeded.
This also makes devres unregister the notifier before releasing the
regmap, so the callback cannot outlive the resource it accesses.

Fixes: 3b2af7f79968 ("ASoC: max9860: new driver")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/soc/codecs/max9860.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index a25f6891fe2f..f05f26d477c7 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -630,13 +630,6 @@ static int max9860_probe(struct i2c_client *i2c)
 		return dev_err_probe(dev, PTR_ERR(max9860->dvddio),
 				     "Failed to get DVDDIO supply\n");
 
-	max9860->dvddio_nb.notifier_call = max9860_dvddio_event;
-
-	ret = devm_regulator_register_notifier(max9860->dvddio,
-					       &max9860->dvddio_nb);
-	if (ret)
-		dev_err(dev, "Failed to register DVDDIO notifier: %d\n", ret);
-
 	ret = regulator_enable(max9860->dvddio);
 	if (ret != 0) {
 		dev_err(dev, "Failed to enable DVDDIO: %d\n", ret);
@@ -649,6 +642,13 @@ static int max9860_probe(struct i2c_client *i2c)
 		goto err_regulator;
 	}
 
+	max9860->dvddio_nb.notifier_call = max9860_dvddio_event;
+
+	ret = devm_regulator_register_notifier(max9860->dvddio,
+					       &max9860->dvddio_nb);
+	if (ret)
+		dev_err(dev, "Failed to register DVDDIO notifier: %d\n", ret);
+
 	dev_set_drvdata(dev, max9860);
 
 	/*
-- 
2.50.1

