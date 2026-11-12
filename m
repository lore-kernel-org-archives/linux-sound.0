Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464281;
	b=2RCp65wv49XPRcCRirtXGXg9FoDw8OMseJds8xQ5pgexPs26PnayYWRUL/cThxAKGfIU
	 qUhugD5CDGw9winTgY5O1IHvMyJlBFD7wWu1iOxdNAaHx6RcYUqZcV51d3CuiYm5eJuxr
	 81wG0SW73v4YFB4BC/MmyD6x3310ifbeij4a9//6Fhy0usIvwlv+EVDQeeym0uaRX/ezd
	 9nkXo4Mty8IWIf+KWFc2s7LjZTU7aGVw5KP5QCN3E6kyD++8h4u4XCPRjWOKg/opU/f5h
	 N2aGD1SJEn05H63a/GqLceTrng1RIIDxdsZtW1MNEHbYFWGvngK757eHW8Jf1yssf7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
	b=yDobjXhmMyy04C/Wo/U6myBZnLjvulQ+I7i5lxUwmJK+ytQi8TikpJzjsxG1xSjlYNTQ
	 OmVhmR7n6q7sqWuxvOPaY3ykka3smMKlGKgLwxaHb2p64YfGJUox9uZ4ltbm3UffkrmAh
	 lKtuyYzrF1OVbdMs/4J7hSHwhmOo5R5B5T/WbezFf1YqY+X6EMcVQezP8rhb0FnShBqKh
	 hPy/8wEFnCRYSDXX1WYud/znYCVZduNiKUm5LRRMO5ssURcvv10S7uq5e7j026JV2fVEq
	 cYCGCfykO40UPv7aIId74RoE2q8bAYcliTuAVPFn3rf6X7tmc0me9JBxYHiuzwlKJUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7OOxY+s;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224C4606A896
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224C4606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7OOxY+s
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f30660e69so326497085a.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464280; x=1795069080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
        b=L7OOxY+sFOjf7cymUt0HdN878ELXC9JzosSppolIDnn6nFPalngyWd8PZjEzc2HY1Y
         0EVwN1EJYREGXCnjqsiONDJoiv3pr+4YQjHMJZJS4BWDasEorAaSeJp/I51NKriVt5HH
         jBq8Gyj2SF6uKH9Kpdprz8nx1mUFHuAkXl1kRXUp9GnryUV+mQ+zA1bnZP+Pl2hCNW7z
         5fX0CczGSQE1xFgc6VF2J3L+bzZz735/i6ktbZw2WzyZOCD+zTJtNbAYUvDB8VlAdaav
         wGAVy0e+qSnf2UENd64fZYL87Hu7CQ6YCxlJfhkxpb8Ju80n2vWsckwGTgHpFd103QLP
         LlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464280; x=1795069080;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nckocVz+afCDBQJ43glnhAGvucCdYHH86OsKUgx7bE=;
        b=qXMwD9l9fGslQhgEKfNO+//olK3Q6IrxC4z4ouslDUjxyFyhHe+WdgomZkuo9K4tm9
         a/Xu8L08n9EzIDzaYIaxuhu87kMJUCjsjWWSmVsHI+SWIqvLF8PtOYU/MtksyfkSC1IU
         nhuxK0Y3il5lsDImd3Ujcd1OtEaMdvrQK33WL3e2DT2b/iNFs9U+pr9NAn72vT3WHUA/
         mrQ/1pCooFwlMHlBu3wpzIWU1vWgfKhFhHfyuHScSILXkmLMykMAIu5QVIsRGW/0r1JE
         WL/hlCDGyAvnVllHhrAneELrEv5FEBEizExNx8kSS21ivW2OPreT0OIlowMZkolOxMHL
         OlTw==
X-Forwarded-Encrypted: i=1; AL+hErHo7kSK4jCotUhBxhIUmfCc6V286uFhfJWgorPUIkEh6lSiwd7tztNLZi5BITobfaOia1DbLdTKUVK8rw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qlgmHvWHvm0inXhtadhDqK2JOvLN07t7pu7rL3YsYmTjQZ90M
	6X58sjCMXPDsdi6AahHdqDyJV0jkg6rz1+0N1HFOqb7PPMO/ML5nBiQ=
X-Gm-Gg: AYBFou3JILFI/VRGgskECLfRuLs5p6Jp1Dg1Lo56V08v+qZTZ6YflZQRRTLJ6Gyjy2K
	LtCtAAPM002tRjk6XMW791Vw/vbe4wpu4N6nWn1kOwDelBZn8s2yI/m9qKGw7fn538YBlSqY0BF
	/xLXIu9UgLiSuGo5NSTn/3NMWJ4HMNuDgxpoiscuaFgMJfMG+ax9XCK35Y5/Zg0f5ddBTMvK9vo
	pkvmCyVdO5qWNWiuvAtwRiyL9DgLYtPxwV7NWiDupxeGOSx3lw101LjT1q1QDldmVKALb1I995A
	1PXr9BOIscTm4+MnWz3PrDgVcut1lFYG9LV/5rGNJlEzTz0kxGmGZBMRIgHwzz54SIpr7nWbRIU
	83pU7LjNdkamK+fuQeTPFaZtQdUqkGNmIcS7ile8VhbLNMnWOK8+t5iMrRXKKuNzteuZ+G3yi7A
	R8jW+jclxa90BS0kLTKg5S1jCYqGjoCo/2FEmx/tSpLtd4TelmnmjbSEl8IKWcvhUIrb2EJA7QE
	U3zEH86jwPId0UI9g93jAv+WkLb/PfxEKS29vuMy3+QnGtntZjz37uft7b5197bvb6Ni4++I6nq
	Nc+RDMLG5L4ldLKbg5gNgrN6+h1yv6r2qouinBz0D2lJdYwhvS5owCVAVMace/G9En6U4IqjGjB
	5s1AYMiC8emOMRBMn6ymKalrHBnL5iZ0ieSj6sK7lIw2j6aWv1O+YyZJvd0OEhtEITBdF/Yui8x
	5tgjxjBCeOaUTgcjT7Nc6Ufg5elvqqrOhw
X-Received: by 2002:a05:620a:4726:b0:93f:365b:42bc with SMTP id af79cd13be357-947affc152fmr801189585a.52.1794464280101;
        Wed, 11 Nov 2026 22:18:00 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:59 -0800 (PST)
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
	Ijae Kim <ae878000@gmail.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH v2 3/5] ASoC: mediatek: mt8196: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:47 -0500
Message-ID: <20261112011708-afe-v2-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
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

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before freeing the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

Found by a static analysis tool under development.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8196/mt8196-afe-common.h |  1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-common.h b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
index 4951a6f32abb..ce5d586721db 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-common.h
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
@@ -186,6 +186,7 @@ struct clk;
 struct mtk_base_afe;
 
 struct mt8196_afe_private {
+	int irq_id;
 	struct clk **clk;
 	/* dai */
 	void *dai_priv[MT8196_DAI_NUM];
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index f69ea22cfabb..dc462dd4235c 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2403,12 +2403,7 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2463,6 +2458,12 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_put;
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2490,8 +2491,11 @@ static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
 static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8196_afe_runtime_suspend(dev);
 
-- 
2.43.0

