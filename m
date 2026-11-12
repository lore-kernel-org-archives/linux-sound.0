Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464283;
	b=E8EzkCd7N6o77hVSlb+e3o3/zB/lLeOR5J9ItF87/qRGJIcYl5sv7PE9jHgw8rl0Ui+o
	 s3PuXCE8l/3ixAH24H12NWZ4HuDDocAYzYq9fLeEOUjhiY5LRoxxhBOO0C8Ig/cs9zoYK
	 ZgRhZgkqNJZLYOFfJN5nQ6bPkuY4YvyccqLn5AxHaWb5Z9WIHvyFKvE8/h+LTwYXW6Me/
	 gQm/m9GNFXzooV8tnp0OL85NXBElvjpfmPrj6eKvJdZXL8FrVYbYEguCPBjzX6YqOpOIt
	 NJBqT6FI6aGStBedQRiuK1Xw1tjlw1qdxMS9GnZq66YeIProTJSC8paYIOTR4pIMhZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
	b=hcokXMvJ95rtNxgiXvDvykig7NLXkDiDWX49MrVKmhrzxRFQ0EO/RBh25nBjrk8a7NFo
	 iCRAj+vxrfy8SJB7cFx80WISXmEQb8aJZeKP5Xd5fQ4dB4hA6G1o62LB9cqtZqznKImZK
	 BqdW0MFmxdtvRIYo0ZRDIp8yz+DdFxMnEn9yF5yyLHulQABzl5rZYRUT+0EFqaK4cxmjk
	 MDl1+kVK35C0R4jkKF+LdnOlQm3GRbxCdOXuaGWe9j+OFKCs26gyFwfp+qrIN3VCFZ+IA
	 42PCvoLgCIKLO/tZPol3mrVWTxulaGdpivES9yAhnR/CoD2yem+2N56uKVKNzHtkpAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgxBSEn+;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07505606A33E
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07505606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GgxBSEn+
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91f11161831so6980896d6.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464282; x=1795069082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
        b=GgxBSEn+ymk8FG3t1UIOsEzlPQe2arILnD6M6OneIhXSGijWFLs1utXziSnRJo9jAK
         nbZpMZZPJN5g/VMqAmXS3+DpZW1wKoFDXwWTy3Vhw/YCpd9HIW+vJdkQBSJ2/nXFXHcU
         z7qxdVw/zDsEvPiEPJTw2FC8hOw57hHcwngNWw5iNX+ABxEoPCZHIOTNvPeq4cekCxyK
         3Co2geCLM9MRkeX1aw4XD3DrSpY5hsrVUdslqQSdeimEN425Dczp0vcD7q+OjJGZbu3+
         4ZO55ehFI53PiEg+GSOIQ49CBGI7hDhsV7SISzzhSK7coLURGqAfVsRGitvhEYtvUJUK
         TIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464282; x=1795069082;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5lFknzbFblOuXPlPPjcfE8p4dbikqXW3Uf43fx34os=;
        b=0Gjr4EEmimzB/7Zn8xnYjGcmC9ChjrcYLSJ1EvWpRatUdRAwht6zwckWo4Xj4yOiRa
         dMqmxxVOo4TFMYWc3sjQIwUZx/pJPJ1W50ZF/arum10OVOp7aX0eCfDlr7WHPLq3JeWa
         hOX3qhdF96yJt8PyT1zC3yl9bVlmz/RKmKgEqLG4E0+YiXZyFM3fUDwAND88cP1Fz5QF
         vj94D36egRPwLiMbou3qJMx1pWHiIrBYoLQy+GIi6A0d3slvCAPCxmABZ83eTS++OoU3
         gY+95kD8rUr2LsNTr82ajWXlVIO6JGWs1Pg/ym+3xu5yJ9O85tqyaa+sw02jzBkI3A2z
         sXFg==
