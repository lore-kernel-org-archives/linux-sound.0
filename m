Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284606;
	b=Qv4l6VVXnGWUfUaG8ggmGjLWed2zXJqY61mT7woogy1eVfblagJi+UOkmNd2Dw7c5FSH
	 JFJCB5U5SUfh4LeeUkczawWodbXDCm8lwkYtETwzPVu2x37NZpyIG68fqcQhhfQx6gkV/
	 ihEwkU91krdwosORUMy9rI8ezBSb6obkbyo4rQ+MDWPlqBLYz0HqJTU1louW+e7G4pmvU
	 5TX9IwPK5klydSUp9oTQEWzeaDqr1+y7/xjzRopA2X2pzMVyxPZOo02hWph4izkdwNo9j
	 6a8HxvjNAOvruU4Ct1RCB8NeVBtrAETvy/u6TZdo0tb69L1cRcroBq9jB9+fBEyaihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
	b=O/SueToSqSVnToHUsMx3HoGNqVxnFc5cHevTQ7c2wrxoWerJFRCqmfomtj4kq/ZG59pg
	 1Vy4HoRM+4ufjo5w5ILc3iLBWLDpJ3Ov7viQfjox+B7hFt6tn+J9FJynjA2QyOuzVL0gZ
	 2D7qKkL4tDhns96Kzfks2kvKLp2FdSIv2R3IjaMIVu3t0QwLnnpm+dTVl1NCVwYLkXu5r
	 hgVVjlLPqwNOD1GQJx6G4edpzMGTMTzLh4KrkkwGHT11BARL17tM5CTgdii12b3fE+chz
	 gXxIiRjYzjOAA5+XbMOHZ+U5RIjItjRC1O1ANJ34hKaoldoOLKV2Wms4Z0zyfLLMOcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amxcvFZ+;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D439B606A9D0
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 04:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D439B606A9D0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amxcvFZ+
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e7ad9f78dso195722585a.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 20:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284605; x=1794889405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
        b=amxcvFZ+yYIuOdKwkN2xnglpeYEzUceWfDk0sXsZWfi4Tgk7U4Y94J3BirlGkoodk3
         OtCVY1xD8ZejCQa6T+WtTSvOumR0yx4AAtVRwQavvTt9lPcJZFd626jGe9T9K3jDIO6X
         nFYv7dEA/yLCQ1KmdI/l/LAiriaD1Lu32bzp6okQ04iviXkMxdD8T5MNhThcf/l8Fg1s
         RjTYJWw5RItGLOXnfHwgS10cpdTUMMHWL5i4YLb2dpZqfuxehsMhb7AAYfekCrl/tFT0
         GpzD8rTfE48nQr6X5i2whvkK52jnEHJH/rsJErtDeMAeIJ/S/aRYLL4UPG919liPLVw5
         b/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284605; x=1794889405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3KmBFIU1iR/HTXXXArEC7zokn13fH3rMiHXgEuMLclw=;
        b=wcCX3+VYwwBuukQf/3Ua1UvwS5vG8KpKNHLcFO9z2ijWEqVZvsRPLH9MZ3+KX08fXD
         hgMv0fIGt/4TI9svpNdTWjByWM7osnyhsDaW91IIpviSMIZoRpmIaZNK6gLapGNEYqHI
         eu3SyXVm9GUwIquLDVS/pR+23nCBvs28qx35gAMYQHn3Cjq2cuBcrrUiOe6XAKBrG/PU
         fH3dlWx6R+UCRTl9X5hE1gblPQLnOr4/FrrSgrSUIdU9MtO0Tf65uXe55tKG8hcRcLdW
         clNBgIQasVSKiTcw9bwLY43YFwa+GlSGflnmQuOO6/ZPIbgAP/9wMceu+Zl4jqb7I3iH
         pIJw==
X-Forwarded-Encrypted: i=1; AL+hErEAHvz8gYsQNL9uZJqIFGKqwvyAZRPbeqA6ok4MYH20U4qDr9VSPV1WTtH7wGLlTbl2awCtOTYGyWWWzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3b59Z60rSXBzpQYLRYdIuj1H5SoajeGPwQaV7T9w5ZKyb4zem
	RO9EVCsgHafiLe+Tr0I5WJ5s/6Lqmyi2gy/4yWWYvpohDJD+5fO1WS4=
