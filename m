Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC03BFAEB
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049945; cv=none; b=WC4qcmyDAppketp0YA2HySoqRxmQxN6BVE6U5vIWaJbZwyThWhkY59CMiM6SYd1WiPYO3z7eDwpZfLGzZTTzt3XAC+AxZc5iiMXMfAPmPiysTS9xhxe+iShYOxJ0h638LCXizPg7IsxyHIUdty0Npyaz4u5+AYBYKSdj88QMy+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049945; c=relaxed/simple;
	bh=7kMgdJJnXW0nxyAw/LvLUQIUX1u0Knq4v1TFxjDOceo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uclQafJN3fhOgoQxnTzltvFZmqVHoRTVod3v5oedED+wSIC/9OpDMrHxHQkmCSYQnBCuw6f3kcBnvbtW63qgNLsqlXDWkJjsszxHOWiNfeA+75GzmmPEQPr7os9jPuC3dhH6bGhf7WZr1CHepMPI3yxWf26JAw6YC/Fq++1NyNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKaUk8US; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKaUk8US"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38511175ad3so4365578a91.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049943; x=1787654743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=shmmSGcBhVr0mO/l9YtNu+PS04UbaQ1RsT84Z7QOJuU=;
        b=bKaUk8USVJcuOst+X558wMNcXzMMDHtKXeKkqGUo7yiP7JnxVqQZzinonbO0pk54Df
         GS6zKlm/UDARNBP+l5VpLJl5CYbDOX4MTRLnb3LrYjLf9QREjRvzBd6RCc4x1y0UhAd7
         7mh0+0eW47qP7otQCOcdA4YnkM9JIWyyR+LwYBixfc4ru+ElZ9a/THzIphlQETWvo7TN
         sbXbcp1AEH6MKVBa88b/woVado9mMThNeq6vDqjzeLyUrmT/v9lYTdi7/Z/eSRolnq3f
         Hwk1/lTubLGJUKKZwGQw11pvordv89F1SfEeSyKqfwx9NlUYGTuYttqW0hnDhlQSg9pY
         Xcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049943; x=1787654743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shmmSGcBhVr0mO/l9YtNu+PS04UbaQ1RsT84Z7QOJuU=;
        b=m0RyCtLmw10BX63mcABiVDowqm6fFgCuUfGf0PTOuECLR68ANZIzyh7jF09YhsOlRT
         EgQpUmq0Jew9X9dt8R5kpiiLM+HJ4kzUpgw3VzKSKNcfxScdEteA+64DSdxIAu0j3/YV
         bkTq+QuyNyTRLw/CDXlyJfvsNhJH5Q34UNbmutZeI5MBRZ457EbH7iPyZz0ePtUKQN8M
         s5dfZmPVP3ZRflQdYsGUKL/H+70V4o0I2EvSiT2zdQDjrZXyVhUj72iLFfivhfTskpyC
         ntRXHIUN8nq3Qpki6OS4o8vBo2DO65tbp4CfJNbKdV83P/j3aOE7sFLpW9FLp3XlRKn3
         oW8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp2HfmJzOt4bUqXc0nTY6F77zuz2xpIuWbXPxh3Ya9fdtun2gbx0RmcsfJuirM+JnUpIiEHsoyUE/8uww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2JxIuHbULiZVXWPRnmhb6dCR2aEGbr1EYjwLfcDcwQCzc1TZp
	ipHjQ/1N3NRXp8Y6l04kPQ543OGljEUIm4opx6QSXsk9Gq+6VbObsHP8
X-Gm-Gg: AR+sD11xHfEF1Hwy++4INpd0cs1f9i3OgTjDlneDClcMMto0kzw7lK+7Typurz8b0be
	zIKRWri8zWRbgBpbTsxAPcNZj3melkV8ekNcVNZ+njjoFas1s+GPub7IWXvW6cn+odjPF43VfeF
	il1hIWvv4mGhuXiyaOAFcQpTfzvs2hbbAefIYGZtgR7zKaCbebltCPQuZHzamrcW5/zhqKp5uMT
	0OXV7HEh6EBurSCmGpUML1LIEJ9K5bHrhhdikM0t8m+Q5O31lpcKOT9d6jb726WqYgIB8UOtrwR
	yz4x2BDJDi5576B1eZMbI/IquJS0UY6tTwS1HYxPWsMAPY4ViEM7SIO0FtfGzZdKFxVbg1htVbq
	aG8ULEzf30JDYx/anikd4b7IWAjnlSGJMj39I6vRZSaNiz/zRhLwLZw5vpN7vRZqWudWMgcybVz
	cFcexq0CTexBJSzxes69QF1xMQKUzQ7gnJUpN5BL3mokwePS5x1LXOnnDXlRHrAH4eTVlTZ3l3K
	VbMqSOIg8IxOR7ZkBLwFhd2OH9cyrSvykkXS4XwW6ZS0grnCcAE7fdrW3xjGdw6mBz7mGvpCRgC
	Njnp
X-Received: by 2002:a17:90b:3f47:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3955a774dbfmr9754597a91.9.1787049942887;
        Tue, 18 Aug 2026 03:45:42 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15056847eec.19.2026.08.18.03.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:45:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt7986: Drop redundant probe error messages
Date: Tue, 18 Aug 2026 17:45:26 +0700
Message-ID: <20260818104526.37904-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c  | 8 ++++----
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 2 +-
 sound/soc/mediatek/mt7986/mt7986-wm8960.c   | 4 +---
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index 7a6ad9116e55..e7ecb2761b4d 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -334,7 +334,7 @@ static int mt7986_init_clock(struct mtk_base_afe *afe)
 
 	ret = devm_clk_bulk_get(afe->dev, afe_priv->num_clks, afe_priv->clks);
 	if (ret)
-		return dev_err_probe(afe->dev, ret, "Failed to get clocks\n");
+		return ret;
 
 	return 0;
 }
@@ -414,7 +414,7 @@ static int mt7986_afe_runtime_resume(struct device *dev)
 
 	ret = clk_bulk_prepare_enable(afe_priv->num_clks, afe_priv->clks);
 	if (ret)
-		return dev_err_probe(afe->dev, ret, "Failed to enable clocks\n");
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
 		return 0;
@@ -484,7 +484,7 @@ static int mt7986_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt7986_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "Cannot initialize clocks\n");
+		return ret;
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -535,7 +535,7 @@ static int mt7986_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt7986_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index fc55ff47b7bc..49f5b2bf565f 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -124,7 +124,7 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 
 	ret = clk_bulk_prepare_enable(afe_priv->num_clks, afe_priv->clks);
 	if (ret)
-		return dev_err_probe(afe->dev, ret, "Failed to enable clocks\n");
+		return ret;
 
 	regmap_update_bits(afe->regmap, AUDIO_TOP_CON2, CLK_OUT5_PDN_MASK, 0);
 	regmap_update_bits(afe->regmap, AUDIO_TOP_CON2, CLK_IN5_PDN_MASK, 0);
diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index f1dc18222be7..4517af9e2d14 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -135,10 +135,8 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n", ret);
+	if (ret)
 		goto err_of_node_put;
-	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-- 
2.43.0

