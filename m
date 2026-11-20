Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167866;
	b=FHcJjTy0pOljNg4cEIKMBNx5mYbIKv44sm84jEZJGPxm/0IPtR6zsCJRR4sR9wcKiatA
	 WTC1kgFE8KmXh40sGejTmY5YCLRIW26wsyTXq+5L1mV3uwZam6Pq5itW57xjG2pZWXfAd
	 GBBElmgqUYHycqvOh7ugpO7ovDHcKXCU7tnM9bixKw0/ZEtuQHjzZQUgpJNMH4o7Eh4Us
	 23MD4/4OJ0XYbvBaGw5f+7Bk2L9RDCAhWfU2ww7w99cL71PdLuUbb04DXweFFuU1II37C
	 3tcZFqRs2eg/ED+viP4dlkcE9oIZt2dQBTQXaOcXZaRLJf9vDjuz9qsonAcnXGqkoTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=;
	b=x2enJGcf5g3/oyvZSEix+2pH4VMWhM4TOKGpa0ikt40RG2RXpfGfw2EqOt1VIib9Unen
	 B9ehWBa2jhepVS181mAzkLprdzAW+cvA8IbADbMk7zVHNlY+eqmgXXnC60a8+AsvHTjlW
	 gCMNEa8XD/8O+8BZscqA9rxhprE/kxhT7g8UvpvPfe+nqFGwRxqIoMySyvEa2b1qeMmwF
	 OYjO1xeGu1iWKhKPJuJmoWOvaWJJoMbNegx5LGA36OjlvOnQJNIWrKVMv4W+m1VBA5kVf
	 PK7D92WPsNR8TBToGjRjscK5Iutk+o7zABqNWFrDuWs3NnqZvzTbUqDOZeD5wkYWVxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddcU1O7z;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7F606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 09:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA7F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ddcU1O7z
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so740588eec.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 01:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167865; x=1795772665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=;
        b=ddcU1O7zDzzRsmAjkyUl3JiKnqOVKUs14aQ4k3kKTX7rgQGYVCmBzrAoowQbwhdc5l
         QMts06I2dY5a53fGAwPWlag7qO/IJOa9QEeKnvRKogh8V6qAUq5Ic1Qwjq16g3Fp/mdF
         e62n0ld8os8ErmUEBXMbuTQtzG9WVyM2dCDIRnRIN/A6kbC//ijmE1mnH4hLG0yKFyRu
         OalIMB5dmB/4MOGNADS42QGb2/THUAY5ASo8Rldtz06d+S6mRwkUEdVu1FLxN7sTaAOv
         fgAA/0mjpAvkngYV+V6yXuAS+bFPLvVPCXw3Aal4Xo9xUNhR9XpmHRGXx/oFdTeUlUP4
         QVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167865; x=1795772665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cCgqwbNvrgOhuXLkkf/Vlhr66lfaezWECzWianZik4=;
        b=laeloiUcp6CheMliSx3og46T7GCzB7OiODa/w+KSst8TD5b396YIURblfWjO19qR3I
         trEuHcWuSrC3oeKUffrePaTDmNqtOddQEC41SqM5yqwDOSunVAi3BDSJ8yP4QqNYGyfN
         hvLn5l9TWu22gTRXUrnTiyk2AmP5aT9bOYE+7uL+PHqohLuuEWWZRwh/fOCHnhPMhTHq
         Doaed7EMNhLXA4NeA1Yg+/TNDdXZF1HhurOjkP896wCF+J14SN1tE2Qhy/GZTYozr54m
         O8VKHwDh5EmUZCiACyF3vonFl4rWRNjeinHW5kJP1F+0YHNrI7x+dyOJb4i814gqFlyq
         W3xg==
X-Forwarded-Encrypted: i=1; AL+hErGv04ifSAqV5vnmAAV/MkXpJT/UfCRA87bFvWjWI61MwsePV6MKZPey+rGNY/nr4qq7jg8xrdDLy5ud0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+73I/FT1R/6eTsUb9BymMQi5uqUK1inLRgZS/smWZ6t/iAh2T7
	h+ERp1VETnMdMsYaOd2aZ+5O4cS9XSZZVALys7BzULYdvhj4GB9L/Msy
