Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FDA23741
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766768; cv=none; b=gT8zaSe1WwLfmRdklbIRys7l1DIRznKvLamG52hKXVBB1Po/zGWyztEhENXD+qaiQmqO+1+iVRuOH3D7EoVOs3qCnK+CSJEieb8R0elxzqSitwFZRVvuqmvLskAAddmmnIsh8BzH1pWyVwnbDdhYgbZPimI3Pm3kmf1+Wy8K15E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766768; c=relaxed/simple;
	bh=NhHX6IBXjO/0G1g+R1TOgHR37BItrClQUpm46od0UVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RDyskz3yGJQxfJHA8h6BGkBiBMsRwvOZNgl4+w4MwtWTYCa/tTOdwA+LEuYizGFHKwlPQTtzWcaeg13Vx31R9rZ8LWK7+8DLU+0OPDlQiNMbovDcsKxVbHulMZrEQT568Qm9xxZi2mjU40nYzRbjH7uR8BXWWGIQztjMifEeV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ml1gFk9k; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ml1gFk9k"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f0ad52830cso11737479eec.1
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778766765; x=1779371565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Stmpo+0lPViteLuiSq8jsNNiYrzYXEO7tqXW2BNyTVw=;
        b=Ml1gFk9kciRQSnP7KdHHwT9DpJKaxT2tGSED0Np4tI/HwL9KihwSxKdmcq34CRC4Nw
         hSsYrXiniUSJciCvc6u6IRYTvTgydgS2asH9SHwRK7tVH+quA70MB22mG4XGaFEx5PrB
         Jz7EzNrqU960SDiexWukpKdcUN5UqKqyAnaTTAa5FVPsWSPq8Bwj1hHVH/6s5kfX7JtT
         fi2z4H2b1NG1phahvwMD0Dy//ZGSkFvnVECfId75ZlqqkuCR3mMPWcWDDfLqgwniVO+L
         SPKq6BRFTY0YwKSQgf95oKB4gwx+vgBM+NhaD7OlWPzClTi6V96Dhu7wMe5+sfwCZ8Et
         NkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766765; x=1779371565;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Stmpo+0lPViteLuiSq8jsNNiYrzYXEO7tqXW2BNyTVw=;
        b=mRqN2hH01H9t4EMmTZUVG2bAEHx2ejeKwGakwOzmLkIz/idmd59Cssulie4hnhtftb
         TvTieIaMofqNJJ+GrGiutjmeqAWnVdpQ7ry34sPmUkH+D8e2169WokuizArDvIBLRybT
         Zi8awADtRhI/EIFxMCPqEwoA6Tsigm1iD73kH+nPKWJSn8SIQQIkxz32pVHDODhM4hEH
         q+fUc26LhNFuzfV7EzudhpbCTJc4OBp59ldEEAulTeXYw80mkn776cxdaGYblpsSQTEj
         ugmAjUPeK32HnomTqno/TlYlG1uSzQXunrSWd0jw2g7guVeIlYmv7Bzu2VmdZbFBCowj
         P3+A==
X-Gm-Message-State: AOJu0YzNrugxQRvCazQdlNouG+3v3cijRZKO1aopOSX6zaZxQAjfN0lG
	JedD5EP3Nc9kCZYMh9bK9QiYYRfMtZDtELTQHQtbY95lMepLKoOEaEpF
X-Gm-Gg: Acq92OGIthwBuZZQA9vZVIdF6vdBfXMGHyBftIPYMH12Et2HjaW8ChUJVXRm7rwEcme
	4aZqHLBf/ZVr2M3YENFcPP3UtbgXLG5AsEq1Bo0JKK2HUal+yZqZJRw/FR9quI3FVGnA3J3F2fp
	Mn/c9Pep1Gl0wTnVruxnOJ3JhDncQEXk9pxM6f7aYD9t0505L/VDoDPEDmAtEwN1/kxyw6/XG0d
	TTgs37wEQaygFH5CcR0y3JD3T6xnAHn721W2bpfiMXSWXg3zs042aUgpBuO71NsI0X1xdvWKQ2s
	PAvsAfCdD/Qs4nXeA8RHIdQHOXU23fOsC/ZEkCObIBWP9ZjuJJ4Tpl2uWFYyznxiZVky278wium
	9RD723PAGBoD2doUysvAG8nAOCkb2/ehvkiFy0i/DopsBfEEEoRau/LPQjArn7PjYkDrStfGNyt
	ePwI3qf9Y+Un4aSTb/TSOCbXCQIyb0gymgWvAiYXNhjWM5JsSMRxyMSfbURPtbSFZ/GM5SMLcAN
	g==
