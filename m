Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69DE3E1D1A
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 03:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780459132; cv=none; b=AS72VpKhT57BIMfok31iQqw7pEKdClNXFdYkOcp+22lVCYlp7LsTIUlzbCEnRKBBsaur8NEx5EjfzvS2VZFi/p41hyXjn/sInF+SRFkkj+rx/7We+GuGA+bb81SZs+3X9kTG9Z59goAdyEI9/eI8WBEAtKEzKShHuv2b0BKlEKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780459132; c=relaxed/simple;
	bh=1M3PAyZrjavSNbOUY3zabGNeELst3SOHCSmpoiOYn8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ4J4utt0Q1nYf9WwXvriJ6f/lLwgOgDeHPWJa9bnc3lSxxSKKRCdpuhfWq5TFJBlVvA07Ws5nXVQjjbQeesktlPD3TcJQ8V4TxO2FlcAtvgU3IHp7nAuiGS2O9jLHVCBbJxxLoHMsJBJI0kyc8/31E+F/ypFb68YqJsa5+iTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3W1mi9w; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3W1mi9w"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf18c30bb2so40375165ad.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 20:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780459129; x=1781063929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKUwYRq411Fq4Xkzy3EUVsGEYUhUD2Bh/DLagwG0Hb0=;
        b=s3W1mi9wuX2XMSva7jhOmTaZ8g5r9wRjuVlZM+n1ym1yJ2wdQSnchHVY/Ww/YeQbha
         kUmX3ons7BFS1C6wW7MuxhESe9SVjsot4x1vyOYz/Dhlqgkd0EhWaPEOQWYVzaCW2n04
         dI9kWsUfD2GuHoVwns//D1UPITaV3XX3u+WXxwU8E0pyGpvorYtA10SO/8CWHskbId8s
         LZ8UucrvRqQD6fk8/L8RgZAXepU8zUpLMm8zOWg8x0xbeX1TeibQhSZUktGuvBvvXLr8
         9GaOGnGeVLlxN17LtxJJAd4em6qNVg+mO8H28aKpBvqFRZUyhmHvKvxBJZbv6Xk74OY0
         tBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780459129; x=1781063929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKUwYRq411Fq4Xkzy3EUVsGEYUhUD2Bh/DLagwG0Hb0=;
        b=dvO0Frfu96DYTq9vTNNVBXlLhbZAfyMtXJyPtMzmRlCaQ7ck00hChOLTp9HaRLBUpP
         3fYvZzS6yXotrhcBb/XX+1LxqTemWpENzveFBdOLS7xqsXqqHlhVX1ME5w2LMVw6UzZB
         n7lHn5iHLZsKoxJg+4F1xfk4/EhIRbKdyDkEIhpfX12ZiiQD+CVgkOK278JDlAIEzfl8
         LJlFRtGog18IBXokvpFGUBSZ66O7pqLzDz6l31CrX5J/+jwxg+Y2obo5xAVBhWFhY1f8
         Xp/AcrAhC2I/9Kq6yrHuThuySzla6ycuWLxzMYzXxlo+Im2zGee0UjTyrSoLLlsUbpDn
         M6gw==
X-Forwarded-Encrypted: i=1; AFNElJ/Zp0IQpKmDEAUQTRxPy9x7D6kg07anYS0KY7BvwSeVTiVWdHnEl3aPPGtev09TkeICSI8kwXchNtAfQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7D7FJkmk9lpAC8ylHSJ4V4thgA4I0cRYfre2wwnq1hmH/g1b9
	+tuMQUAPs34ohLNTby/Bltizi9T2ZzALrKlId8zzkXek/LJKLMeMsFCt
