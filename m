Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464279;
	b=gkIzrLSqO8QbBADfZUjhTRAiKIhW5wfN3nHSGbB4qWfhjg6M3DmXe/MW0eU8qSvhADSV
	 bp9DLxNcFC1yOmDMx9UpdFB3MQoNhMif9YnKb1/TD87pNyw17ECwk1LJHrpxCoPJLx+fF
	 18TT3R5UpZ/oeeJudCpuHDPVo4nXJl3nNzmcN1MJdGVj/6pvcUXIZrhYEp6jcdXTaCMlx
	 YtRtpfL9uF+07FwdzU1Eky5Ejp81jnSndo6GEUXX73CFCnS+jbvm5JU1TKTc3QrRUCXid
	 bAGZR0r33nUwTlji4Lr2Slx+21oDsX83JQ8cej9BfsO94y2lPlp6MJUSNZNQUhQyPVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=;
	b=dzvBwA60Ibr6SkKqxXQcwQAxGToDfGYj8CrukQtb7v/Ni+yofmuZ5PT3lCw/8ya1qQWr
	 /F6TKL4chbC9CK8+xOvNu4BEtKCnFVcvWfCEyylqXa1GVkhbeEngd0wenCh3sw+g4qesG
	 BzM8Bmp8BSbX+hJ9eIAhgy8G5yMmCGh2BSQcCB4WKALvS9JNosL/C8Af+8u2m8KFUoNTW
	 lGlnfSzMuFTOj/WwpdJMH2+dHT11OdPNyUySZPVVTrwAYM85sEM1Ci7PWQuHXIAywMi7O
	 qDoVM4E/sysh/yreb27OAVYZfzxmXyE/vFb3bhCndn7bJi6HRAo7rLGZI9FfpME6Khg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OS3ZzrSl;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52652606A881
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52652606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OS3ZzrSl
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91eb46044c4so47981396d6.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464278; x=1795069078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=;
        b=OS3ZzrSlNdHPiJ7/bU6054Gee9PT/1UmyQE3IeOAtUgfoph7AcB8wnb7I0VaBl1V8W
         KRBL07C+RZtVEfC94KIgaP5C1s7VUAx5jTjL5l8fNDyt3fHcY6G4d90z+LTiceMZ8XVr
         6J2ptA1HF4UMk0tVagvtihh+VjdPKa/9vLlR5fySHP4TTUZyqBVNKH2iXMbIhXlbrYG/
         7VRc+mdXmx0HxU8nXxsrnD4w1olbnvEgg3rhlQX7bmc+My2oLeYxg/ZHKrs169xud4ZL
         XYfRPOjdvlOT711uqXSYmfynT9N0TJhvxFG7OWm4UBALjpYRKfJnbWtAfO+KBI9+bV5l
         YN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464278; x=1795069078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=;
        b=FnT/7yb+OVijThli0JAY9YfvLq1kNSf3nu0YPKanUSek78eI8x2b6Bo516jZJ8t1Fs
         Ws65JxA6Xg+nfqGBAqlVN5TPsKBwrNtkW5+75bYTpuW90CmcTn7nSrnK0Wqv0+4cxBfQ
         xSLhwcQOtc6xPFxrHbZAytmwFCuOPx/ihrSqMtOkvfxlkuWJ8KxL7/J11leOKprP8y9d
         b/AFCQ7mnjsMh6cUKfoHocolkOQgdJJYgYzYj9TJaDs6ughbpSrPoX5PsidaAtTJzDWm
         GuH79gfUv0h2OCfeBZTMA33NUw4ZQ64ge9ktK0o3OBDr4YaY9BceYfEe1UtCDh1OWs3A
         CJMQ==
X-Forwarded-Encrypted: i=1; AL+hErEKXOGiuG3h13PGMdoCvDBoSFNj5itE//3knejor8vCKx0i4gslkG8+KygxCkTutyUKNPrMMTBxX8+HaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+eWFwJAocfXpjWz+6Ske/Wo4QeKhJyO+AMWjkQEfm5luUSLBqM
	8KijaDUP2zX5rotyze0SrhVhR5qfMLwn8SUl6umzye9NERpXcX6NGJU=
X-Gm-Gg: AYBFou2XxUCSErulc50ts4pN8O4J2I35PxlXEfNDA8WYYmeHiSlPxUAWndH2KcZVqKX
	wgfpXEgj9ybZHS1CYN5m7ClbqlGuuU26vvRhJ/aMOOM+LwNHyork5ZAzhT0oghRBGY7lN++/K1i
	ducAWE4ij35NgTM5mNNEtM8AIYnzEt42OczLbzGkkc58YkqQMpz6wTzQ8RkJo58R6R++WJLH7Ef
	Q2KoOp177V5st0Edbrqh/KDzM8mpSpuA/SmJePlNeult85lcLgqRXzm7o54dH69cuztibvG8+Jy
	7qsrma2q1Fk5a4gfN+WbnAQYskkCTiWlgOgZPHpVVXLDtgHIiPLf9nWWrNYDXoRYh4pbp2yxI2n
	Xj1hokaz0wi3cD7tXEMq1oYw920xRrZHP5VnPLGXbvsTXH1HPD+pe8Hoq2ghGKtX/QqkgD7BJee
	YoXFKaUaeHNAd9GmdQCFMBKbVJ6j6/zxqMcwXVl3o8u8V1DnHR8JREgeDOs5SRGnnP1+kjqMn/l
	CP4d3RM7cmkQeG2VcmjFXAc2lZI80VCKqokxZlAhj54dCdg0kbladkwJCqeQ8+lQ/yJadp8mAPd
	TnW654Go0fJQ7GoPQwVS1rjuSPEatHsijfX2+75Ok98+/ODIiqCtL7zOR7cmyNK3wYjU6kIkPq4
	L6TOXYznCZGhbH6J/5zEbqCisiwVDIjmvUbIV7gpCbecPLShICZspytofPkdQqoVnQd02YZjgAw
	3tD5f0d69gUQm3WbEIN1K7pFCKxgII8iGk
X-Received: by 2002:a05:620a:2995:b0:93b:db80:e0cf with SMTP id af79cd13be357-947b008425emr752527485a.60.1794464278344;
        Wed, 11 Nov 2026 22:17:58 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:56 -0800 (PST)
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
	Cyril Chao <Cyril.Chao@mediatek.com>
Subject: [PATCH v2 2/5] ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:46 -0500
Message-ID: <20261112011708-afe-v2-2-mhun512@gmail.com>
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

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-common.h b/sound/soc/mediatek/mt8189/mt8189-afe-common.h
index 910d90d3d146..de715c92add5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-common.h
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-common.h
@@ -202,6 +202,7 @@ enum {
 struct clk;
 
 struct mt8189_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct regmap *pmic_regmap;
 
diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index eefa96b701a5..e9fddf2063f5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2516,12 +2516,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2576,6 +2571,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_put;
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2603,8 +2604,11 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 static void mt8189_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8189_afe_runtime_suspend(dev);
 
-- 
2.43.0

