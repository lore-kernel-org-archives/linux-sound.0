Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631FE45FFD3
	for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791757367; cv=none; b=jRInu/CBPRVLk04GaxoxFebSC3GBXpZ6LxOaQJvniJbjNlYKbdjddNYgHCDPmgai06WZb6f8NygrS+QPRoPheD8m8snjHp/0+kWDSkqpkk3KgkNd7BAkVz92lHKVav14LnpZAzlH5QPovHUd4CgaWYmseAD2s6asdXzdKB6lHKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791757367; c=relaxed/simple;
	bh=/EeIk6G4F8JpYIU4/UDJn7HQuJhuER8OVAeheh4SLqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wyc7QzpBHgJyB0j22v4CWO5WpVDzvCJZjcBs50z9MOqeoNmRpEqIueDBpHVn1KHw5qPOdCJBpWastl0xQzimQf+UDatKHuA/8OxVkn7zUM5ENEIKHpEOfVN+vZjCYRYDVTc6KK2L5YxEA8qXFMaNeO6Rul3baKMomOrYl3KmH/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbsG8lGY; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbsG8lGY"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53381e53b80so18020441cf.1
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757365; x=1792362165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YPAZN0oQNOTlT28AVZKZkrChj6dbwv6rRrQ+C168c+4=;
        b=YbsG8lGYGvEujMt/jGWIBreEZqVepGpPrHQ/u1w86b4TMgJ98sA3mlnMlobxkRwZt7
         QQ0nHcO2oMoM+bs1rsU+q2t22WF0GpVLxXknwdoZIis8p4DTR7X5126svteJNm+3KCY6
         j2pm5hHRzKx4GxBiEUvdblO0w+KgHc8Hcmd0sesxyjzgEGh4V2autGVqT6R+YvD272yV
         oRY8YJBTJ9oxPr1tgRm4xElA0VCMC20jj7l/KkqrGpbnSlSCYKfgJOmqsuGadanEVMP8
         E/gwRi0+emNjrdq+ut5i2l9wDM+mmaXRv0KT4IN8k52Bk4jU7H0Qp5nFvrYvAyT50YT9
         GDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757365; x=1792362165;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPAZN0oQNOTlT28AVZKZkrChj6dbwv6rRrQ+C168c+4=;
        b=ytLTnp5RzoBYV/JVgs0qF1vEaw96Li+evYGbNFzCEfg1SaI4MR9HTgQgIztxGAHpj3
         gRmyBAzbYlFlxXM8/CMq5F+O63vg5mp+prMPuDJzV7Tdmknoqr3/7WHplDDPzA/xCseQ
         k/u+A0XX2I4AbnpYZbHzMwHq5ZVsnY+L9GTLM2wqDc4uUvmvqUo6JfA8F2Dwy4WDuGcM
         Fqc0rk8IRGYc8ujumc/TQwrSESlP34VEukDMIyTsymlYQv0MIjNDmuLybjhEgb3A2TGd
         zHFOI6bA/rhqQgiXveA7Wy0AgLs7RtcycTGlZMhGM471K+fzNu/L4lYtyYuN04J7lshF
         nTLw==
X-Gm-Message-State: AFq9FYLo5thC4R86nWY2ZcfmFG1EBjBI7j5/PRjpZ/BoNexCNE7z8eOf
	R3r77S/f69CLu37vkw4aBwng6z+3gV+SFOAAab500XqQSmO21+1KMbU=
X-Gm-Gg: AYBFou2Xt/woYHGmVuzl9bOkOXi3auFRrx1LUYBG4WW3Yr3msEiMPScc0g5RFMNJNnl
	0AP+U+4YzXxOE6zCk2KekXS2ss+f59TcB9qPgr5ddwNT8qrQkKr67USWsf8ccz7wwK2Um+2h7m8
	qtozSGgGp8Cx7uY48nF1Q2JsbZwNITF4WSmy1Spn3OoeuOT9/EN6txnCS6SGRkpv2+BOBpLH7b0
	iVo3pNUyl4jVKkL2coFjfW/8OGOWgK3nU8jay7dj7eEJd72rz/rQ9grXONA6PYuIe/PSUR0X1G1
	EEydA/LQKaNM2vXFT3RQO/RhwE7gtYlrkx0/2xxyK+IKRGHrKTc8J82UL6mYTtbPZmULeRx6DXZ
	LQNKzGyY7tEfxkNMZgnxjGOwh/iy9x9k7wVPIxDjNXZoUKEXUKL2j3bC2jwWbWcKtQVxA55LcPX
	ssCXw6JcarrhoqSqezskWXP+iKPXLRghBwaE8LiYHlZbCBx2EhIO5XZfs7rqQNFNWUlzZj6IAWj
	YFI/3cyGWesvmMRNVxfGTPzOSGt9RwRMvaNAh+Ks3BLah7LbV4/le5UN60Dn6e/p7DyfwVAvOgE
	tCHE3k3xM0m3vFXbpm6tct6EuXPN
X-Received: by 2002:a05:622a:2615:b0:535:1ee6:ab03 with SMTP id d75a77b69052e-5359fa73be1mr143610051cf.20.1791757365216;
        Sun, 11 Oct 2026 15:22:45 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:43 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
Date: Sun, 11 Oct 2026 18:22:33 -0400
Message-ID: <20261011222234.2098904-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before joining the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

This issue was found by static analysis.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64).

 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

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
index 77cf2b604f6c..913c3b43fda8 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2507,12 +2507,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return dev_err_probe(dev, irq_id, "no irq found");
-
-	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2567,6 +2562,14 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		goto err_pm_put;
+	}
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2596,8 +2599,11 @@ err_pm_put:
 static void mt8189_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8189_afe_runtime_suspend(dev);
 