X-Gm-Gg: Acq92OGJJTyWGS3dp51G1WC4MhIYB77LED2HgBOd6r4pnNqxNx8MHhmZeWJHGfNNN19
	LMpCKakRuiVnOhP1zvQMYrqZj0BjauvWzthHXeQ9c+PCUvDeZ82XLprMM17JGEsZt3FfdzlD1oz
	vsUaJqxnqQiXQ1CMYN1Gn6M5ks+RSdm3RDXPcVbV0FNR6/hfyKcvH8Wxu8qzSL3z29xYUbQa9m/
	S+Z75jnoFcVeY1MxhWVOKEDkwFlxt+OzuLTSklJ4J//VxHTFCgVtJibYejU7muuumKRZT9iGOnd
	GIInH8CkVyY0JTgX/XqwcGidKrXc/6b5g3sT/OTBGfSGz86P0jPNlBgsiK2VHvmCrTemySETy24
	ZWrgMr7OQYfZ3uTonwgZdq6LPx4pERaK8Io/+6YXbdKaAFpHDf559bJCwa667eRkqqV/KywY4jK
	1n/RPqgvgGbwYrEzZaAG0yD0vdEt7yr2IJYFq0L4VIlpLzX6tkMd55KhLG1AVyDTnXlZ5k/zq1n
	47kTgA=
X-Received: by 2002:a17:903:240b:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c163a2cca5mr15715565ad.11.1780459129060;
        Tue, 02 Jun 2026 20:58:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm8461085ad.6.2026.06.02.20.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:58:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: rockchip: rockchip_sai: Use guard() for spin locks
Date: Wed,  3 Jun 2026 10:57:41 +0700
Message-ID: <20260603035741.68893-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603035741.68893-1-phucduc.bui@gmail.com>
References: <20260603035741.68893-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/rockchip/rockchip_sai.c | 258 +++++++++++++++---------------
 1 file changed, 127 insertions(+), 131 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index ed393e5034a4..9104f4dedb15 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -18,7 +18,6 @@
 #include <sound/pcm_params.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/tlv.h>
-
 #include "rockchip_sai.h"
 
 #define DRV_NAME		"rockchip-sai"
