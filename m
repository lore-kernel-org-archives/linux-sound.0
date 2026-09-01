Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690C47B425
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 22:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302644; cv=none; b=E0wnX184YdPzQAPkV7PsSITbcCgjjwBuo6g/1upl2WCuQrGtUSrBck1Oo3NRcnKbAR2/f+Pg9QZh/2CzpR3TEAJXdqvmoMXfC2YKNKX+oCOS28bWVdEir5pzUBKBidxIFZmiHwIp4zcBm3hSsIhyZoFqvcVE39b6PP5fM7FzcHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302644; c=relaxed/simple;
	bh=2xd2I3TpovbZfLdQccA5CZigYf0ZQ99eG7oIz1QLOz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/NBE2UxtTLBVE0VMQDlB68M/UH83HpoVvvHfojRLIY1MROG6phsnYcgM6jO+bG6zGXfVAZPatURNB7JlAEYFPAoQMBBw5ipx7enooTeZ5D2hWqYLfO0lLA2Uza+XiNJtbexfdzrpm8g2N7FMARLyZHKCgd5MlYtcPDVwtOGgbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaiCJnBA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaiCJnBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3931F00A3A;
	Tue,  1 Sep 2026 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302643;
	bh=x2a6pMDSpHbGosH516QRk+j+mpr0atVZ76s5yAP/qkY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JaiCJnBAcCVKjmdPCtIXUTWoDgrA3RiLt2Z8mQTH2FiSSAc59LjaMZEiWWY3od3e7
	 /VlrljcjaesUBivMRCyDNj+H3/DyhG0IhF6mrYIf/TmuJTgsHW5lXMwdjTdY1x/Tc+
	 TKnhwL73hbx6oSfC9Wae/N7f6b0p+as0WosJDWlKLOhVWcH5xSlYmu5BaUFXGx72Sa
	 lKyqFTBsSy7Fk+WGzhit6a87OyMOuikXgHJTxG+eq7YLCYho7WN1IFaMmhaaILnqh1
	 AbNwFA1mJ8CydDOB8qldAFlWoyxg8rcrBxoP67rWrKvCYvav3pzSXNelW5aSmG7QlT
	 cN9O53uKLHCKQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 00:43:50 +0200
Subject: [PATCH 7/9] ASoC: ux500: Remove obsolete PRCMU QoS calls
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v1-7-da1447fd9f7b@kernel.org>
References: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v1-0-da1447fd9f7b@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The DB8500 PRCMU QoS interface consists of unconditional inline stubs,
so the MSP calls and cached constraint state have no effect. Device
power and clocks are already represented by the regulator, power-domain
and common-clock frameworks.

Remove the dead calls and their private state instead of pretending to
change the APE operating point.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/ux500/ux500_msp_dai.c | 26 --------------------------
 sound/soc/ux500/ux500_msp_dai.h |  2 --
 2 files changed, 28 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 8450a4799c0f..5b4b3126637e 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
-#include <linux/mfd/dbx500-prcmu.h>
 
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -393,12 +392,6 @@ static void ux500_msp_dai_shutdown(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "%s: MSP %d (%s): Enter.\n", __func__, dai->id,
 		snd_pcm_stream_str(substream));
 
-	if (drvdata->vape_opp_constraint == 1) {
-		prcmu_qos_update_requirement(PRCMU_QOS_APE_OPP,
-					"ux500_msp_i2s", 50);
-		drvdata->vape_opp_constraint = 0;
-	}
-
 	if (ux500_msp_i2s_close(drvdata->msp,
 				is_playback ? MSP_DIR_TX : MSP_DIR_RX)) {
 		dev_err(dai->dev,
@@ -440,21 +433,6 @@ static int ux500_msp_dai_prepare(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	/* Set OPP-level */
-	if ((drvdata->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) &&
-		(drvdata->msp->f_bitclk > 19200000)) {
-		/* If the bit-clock is higher than 19.2MHz, Vape should be
-		 * run in 100% OPP. Only when bit-clock is used (MSP master)
-		 */
-		prcmu_qos_update_requirement(PRCMU_QOS_APE_OPP,
-					"ux500-msp-i2s", 100);
-		drvdata->vape_opp_constraint = 1;
-	} else {
-		prcmu_qos_update_requirement(PRCMU_QOS_APE_OPP,
-					"ux500-msp-i2s", 50);
-		drvdata->vape_opp_constraint = 0;
-	}
-
 	return ret;
 }
 
@@ -710,8 +688,6 @@ static int ux500_msp_drv_probe(struct platform_device *pdev)
 			__func__, ret);
 		return ret;
 	}
-	prcmu_qos_add_requirement(PRCMU_QOS_APE_OPP, (char *)pdev->name, 50);
-
 	drvdata->pclk = devm_clk_get(&pdev->dev, "apb_pclk");
 	if (IS_ERR(drvdata->pclk)) {
 		ret = PTR_ERR(drvdata->pclk);
@@ -780,8 +756,6 @@ static void ux500_msp_drv_remove(struct platform_device *pdev)
 
 	snd_soc_unregister_component(&pdev->dev);
 
-	prcmu_qos_remove_requirement(PRCMU_QOS_APE_OPP, "ux500_msp_i2s");
-
 	ux500_msp_i2s_cleanup_msp(pdev, drvdata->msp);
 }
 
diff --git a/sound/soc/ux500/ux500_msp_dai.h b/sound/soc/ux500/ux500_msp_dai.h
index 19058c238420..ad4ce69bfbf5 100644
--- a/sound/soc/ux500/ux500_msp_dai.h
+++ b/sound/soc/ux500/ux500_msp_dai.h
@@ -46,8 +46,6 @@ struct ux500_msp_i2s_drvdata {
 	struct clk *clk;
 	struct clk *pclk;
 
-	/* Regulators */
-	int vape_opp_constraint;
 };
 
 int ux500_msp_dai_set_data_delay(struct snd_soc_dai *dai, int delay);

-- 
2.55.0