X-Forwarded-Encrypted: i=1; AL+hErG+cozRhZe4j/uITI6bfWtvJtw1bu/aKFLYmtkHH8nqGfWjyiBZbZ/u6g4lRgAERVqVXKSqK9V1I5SAmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uErL52lIsD1hnRR68b/XdzHugX+11oIiOQSip+Wob7QoVrk/L
	6DsF2iPJxHcYcmgukCZO0XOSOvqPV111ELHVKv7qEiC/A6Gpm4YWCxA=
X-Gm-Gg: AYBFou1fIS/8C3Wida2rJ0nuoUsLyQrgrhT+l3MFlvq3q1byGbkhGKxu3y6PDtOj3/F
	J0+1h3ZlIrvwqp7XajX0DQYIEiKzqsaTZu6/iUzoDhN2l0dTyxgcc++3aGJ0IT2JDvB49PB4rA1
	wruqTuNQgvj0LDghotJn8CtgygX5XzFuA2Y7yZqVJNRfRFKP8P+gSzBbSgiU+zu+EVJF4ipytzR
	IeftvzGPeeRQYrAvJPqGzcNPD2NTSLLMHf7XNBILtcVZieSs3NPbUQFxtBt5XmAI6ydtciSWGIj
	F1iQqBGkx2h5do1zRs1zdEpRij8n6sD1017K5wcxOGN1lZG42YQMjxmY1zzW4k2bwanpvxzOzo5
	K7EwMFvHjV0aZ6QhiOOUqKPOUVrOFul6xS1lBTP2CmRTLnb97oBZHZNPbWguyY9ljMWYt6ruDBG
	ctFhYtCrX9aC7BQSJ7k59dOkQAtar7bKO0UDSqh4/+2ZE9P7UbbeDvMF7Ct4gzsf/SmX+Ea5F6a
	cryh7qhpO0m+OMJQ9X1GnlywBlerkiZeDC4H6Li2Hl5bLITr5yDdliqJBJdev6ArkeFxjleOoh5
	BvAoMfJ1z/DnwQw1H2n5IR9Cw30dx3FO+uxlAlQpXQ6veEnzukws2jquH+pEM7a5QsMibfBHcZF
	v+YsUNgWVPmiiycLm0m5SZSRhOZSVXNIlBZb+nd3dgawzb2dARv5yf9vLz/fNsQ1uj8B2Vk013S
	bsFSbONkpE+cwSNoYcnpvbr9Tj3KmiKEevE91t7ZuRM+wljHNWHW0H8Q==
X-Received: by 2002:a05:620a:2628:b0:93f:565f:e46 with SMTP id af79cd13be357-947afff4ee6mr743160185a.52.1794464281908;
        Wed, 11 Nov 2026 22:18:01 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.18.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:18:01 -0800 (PST)
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
	Trevor Wu <trevor.wu@mediatek.com>
Subject: [PATCH v2 4/5] ASoC: mediatek: mt8195: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:48 -0500
Message-ID: <20261112011708-afe-v2-4-mhun512@gmail.com>
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

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is allocated. The audiosys reset earlier in probe
makes an interrupt before that point unlikely, but devres still
releases the regmap before the IRQ on probe failure and removal. The
remove callback also suspends the AFE, which disables its clocks, while
the IRQ is still requested.

Request the IRQ after initializing the regmap and before registering
the component, so that a failed request takes the existing runtime PM
unwind and the regmap's managed lifetime encloses the IRQ. Release the
IRQ at the start of removal, before the AFE is suspended, using the IRQ
number saved at probe.

Found by a static analysis tool under development.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  1 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-common.h b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
index f93f439e2bd9..905f29673d3e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-common.h
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-common.h
@@ -123,6 +123,7 @@ struct mtkaif_param {
 struct clk;
 
 struct mt8195_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 13e5bc02fac5..0cf39f66992e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3133,11 +3133,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3192,6 +3188,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		goto err_pm_put;
+
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
@@ -3223,6 +3224,11 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+
+	devm_free_irq(&pdev->dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8195_afe_runtime_suspend(&pdev->dev);
 }
-- 
2.43.0