@@ -216,14 +215,12 @@ static void rockchip_sai_xfer_clk_stop_and_wait(struct rk_sai_dev *sai, unsigned
 static int rockchip_sai_runtime_suspend(struct device *dev)
 {
 	struct rk_sai_dev *sai = dev_get_drvdata(dev);
-	unsigned long flags;
 
 	rockchip_sai_fsync_lost_detect(sai, 0);
 	rockchip_sai_fsync_err_detect(sai, 0);
 
-	spin_lock_irqsave(&sai->xfer_lock, flags);
-	rockchip_sai_xfer_clk_stop_and_wait(sai, NULL);
-	spin_unlock_irqrestore(&sai->xfer_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->xfer_lock)
+		rockchip_sai_xfer_clk_stop_and_wait(sai, NULL);
 
 	regcache_cache_only(sai->regmap, true);
 	/*
@@ -483,7 +480,6 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
 	unsigned int mask = 0, val = 0;
 	unsigned int clk_gates;
-	unsigned long flags;
 	int ret = 0;
 
 	pm_runtime_get_sync(dai->dev);
@@ -499,56 +495,56 @@ static int rockchip_sai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		sai->is_master_mode = false;
 		break;
 	default:
-		ret = -EINVAL;
-		goto err_pm_put;
-	}
-
-	spin_lock_irqsave(&sai->xfer_lock, flags);
-	rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
-	if (sai->initialized) {
-		if (sai->has_capture && sai->has_playback)
-			rockchip_sai_xfer_stop(sai, -1);
-		else if (sai->has_capture)
-			rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_CAPTURE);
-		else
-			rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_PLAYBACK);
-	} else {
-		rockchip_sai_clear(sai, 0);
-		sai->initialized = true;
+		pm_runtime_put(dai->dev);
+		return -EINVAL;
 	}
 
-	regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
+		rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
+		if (sai->initialized) {
+			if (sai->has_capture && sai->has_playback)
+				rockchip_sai_xfer_stop(sai, -1);
+			else if (sai->has_capture)
+				rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_CAPTURE);
+			else
+				rockchip_sai_xfer_stop(sai, SNDRV_PCM_STREAM_PLAYBACK);
+		} else {
+			rockchip_sai_clear(sai, 0);
+			sai->initialized = true;
+		}
 
-	mask = SAI_CKR_CKP_MASK | SAI_CKR_FSP_MASK;
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_NB_NF:
-		val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_NORMAL;
-		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_NORMAL;
-		break;
-	case SND_SOC_DAIFMT_IB_IF:
-		val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_INVERTED;
-		break;
-	default:
-		ret = -EINVAL;
-		goto err_xfer_unlock;
-	}
+		regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+
+		mask = SAI_CKR_CKP_MASK | SAI_CKR_FSP_MASK;
+		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+		case SND_SOC_DAIFMT_NB_NF:
+			val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_NORMAL;
+			break;
+		case SND_SOC_DAIFMT_NB_IF:
+			val = SAI_CKR_CKP_NORMAL | SAI_CKR_FSP_INVERTED;
+			break;
+		case SND_SOC_DAIFMT_IB_NF:
+			val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_NORMAL;
+			break;
+		case SND_SOC_DAIFMT_IB_IF:
+			val = SAI_CKR_CKP_INVERTED | SAI_CKR_FSP_INVERTED;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
 
-	regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+		if (ret == 0) {
+			regmap_update_bits(sai->regmap, SAI_CKR, mask, val);
+			rockchip_sai_fmt_create(sai, fmt);
+		}
 
-	rockchip_sai_fmt_create(sai, fmt);
+		if (clk_gates)
+			regmap_update_bits(sai->regmap, SAI_XFER,
+					SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
+					clk_gates);
+	}
 
-err_xfer_unlock:
-	if (clk_gates)
-		regmap_update_bits(sai->regmap, SAI_XFER,
-				SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
-				clk_gates);
-	spin_unlock_irqrestore(&sai->xfer_lock, flags);
-err_pm_put:
 	pm_runtime_put(dai->dev);
 
 	return ret;
@@ -564,7 +560,6 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int ch_per_lane, slot_width;
 	unsigned int val, fscr, reg;
 	unsigned int lanes, req_lanes;
-	unsigned long flags;
 	int ret = 0;
 
 	if (!rockchip_sai_stream_valid(substream, dai))
@@ -618,84 +613,88 @@ static int rockchip_sai_hw_params(struct snd_pcm_substream *substream,
 		val = SAI_XCR_VDW(32);
 		break;
 	default:
-		ret = -EINVAL;
-		goto err_pm_put;
+		pm_runtime_put(sai->dev);
+		return -EINVAL;
 	}
 
 	val |= SAI_XCR_CSR(lanes);
 
-	spin_lock_irqsave(&sai->xfer_lock, flags);
-
-	regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
-
-	if (!sai->is_tdm)
-		regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
-				   SAI_XCR_SBW(params_physical_width(params)));
+	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
 
-	regmap_read(sai->regmap, reg, &val);
+		regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_CSR_MASK, val);
 
-	slot_width = SAI_XCR_SBW_V(val);
-	ch_per_lane = params_channels(params) / lanes;
+		if (!sai->is_tdm)
+			regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
+					   SAI_XCR_SBW(params_physical_width(params)));
 
-	regmap_update_bits(sai->regmap, reg, SAI_XCR_SNB_MASK,
-			   SAI_XCR_SNB(ch_per_lane));
+		regmap_read(sai->regmap, reg, &val);
 
-	fscr = SAI_FSCR_FW(sai->fw_ratio * slot_width * ch_per_lane);
-
-	switch (sai->fpw) {
-	case FPW_ONE_BCLK_WIDTH:
-		fscr |= SAI_FSCR_FPW(1);
-		break;
-	case FPW_ONE_SLOT_WIDTH:
-		fscr |= SAI_FSCR_FPW(slot_width);
-		break;
-	case FPW_HALF_FRAME_WIDTH:
-		fscr |= SAI_FSCR_FPW(sai->fw_ratio * slot_width * ch_per_lane / 2);
-		break;
-	default:
-		dev_err(sai->dev, "Invalid Frame Pulse Width %d\n", sai->fpw);
-		ret = -EINVAL;
-		goto err_xfer_unlock;
-	}
+		slot_width = SAI_XCR_SBW_V(val);
+		ch_per_lane = params_channels(params) / lanes;
 
-	regmap_update_bits(sai->regmap, SAI_FSCR,
-			   SAI_FSCR_FW_MASK | SAI_FSCR_FPW_MASK, fscr);
+		regmap_update_bits(sai->regmap, reg, SAI_XCR_SNB_MASK,
+				   SAI_XCR_SNB(ch_per_lane));
 
-	if (sai->is_master_mode) {
-		bclk_rate = sai->fw_ratio * slot_width * ch_per_lane * params_rate(params);
-		ret = clk_set_rate(sai->mclk, sai->mclk_rate);
-		if (ret) {
-			dev_err(sai->dev, "Failed to set mclk to %u: %pe\n",
-				sai->mclk_rate, ERR_PTR(ret));
-			goto err_xfer_unlock;
-		}
+		fscr = SAI_FSCR_FW(sai->fw_ratio * slot_width * ch_per_lane);
 
-		mclk_rate = clk_get_rate(sai->mclk);
-		if (mclk_rate < bclk_rate) {
-			dev_err(sai->dev, "Mismatch mclk: %u, at least %u\n",
-				mclk_rate, bclk_rate);
+		switch (sai->fpw) {
+		case FPW_ONE_BCLK_WIDTH:
+			fscr |= SAI_FSCR_FPW(1);
+			break;
+		case FPW_ONE_SLOT_WIDTH:
+			fscr |= SAI_FSCR_FPW(slot_width);
+			break;
+		case FPW_HALF_FRAME_WIDTH:
+			fscr |= SAI_FSCR_FPW(sai->fw_ratio * slot_width * ch_per_lane / 2);
+			break;
+		default:
+			dev_err(sai->dev, "Invalid Frame Pulse Width %d\n", sai->fpw);
 			ret = -EINVAL;
-			goto err_xfer_unlock;
+			break;
 		}
 
-		div_bclk = DIV_ROUND_CLOSEST(mclk_rate, bclk_rate);
-		mclk_req_rate = bclk_rate * div_bclk;
-
-		if (mclk_rate < mclk_req_rate - CLK_SHIFT_RATE_HZ_MAX ||
-		    mclk_rate > mclk_req_rate + CLK_SHIFT_RATE_HZ_MAX) {
-			dev_err(sai->dev, "Mismatch mclk: %u, expected %u (+/- %dHz)\n",
-				mclk_rate, mclk_req_rate, CLK_SHIFT_RATE_HZ_MAX);
-			ret = -EINVAL;
-			goto err_xfer_unlock;
+		if (ret == 0) {
+			regmap_update_bits(sai->regmap, SAI_FSCR,
+					   SAI_FSCR_FW_MASK | SAI_FSCR_FPW_MASK, fscr);
+
+			if (sai->is_master_mode) {
+				bclk_rate = sai->fw_ratio * slot_width *
+						ch_per_lane * params_rate(params);
+				ret = clk_set_rate(sai->mclk, sai->mclk_rate);
+				if (ret)
+					dev_err(sai->dev, "Failed to set mclk to %u: %pe\n",
+						sai->mclk_rate, ERR_PTR(ret));
+				else {
+					mclk_rate = clk_get_rate(sai->mclk);
+					if (mclk_rate < bclk_rate) {
+						dev_err(sai->dev, "Mismatch mclk: %u, at least %u\n",
+							mclk_rate, bclk_rate);
+						ret = -EINVAL;
+					} else {
+
+						div_bclk = DIV_ROUND_CLOSEST(mclk_rate, bclk_rate);
+						mclk_req_rate = bclk_rate * div_bclk;
+
+						if (mclk_rate <
+							mclk_req_rate - CLK_SHIFT_RATE_HZ_MAX ||
+						    mclk_rate >
+							mclk_req_rate + CLK_SHIFT_RATE_HZ_MAX) {
+							dev_err(sai->dev,
+								"Mismatch mclk: %u, expected %u (+/- %dHz)\n",
+								mclk_rate, mclk_req_rate,
+								CLK_SHIFT_RATE_HZ_MAX);
+							ret = -EINVAL;
+						} else
+							regmap_update_bits(sai->regmap,
+									SAI_CKR,
+									SAI_CKR_MDIV_MASK,
+									SAI_CKR_MDIV(div_bclk));
+					}
+				}
+			}
 		}
-
-		regmap_update_bits(sai->regmap, SAI_CKR, SAI_CKR_MDIV_MASK,
-				   SAI_CKR_MDIV(div_bclk));
 	}
 
-err_xfer_unlock:
-	spin_unlock_irqrestore(&sai->xfer_lock, flags);
-err_pm_put:
 	pm_runtime_put(sai->dev);
 
 	return ret;
@@ -705,7 +704,6 @@ static int rockchip_sai_prepare(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
-	unsigned long flags;
 
 	if (!rockchip_sai_stream_valid(substream, dai))
 		return 0;
@@ -726,13 +724,12 @@ static int rockchip_sai_prepare(struct snd_pcm_substream *substream,
 		 * udelay falls short.
 		 */
 		udelay(20);
-		spin_lock_irqsave(&sai->xfer_lock, flags);
-		regmap_update_bits(sai->regmap, SAI_XFER,
-				   SAI_XFER_CLK_MASK |
-				   SAI_XFER_FSS_MASK,
-				   SAI_XFER_CLK_EN |
-				   SAI_XFER_FSS_EN);
-		spin_unlock_irqrestore(&sai->xfer_lock, flags);
+		scoped_guard(spinlock_irqsave, &sai->xfer_lock)
+			regmap_update_bits(sai->regmap, SAI_XFER,
+					   SAI_XFER_CLK_MASK |
+					   SAI_XFER_FSS_MASK,
+					   SAI_XFER_CLK_EN |
+					   SAI_XFER_FSS_EN);
 	}
 
 	rockchip_sai_fsync_lost_detect(sai, 1);
@@ -915,7 +912,6 @@ static int rockchip_sai_set_tdm_slot(struct snd_soc_dai *dai,
 				     int slots, int slot_width)
 {
 	struct rk_sai_dev *sai = snd_soc_dai_get_drvdata(dai);
-	unsigned long flags;
 	unsigned int clk_gates;
 	int sw = slot_width;
 
@@ -931,16 +927,16 @@ static int rockchip_sai_set_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 
 	pm_runtime_get_sync(dai->dev);
-	spin_lock_irqsave(&sai->xfer_lock, flags);
-	rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
-	regmap_update_bits(sai->regmap, SAI_TXCR, SAI_XCR_SBW_MASK,
-			   SAI_XCR_SBW(sw));
-	regmap_update_bits(sai->regmap, SAI_RXCR, SAI_XCR_SBW_MASK,
-			   SAI_XCR_SBW(sw));
-	regmap_update_bits(sai->regmap, SAI_XFER,
-			   SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
-			   clk_gates);
-	spin_unlock_irqrestore(&sai->xfer_lock, flags);
+	scoped_guard(spinlock_irqsave, &sai->xfer_lock) {
+		rockchip_sai_xfer_clk_stop_and_wait(sai, &clk_gates);
+		regmap_update_bits(sai->regmap, SAI_TXCR, SAI_XCR_SBW_MASK,
+				   SAI_XCR_SBW(sw));
+		regmap_update_bits(sai->regmap, SAI_RXCR, SAI_XCR_SBW_MASK,
+				   SAI_XCR_SBW(sw));
+		regmap_update_bits(sai->regmap, SAI_XFER,
+				   SAI_XFER_CLK_MASK | SAI_XFER_FSS_MASK,
+				   clk_gates);
+	}
 	pm_runtime_put(dai->dev);
 
 	return 0;
-- 
2.43.0

