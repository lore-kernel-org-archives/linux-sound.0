Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E231DF273;
	Mon, 19 Jan 2026 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791264; cv=none; b=VA21eNrmSfEFo22sNRbj4wrpr9A1rYYALLBrorQz9zdyIspnjNdGVxmYiCsb/cwVHaAEaoM3voLZr5s5Orzt8G7IVUAj1J8TelVmNyJ30R52uf8sNbbkcLlT78IVA3FlT7iivaNhm5qA2NAPLM3Dv3A28ApsLrUjYoEomg9z4hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791264; c=relaxed/simple;
	bh=DN+982bMOAVyb50AsacchwTsSN7TyiB5u1g7SYR7txA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jcfi8EVdgzPVQsss9K5kgcyz2rzuxlg6XQ19jSoSG2zaNxuT4gR+f2d93f6afBR/eOc7mpU55+E96M7pqvpm+2DtdeOjYnBdZ445jOqlIYnkOruuPw9lVPwuQ8Atoq8YBXrDX0F1OIwzNz4HSEtTCv9WMWK1JE6IkFBL/gawugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=moVRhfyD; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="moVRhfyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1768791198;
	bh=rjWIl+Kq5SqEr0RnnGHjcPPFR4ac0Kxg1DYZ7DyBbuU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=moVRhfyDJB/6HP4IJQC60gtaL/YuTKsoUf6D44YPmggsWduIXRGWYum75x4R7q6fT
	 LQRFWJyL5ezosBWsp0OLh1vtydvIQW91odej2R9PL87ljofXIfFQQA1WBgpR65UbHe
	 4qQjxaqpoHHohUXqeS8EtSiWbgt2VTAXnD9lXgVY=
X-QQ-mid: zesmtpip2t1768791193t9f1b60d6
X-QQ-Originating-IP: /aynIQHRCO5c+d5vsKq2EjCiuJBVFXjVtSZOUIPrM20=
Received: from PECI2107 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 10:53:05 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1792721642405719271
EX-QQ-RecipientCnt: 12
From: Runrun Liu <liurunrun@uniontech.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	kernel@uniontech.com,
	Runrun Liu <liurunrun@uniontech.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH] ASoC: realtek: fix misspelling of "minimum" in comments
Date: Mon, 19 Jan 2026 10:53:02 +0800
Message-ID: <3D20FA99934F2891+20260119025302.1288888-1-liurunrun@uniontech.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MZ9X7MyfBLbl7fj2oBgDYEyhdrlUdIRtv74inabs1qviIcY0HHe2eir3
	3B6YgxiJe6nP2696lwuECcF9Empo5lr41G8Bdrlnw7o00+v2TfiJCeVxccNV1U1IRRgK9ri
	VPxwVmxfzct8m4p0BdxdNIQLEqmbTTdvHsQ0kkWr4D9HkoE2i/Kx4SsJJSi9LEmlmuS5BU5
	3JrW6L/YINQTnAyIoYVR3CR4+IexiT/Q+KkPvrHVB6P38g6vw1EJtP4xO4TO3AHO8ojexPJ
	mbbU9ga4K55Mlx5/f8HDFfkRv3rZrO/U/ks1sWVklPSXG27n0+AKdcf/S9wsZo1jzhGXxmG
	7945rCqMYPRCkBne4sX2TTmPmMdNokDA6984QX81FbLgGtt391+8E0WRHfuwsGHECCyPLe0
	6MPU2/8NpTQoq6DHl84vKE4AXlalIeVCkJFoZbzHXQ8m6rv6kBZ7c7O4MlbR+XQBclWA4wh
	3nYBoAKGB0bmDJ9yFD2ww6XxxxG8xeAFUnXO5Q9q84HYH/bAhWKrUSoNyhPFgoMKnF/ASQn
	Bv/1AUZBIT0fbrkcP1g0cLQ/CGa4No3Ne+YaAAwl9xKMQ/ux4K2I6a/Z3XI+D4cIsoIKooD
	iLbQ+1DuzJmwgFKjhiReYRP3usj6ErocbtrjgpLJv6yE9+4yCmB6y4Dy7d4LoDWV4D1FwrB
	ymkNpy7P5AD11T/dHmTHrKfkGKbvKRMQMGJx1kA5eclD6DT06exlFxNTLRcP9jMwcCyQ1P2
	kXulfNTAVEnNKqPDk45+CAFaW4OF6zqGj8nSznCy7Zq0ym3iJpMlnxf8wNT3hcMpGDUV5NX
	vSjYXb9rsc+twPL4hpJ0DA4M81P66trCBY1/RqROoHZ2AYh0URvPDCRg7TT0uXwPWI7aoce
	tiuktfMBzTGvfSvi4dP/z8PICf9tMJyAQ5A9n9iSXD/L+T1qFm8aZqxu92ZUy3nEYhMKzry
	JxOcq6H5yOCb10IKJkkaIACQCLEBkTN/HvGOIpZ43pVHacy9RxIjgjcB4TTsyHGgM8XYPcI
	U+YztNb2P3A8mLAYiwYxEnPRzUcZQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Fix the typo "miniumum" -> "minimum" in comments in rt5659, rt5665,
rt5668, and rt5682-i2c codec drivers.

This typo is already listed in scripts/spelling.txt by commit
8c3200265787 ("scripts/spelling.txt: add several more common spelling
mistakes").

Suggested-by: Cryolitia PukNgae <cryolitia@uniontech.com>
Signed-off-by: Runrun Liu <liurunrun@uniontech.com>
---
 sound/soc/codecs/rt5659.c     | 2 +-
 sound/soc/codecs/rt5665.c     | 2 +-
 sound/soc/codecs/rt5668.c     | 2 +-
 sound/soc/codecs/rt5682-i2c.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index f5957470652c..3590ebd41c27 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4118,7 +4118,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 	rt5659->gpiod_reset = devm_gpiod_get_optional(&i2c->dev, "reset",
 							GPIOD_OUT_HIGH);
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	msleep(300);
 
 	rt5659->regmap = devm_regmap_init_i2c(i2c, &rt5659_regmap);
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index c7beccd54b16..38fb3a277e26 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4688,7 +4688,7 @@ static int rt5665_i2c_probe(struct i2c_client *i2c)
 		return PTR_ERR(rt5665->gpiod_ldo1_en);
 	}
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	rt5665->regmap = devm_regmap_init_i2c(i2c, &rt5665_regmap);
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 5fcdb50d5184..c551696ae11a 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2458,7 +2458,7 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 		return PTR_ERR(rt5668->ldo1_en);
 	}
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	regmap_write(rt5668->regmap, RT5668_I2C_MODE, 0x1);
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index bba987308e15..e556a365adc8 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -173,7 +173,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	regmap_write(rt5682->regmap, RT5682_I2C_MODE, 0x1);
-- 
2.51.0

