Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803256;
	b=xTyn85tfcHP17J/R1WkJ7B8FCm204tsMaTkNjRjUdjQWI3VXCP51kNXdFvNMFZWomh4x
	 XhsCifwR8UBeyMO4FDApWRLZO3RGP+YRmXBV1ngL5AiBsl8gpDcWhVAIr1nHCF/x0p+a4
	 z0AXkSKUIIy1T640YTpnqeCYbaF7L27C7HDSgUdBTQquWH4ynWtKL1d535T89w9FRB5TA
	 5U3RKbWp89X5SCJbeXv1z+66ZLOAhHWaDZqJJI9QgMSe/T3/kcBlUweCQH8/3CLphsO2M
	 0tceaIn3U3ImOUHh/sy1ht5huaWjA02epjO50YA4ypxXqe3qjFR1lJLmcr6ue02BvFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=;
	b=MbOsLPiPvWJUECECJn4FGgOCSD3qzQl6VWSI3bUckCOlI9nncSkcD/o5bEzzcVoWh7Jz
	 KZm5k3fDEgkWq8Su409R8PJE0JGPWWGnUGqz1iVH0DsV0nDtHkn4VtXQy5Mti/pZKJbgO
	 fZvTP1Wlb9hxdQb6v4mPyJoG/H+8kIm8CNOpimhTOkmw3QAOzivlk6YnkuziSovTTd5rL
	 XWF7fbj2CBMN+082wUxunHUpGZkFgBEvs5yhgfcj2OFmbOgYBftFYz8aUeHgH2GFK/nRI
	 oCH8Ypkvf2qBGBWYkYD0326Ucqof3J6ghAdkXDQCzJIMG2zDnjSvgR4WSmKl0w01CNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBzSoSOU;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4D606A31F
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 04:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA4D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBzSoSOU
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3607809c88.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 20:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794803255; x=1795408055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=;
        b=PBzSoSOUrgFcz7gcjKcXndt6JweAVS7Y3UB/4GZG0gPI2rJgC2gq2W2uoOa7jY6aC5
         oy1unp6PPKpYNaVj6V6aqKph2G3Icg7h8nG1L1l1yfxPVKteNXgcAHGGY261p/v9gIc8
         t5RS+ybfuk9KzSHMuK8oHEqix/t0/G41NiYrsV0uNvB0UNMBGWwxk5ElncF4gDPLnszN
         NMDqZ38MDGzlPyb5hFDLudBfPT9YC3gjp2DOpvguLTdbIkBMxyJmTTv9k/KEAVA3H0gz
         0WZABSYNxfsu3LcMg2ww7V8ebPAANEHMPWomdkIwFDQuBrmgXUZLEd8pZsz5NhrGbVlh
         lkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794803255; x=1795408055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll4WYNWhfbzf2fuFTwBl2v6+pYsK8R5wKGt8sosgi6k=;
        b=YXXimWqDiX15Y1pHYvTgbkLdzdpuHXnmSllvP5nl33bl+2INJz4VRHExvq7DkO4B6x
         dVpdzZ5ocYAojfqvAJlL94pB5K1skkAHlHbqkKTMGOih1AhZyJs1JFaHqVXnpzAkpEh+
         7VGAZUpzNZjZ7wd5CYwUz2JAbLa3SHrcuyXWQXJ2GeHdRUufpzyeJJtUbA0qnnfrnnW7
         ufW78FEkkUOIxTJP0rR4hCXw4Elcpy7oZwVCYx+/NVhEOQA2VjYmBrPcn1Zl8GqLGEnE
         VKxS4zcC2bwI4/92tnveR+ci/LYgW7eTSa5j+g8tlXA0t36yAnZbob3fmnVQVuxvrRrf
         9YLQ==
X-Forwarded-Encrypted: i=1; AL+hErExuvsrv9Tn+q7TGi5vF5Ja+kk7vTvnxUqP2rZPPDMZrS5frALrlmX0g5Gy99m4ktN5xBmxNbSdsIyQQQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MnL4KtCCeoqffIajUhjaFNbqLXkglzdn6Nym1dEi9fHRShqEI
	2vcHZPeev8X/94jDrtlI/yhCDuPwbgeNU4EazOF1UDZlL13B7zq9H0h5