X-Gm-Gg: AYBFou0MBG/iy5/DZel5+XLod5OsRshjCxL51hIqkdbWpBVvhLlAdklwyTXYI2wsXHb
	P6nKOvyFFPLyAYsemOMPXFXDnC/3q2KeTkwUl6kNVzr7autZHIfvt1UI1qVL9Ih7SsULyjHo7hm
	Tsj515D2qES+EuokojV1EAw18jZccOGWsuXNGEYxnNZ7DvdxDrCm3NB6uv5gFFb8yeiGHK78BrX
	pYtXxWbxo8Dthcjv/UyN/Cz/iDtfcF+8NwSj/PynPZTmZUcpBKCzT7hs0+pEu4I0aJd0FfMESgO
	94q2BwsHAjp95Qm4us1MsroDv92vXgkeXjJkpBl51bcIIaWRSwzLhuvzHPlQ6FgW1soTv1O7pqR
	lNz4lXQJdLqvGGBr+VfPikuNdYScCy+gxL7Q297+/4ebRLioHQtKgJSYedXlE1hv6hQPZF8Q0kp
	LcLILnIPkRLOg62KERBRQ+4g3VBY1nyRLtBUkLqchZW1jJDvH/aXAGIh4zMGudKvagVL5E028x7
	bxqdQSFX3XOSL/q9I01sihdBtAi+i9LiA4rW0/Y9Ikdv7t9IeV8Q+xBUOyxWWwiLl69lB9Pr/fh
	TX660xozQiOlwZVkgHaWi1ntAKd2Ewe9hxmGNfxy0V6/tLH9C4pY4HFvJYll9+YYca1s2d4agd7
	Aokw92fDylOi+vODs9PxWiAvdgOUzcGzoI0a4igR7lD708mPpc2MJIrMf7/p/ctSeUg==
X-Received: by 2002:a05:7301:dd8e:b0:386:6c8e:b4f7 with SMTP id 5a478bee46e88-3866c8ebd4bmr51424eec.12.1795167865186;
        Fri, 20 Nov 2026 01:44:25 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3982974eec.13.2026.11.20.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:44:24 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: atmel: mchp-spdiftx: Use devm helpers for runtime PM
Date: Fri, 20 Nov 2026 16:43:53 +0700
Message-ID: <20261120094354.6814-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120094354.6814-1-phucduc.bui@gmail.com>
References: <20261120094354.6814-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use devm_pm_runtime_enable() and a devm action to handle runtime PM
cleanup automatically.

This removes the manual runtime PM cleanup from the probe error
paths and the remove callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 46 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 6ab32f0b8b8e..b034bd46cd5a 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -778,6 +778,15 @@ static const struct dev_pm_ops mchp_spdiftx_pm_ops = {
 		       NULL)
 };
 
+/* Runtime suspend the device on cleanup if necessary */
+static void mchp_spdiftx_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		mchp_spdiftx_runtime_suspend(dev);
+}
+
 static int mchp_spdiftx_probe(struct platform_device *pdev)
 {
 	struct mchp_spdiftx_dev *dev;
@@ -836,11 +845,22 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	dev->regmap = regmap;
 	platform_set_drvdata(pdev, dev);
 
-	pm_runtime_enable(dev->dev);
+	err = devm_add_action(dev->dev, mchp_spdiftx_runtime_suspend_action,
+			      dev->dev);
+	if (err)
+		return err;
+
+	err = devm_pm_runtime_enable(dev->dev);
+	if (err)
+		return err;
 	if (!pm_runtime_enabled(dev->dev)) {
 		err = mchp_spdiftx_runtime_resume(dev->dev);
-		if (err)
+		if (err) {
+			devm_remove_action(dev->dev,
+					   mchp_spdiftx_runtime_suspend_action,
+					   dev->dev);
 			return err;
+		}
 	}
 
 	dev->playback.addr = (dma_addr_t)mem->start + SPDIFTX_CDR;
@@ -849,7 +869,7 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	err = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register PMC: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	err = devm_snd_soc_register_component(&pdev->dev,
@@ -857,32 +877,14 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 					      &mchp_spdiftx_dai, 1);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register component: %d\n", err);
-		goto pm_runtime_suspend;
+		return err;
 	}
 
 	return 0;
-
-pm_runtime_suspend:
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdiftx_runtime_suspend(dev->dev);
-	pm_runtime_disable(dev->dev);
-
-	return err;
-}
-
-static void mchp_spdiftx_remove(struct platform_device *pdev)
-{
-	struct mchp_spdiftx_dev *dev = platform_get_drvdata(pdev);
-
-	if (!pm_runtime_status_suspended(dev->dev))
-		mchp_spdiftx_runtime_suspend(dev->dev);
-
-	pm_runtime_disable(dev->dev);
 }
 
 static struct platform_driver mchp_spdiftx_driver = {
 	.probe	= mchp_spdiftx_probe,
-	.remove = mchp_spdiftx_remove,
 	.driver	= {
 		.name	= "mchp_spdiftx",
 		.of_match_table = mchp_spdiftx_dt_ids,
-- 
2.43.0