X-Received: by 2002:a05:7301:4002:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-30119f6d53emr5000426eec.23.1778766765152;
        Thu, 14 May 2026 06:52:45 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea78sm3029289eec.6.2026.05.14.06.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:52:44 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 14 May 2026 10:52:35 -0300
Subject: [PATCH] ASoC: mediatek: mt8189: Fix probe resource cleanup
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-asoc-mt8189-probe-cleanup-v1-1-ded733363281@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJ04RavIpxUcqgY7RtOmBMC
 Hen6PIt/l9BuQgrXJoVCn9EJcUKOjUQHj7eGWWsBtMa23Zk0GsK+J4duR5zSQNjeLGPS8buPPZ
 EztLkLNQ+F57k+3tfb3/rMjw5zMcQtm0HHpQo2H0AAAA=
X-Change-ID: 20260512-asoc-mt8189-probe-cleanup-57d911861f86
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4629;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NhHX6IBXjO/0G1g+R1TOgHR37BItrClQUpm46od0UVo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmsl5caqG1/d3ySrujjHf3qbZvmXZ/P2yGtUm3V8iWp8
 cIfl+meHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjARHi1GhvbDrLpCpRNfZT84
 uuzrjZyfc0S4Evvfvqlx+D6rL7wr6zzDP+umW/Xavy6KS5jGKXE9X91SUzzv6SJBM7d7cWEFq9y
 +MwMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The MT8189 AFE probe assigns reserved memory with
of_reserved_mem_device_init(), but only releases that assignment from
.remove().  If probe fails after the reserved memory has been assigned,
the assignment record is left behind.

The probe path also uses pm_runtime_get_sync() without checking its
return value.  If runtime resume fails, pm_runtime_get_sync() leaves the
usage count incremented and the driver continues initialization without
the device being resumed.  Use pm_runtime_resume_and_get() so resume
errors abort probe without leaking a PM usage count.

Finally, component registration failure currently jumps to a label that
drops a runtime PM reference even though the temporary probe reference
was already released.  Return the component registration error directly,
and do not drop an unmatched PM reference from .remove().

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 38 ++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 24b0c78815f6..77cf2b604f6c 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2351,9 +2351,13 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
 {
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/* enable clock for regcache get default value from hw */
-	pm_runtime_get_sync(afe->dev);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return dev_err_probe(afe->dev, ret, "failed to resume device\n");
+
 	mtk_afe_add_sub_dai_control(component);
 	pm_runtime_put_sync(afe->dev);
 
@@ -2417,6 +2421,11 @@ static const struct reg_sequence mt8189_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
+static void mt8189_afe_release_reserved_mem(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2431,8 +2440,15 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = of_reserved_mem_device_init(dev);
-	if (ret)
+	if (ret) {
 		dev_warn(dev, "failed to assign memory region: %d\n", ret);
+	} else {
+		ret = devm_add_action_or_reset(dev,
+					       mt8189_afe_release_reserved_mem,
+					       dev);
+		if (ret)
+			return ret;
+	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
@@ -2533,18 +2549,22 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	dev_pm_syscore_device(dev, true);
 
 	/* enable clock for regcache get default value from hw */
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to resume device\n");
 
 	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
 					    &mt8189_afe_regmap_config);
-	if (IS_ERR(afe->regmap))
-		return PTR_ERR(afe->regmap);
+	if (IS_ERR(afe->regmap)) {
+		ret = PTR_ERR(afe->regmap);
+		goto err_pm_put;
+	}
 
 	ret = regmap_register_patch(afe->regmap, mt8189_cg_patch,
 				    ARRAY_SIZE(mt8189_cg_patch));
 	if (ret < 0) {
 		dev_err(dev, "Failed to apply cg patch\n");
-		goto err_pm_disable;
+		goto err_pm_put;
 	}
 
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2563,12 +2583,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->num_dai_drivers);
 	if (ret) {
 		dev_err(dev, "afe component err: %d\n", ret);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	return 0;
 
-err_pm_disable:
+err_pm_put:
 	pm_runtime_put_sync(dev);
 	return ret;
 }
@@ -2578,14 +2598,12 @@ static void mt8189_afe_pcm_dev_remove(struct platform_device *pdev)
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
-	pm_runtime_put_sync(dev);
 	if (!pm_runtime_status_suspended(dev))
 		mt8189_afe_runtime_suspend(dev);
 
 	mt8189_afe_disable_main_clock(afe);
 	/* disable afe clock */
 	mt8189_afe_disable_reg_rw_clk(afe);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id mt8189_afe_pcm_dt_match[] = {

---
base-commit: eeecc92a9f1dd213dd52d9b8f42d155595b1d278
change-id: 20260512-asoc-mt8189-probe-cleanup-57d911861f86

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

