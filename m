Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F73E9C32
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335771; cv=none; b=FfAgpkC39MrtJH8ZxZUqdiCYNEjgMRCQdrB9kRKC6o3bzMY97HVLJnA/LUp02a+v3HCJsImeU8LEa354gcJLJ7D+ZbYgiiUkEE2Ip/tmJt29hVCNkWRjtVWaTrYK7Xw1mlOnKGV5mRT0zKYEY55GgE0alcKlBzTjkzcnq3bIZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335771; c=relaxed/simple;
	bh=nErmHbw686AzZGbAnOUfTQcS4k4G6wVLFybhkkeK7QE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCtTqHQbADXD5l7bUO7kN+hXbPN56rPOYoMqDH60Dudl70IBsF3m4PuSTxqG2X1d40gkXbES0WM8S1/f7nvUA0xs/lJHg52BHGBNvavpl8QNt1VSvrJ8qaKIW9Wst+EEAbjOFHshiKruGNfLMBiJJMhcU8z/VoknSo5ql80E1Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APSDm8Q8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APSDm8Q8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E101F00A3A;
	Wed,  2 Sep 2026 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335770;
	bh=cz2kWxHWk8JmkOJ3eCL4DjVr3r5+YFYR1GWj/sAKHQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=APSDm8Q8UPOr+z9V4LDgghh2DP5+QV/YRqRwyiIyJNQ369LlFWNHi2sAuDzSnuJGE
	 1o1GMXv59agPMFKKSc/rfAHb4OMZimRzNNl+UQSwln0FFVL3sh+mdAiW52dl0jGOAN
	 bTSx4JXRazyaCkclsOu3Qu3rXHmFgHTSa3sCdMlst41uIwyhinyNAPZssxM68gnvf3
	 jhCmKYddbm0/y/oH23qQyjpHHLN24/eORTJXC7b8s73rLCzZNtd5GF4hyol5bE6RkJ
	 9mGisKNZcBGn0XnUL2qkXYy9xJqE0dUZpDD6ZXXMxqe7s/G1emLjsU8PmxeBRTTnXq
	 oSsl0S3CwrTeg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 09:55:57 +0200
Subject: [PATCH v2 7/9] ASoC: ux500: Remove obsolete PRCMU QoS calls
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ux500-msp-fixes-v2-7-4b60b002d55a@kernel.org>
References: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
In-Reply-To: <20260902-ux500-msp-fixes-v2-0-4b60b002d55a@kernel.org>
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
index b3de115d829a..5b4b3126637e 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
-#include <linux/mfd/db8500-prcmu.h>
 
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