X-Gm-Gg: AYBFou3v2AP3rHwv9p9i553T+DWPdOw/bFLE5YxH/ZrAERqYY87a7XaBdMPhuMLIvrg
	CukdjT0qXLDDZAO1y+AwRE9qgiskYTqfqd+qSld1R+WwDg79j124tR/LHheLpNugA+xXwwdGWY5
	WLTH2xSJo3lMFF0kK/0xykObCyVa//WXDo4k81F0RgeuahgdLmVh+NNZCIPEuF/CwrjYQJ5FQ+6
	HbRaWZGA1c9ioXFpzGe5mHecp8rixF524RD5yfI2431uMSYJUVcoIEAyEPglcaIlkCBRE2hHxbf
	PVjYEeVSZZumUONWG4GYpHshZRKfG+TmCKqOaO7gRuaOczjb4Zq1pEsZwS4QaZiEXL0wJDbNvW6
	XjRvsPXIYam7HdKfflx54Abf6939Uj32OtRq0Wg/RWUpBdt+rbpydP0svTHwkoKAEbjOXBfZBxm
	xpdibGCrSLXFwKkEkjEWWNhmmq5GZr6FYHT3E4DCqnT2/9WJ4m1JMJoxiIt3zJ8xIWh7IFYzw8W
	UuNqW84YV3eLhGSSPgSdyDr8E6+/sR/XII8tOnSpcncjbBiJKy+cZ5N+mBsd06oljxKeliVjMH2
	TzR8Q9tFRO6LPoYz+x7yBgNsHAUg6q8ayoTFc+cz/H82rPeiwWFvnsAPfMEJrh6RIBIeRhT/Xw4
	lJoUQY7ghWsAB5TyCnXCN/OPqz6oF2XsnxmoBYm3Py6mJQrMndM5hgYTJ1mPHVJAl
X-Received: by 2002:a05:620a:28d6:b0:93f:35fc:5253 with SMTP id af79cd13be357-9479f34274fmr240626485a.31.1794284604776;
        Mon, 09 Nov 2026 20:23:24 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e61b8f8sm136682085a.1.2026.11.09.20.23.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:23:24 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] ASoC: mediatek: mt2701: initialize IRQ dependencies before requesting it
Date: Mon,  9 Nov 2026 23:23:21 -0500
Message-ID: <179428456134.51374.1588994696516825613.mt2701-v2@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASYS IRQ is registered before the regmap, memif arrays and clocks
are initialized. It also remains registered while remove and probe
unwind disable those clocks, allowing the handler to run without its
dependencies.

Request the IRQ after initializing handler state and successfully
resuming the device. Release it before PM and clock teardown on component
registration failure and remove. Check runtime resume errors and avoid
running clock cleanup twice if the manual resume path has already
unwound a failed clock enable.

This issue was found by our static analysis tool under development.

Fixes: 43a6a7e71063 ("ASoC: mediatek: add mt2701 platform driver implementation.")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Rebase onto current code.
- Replace devres actions with explicit IRQ release.
- Check resume errors and preserve CONFIG_PM-disabled unwind.

 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c |   27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 3c5a76591..4054083e3 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1620,11 +1620,6 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id < 0)
 		return irq_id;
 
-	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
-
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
 		dev_err(dev, "could not get regmap from parent\n");
@@ -1684,15 +1679,22 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (!pm_runtime_enabled(dev)) {
 		ret = mt2701_afe_runtime_resume(dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		goto err_pm_disable;
+
+	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
+			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
+	if (ret)
+		goto err_platform;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_platform;
+		goto err_free_irq;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -1701,21 +1703,28 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(mt2701_afe_pcm_dais));
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_platform;
+		goto err_free_irq;
 	}
 
 	return 0;
 
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_platform:
 	pm_runtime_put_sync(dev);
 err_pm_disable:
 	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt2701_afe_runtime_suspend(dev);
 
 	return ret;
 }
 
 static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+
+	devm_free_irq(&pdev->dev, platform_get_irq_byname(pdev, "asys"), afe);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