X-Gm-Gg: AYBFou0z8Lb4i+V/hkWacFiJP82SCVRo5onMBC7+hRAkmQxKnDTPrSrkfl0QxifwEBk
	kZCj5fHKisCc0LEQI/Tnj6Mj+JaZvtXAh0IO4Ao2Bj/UK6Qz1qhCYMYbivuoUyjm6Tnrd588Inl
	qdWy0Alhbx9LiXRqdjI2o/9XkoF4QL9mzWaf/diXH+8M2mKABm++4bGlbvK72uuQ6d66NPiCGQ0
	nLJePM3rZyyYP4EcLIE3fTTuZn6w/k04KyDKdiYpGy9ZdfM7q9Tptq6kjYpAiRbIRu+SmcIyQPo
	1ituhuBfCJndp1htgMVc8ttpHcmw/VqF585DFZCsVxC3gursxKGsejvjgr6ecs7FGbRMPD56NSG
	qCIoYQ1ThqAKJH7E7xskjDsGWrEvkifmwMuPwaZN3b2jZRQTTgY77TN0vwhv+g4KTilWCFulhHT
	cKjksogSs1z7Q2wDLnCsgvFuVBmVJZ8edplfSPsAU2XHlL3eJ1aoRBy6eabwoxavZigvzncVTn9
	AoXH9EnNHpB2lOCB+p776Jyfu8dXxV4anRx+udSShcbJBW+v2uXj4+SaJoxHEMTKyPyKbbPvNu3
	pA2Oq+r+YzQ07cq5uJvax4Bwh6sV3vJ/MVVhsuvEsUHLwiG9967RcmTZwrlUlU2xoGyaR8nqV9m
	4wisekx+YSehy+vhBL3wiiyxshn49ihwK/KfLldDGurXJpwpTz2v4eWiogzQVc0O9FkM=
X-Received: by 2002:a05:7300:fb17:b0:36f:6d81:3f99 with SMTP id 5a478bee46e88-3796676fd59mr9490074eec.7.1794803255030;
        Sun, 15 Nov 2026 20:27:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm30053500eec.13.2026.11.15.20.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:27:34 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: atmel-classd: Enable pclk during probe
Date: Mon, 16 Nov 2026 11:26:33 +0700
Message-ID: <20261116042633.497423-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116042633.497423-1-phucduc.bui@gmail.com>
References: <20261116042633.497423-1-phucduc.bui@gmail.com>
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

The peripheral clock is enabled in the startup callback but never
disabled, causing its enable reference count to increase on each
startup and preventing the clock from being gated.

Use devm_clk_get_enabled() to enable pclk once during probe and
automatically disable it on device removal.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-classd.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 59490e9effab..4216a28d3371 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -122,19 +122,10 @@ static int atmel_classd_cpu_dai_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
-	int err;
 
 	regmap_write(dd->regmap, CLASSD_THR, 0x0);
 
-	err = clk_prepare_enable(dd->pclk);
-	if (err)
-		return err;
-	err = clk_prepare_enable(dd->gclk);
-	if (err) {
-		clk_disable_unprepare(dd->pclk);
-		return err;
-	}
-	return 0;
+	return clk_prepare_enable(dd->gclk);
 }
 
 /* platform */
@@ -546,10 +537,10 @@ static int atmel_classd_probe(struct platform_device *pdev)
 	if (dd->irq < 0)
 		return dd->irq;
 
-	dd->pclk = devm_clk_get(dev, "pclk");
+	dd->pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(dd->pclk))
 		return dev_err_probe(dev, PTR_ERR(dd->pclk),
-				     "failed to get peripheral clock\n");
+				     "failed to get/enable peripheral clock\n");
 
 	dd->gclk = devm_clk_get(dev, "gclk");
 	if (IS_ERR(dd->gclk))
-- 
2.43.0

