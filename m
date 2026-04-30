Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67093FADEB;
	Thu, 30 Apr 2026 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535266; cv=none; b=dbvn8kMCIfGy6HHBlXzGacAq0n7106IVNTLAWk4ZsoYQSqX+fQNv/vZHLhYNZCNYn3uHiKs5YaCVepaBUb2wDCeGIH0qxXUuNU7X27TOT6P/HnwpowUONEuZDIQM9eONtiUrJHjFWLTKimODVR9APAhTYMsrYJQosKunM31EY5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535266; c=relaxed/simple;
	bh=+AOehAeFMZ/iCsOdMkiivxTgmBjlqo18Jbb1Af4YUAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gYA4/9nuvM11+vN1J78INByNKriZPte/P5hyA+gUhw0K/K/twFs+LOIedbUT6JvJVX8quMlEzAr9Ph1WcVryx97C8xcZ+eaLX47uUR4E3WTQ2zhKjncSPHghVUnQBpCqO+eaurXgeXrlMeX04gTXdmSC+IdPWE43qIL676xfuC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Pf8dxb9r; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Pf8dxb9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777535184;
	bh=ZyK4+tYKJ8Cm73O23RbpzHZP3WQI9PDB7siKkct6zPk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Pf8dxb9rgIzIVrsJyrVQ8bmiIKgj6awoTl0TkghYToAKew/60RMgivO+dU1yvifAP
	 aSIabGr+aQUIB/sYk8+M8NjA5Dc1ZRGeBLX9Ip4yNnrgo+SIi2lh/HgmFpYmJw143N
	 XeZu32PeRwNDobz88eDpCLf6xcrOG8sHmCpXDbDQ=
X-QQ-mid: zesmtpsz7t1777535177t10e7e85f
X-QQ-Originating-IP: VDWhBp4dhMLxPMNny7x3zYhYOI7Bh+2JVpdq1duQmuU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 15:46:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9984203707270973070
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 30 Apr 2026 15:46:02 +0800
Subject: [PATCH 2/3] ASoC: soc-pcm: constrain hw_params when DAIs share the
 same BCLK
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-i2s-same-blk-v1-2-3a1f04eb6159@linux.spacemit.com>
References: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
In-Reply-To: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777535165; l=5604;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=+AOehAeFMZ/iCsOdMkiivxTgmBjlqo18Jbb1Af4YUAU=;
 b=3hdSSwzTHR6ZIkEfyQJbJauaEO24gGqui7DXH+gacJWBaWg5UEX18zzrZoeASmhtzY8mdLqpg
 A6HvsvCAkyMASQicdxasGcPjPXV80+2FgXk3bRql5YoSJLRFB3RFKsi
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NaSDI5eCksKEvs3Iro5iw2MtL8nKv6pSfQaURi6RicN/Y6L2qlrsfBFC
	PW2wgDBJx6k+iroKFfFwN0A7NCdaKNhsUwQLXPzKkc9q3DscXRZRxRX/qsHT7zSseLLp596
	LAg004rFMWaX7OFuEkIa2LoYnwOhxNisGFBlzecus0/dL73zUtsp7nPrWlbiIJq2fgRuifR
	fJ/8mJH+q/ODWRc3wV3W/JkYI3+P4PpunbR9p5E+n02Xf9/nEkgt8m+VI3IX6djZiSGSAPu
	bmr4se2xlIbHDF2Aqqz7iVASE2NaaKWLEWavy6uU3vr4wzxWPXdiVVxqMjTSYh9fE3MxkSN
	Im/DXpu7dVBw3XPcLzpIjyls33pB8GOObqYuT1WbZmVXAz2Lg4kF5njHPv19/FKIAkcO4NB
	2r+TUIrpZ7zxf2ozzu5n5ZuwqXwcMH3/amLOhp87dZV4rLX5BNt/UCBxrL6GnOZijtYboLc
	olCP9puRxmI+xQ6dVK+Qge3ZJ5tqUuotFx92UL8Z/cKFklyKMBiYB/tqLuEcCZeERs6nlrs
	c5qgUBzKH+05RoR8dkpQE6AJO+xtkVIY8L1wV4d9rEPIVZeRSJVQR9p49m4xKtt8XITFV0v
	IvPK+XxhOHDS8esEVAkqfyVBQsRw7a5qfdXLcccOk0Mhlh5L4rDS/NY0fHEdexy3+htDN0j
	idEKVFSfcEJSyhSawGvAKP1zWOdCKTVwzvlSjfU8czpB0s5bkX70RjxD72uQFOWeKrdi5MW
	YTsMhLxOJ5+A/I3ukOj8IScJ3cu5RRgeY0RkDbrQYOmti7K2aYhXoo9jhEr9LfLRrYUa6CO
	547YIy24V2x1JUb0TTp/OimEa/L3TJSSp/02S0f1l383uLyrxrU+2bY+9HGLqhaQc2FTpwe
	TGrdPUuux4vJQSlG1PVxjcoCAU8euTwxUMhHHuOrT3I9wGEx2aSu+S0HDD7/QuJHUQiSzGb
	hZMPDxW2P++jGjnrp5+K29GYTSafrkDyikoSff7xjlrJS5SVAptMvi/4ToR/X3g6UQ20Dy2
	2N55qv9WcSqGobVVcVpnI/OZvNLwwootlKfGeuyj0c9YSSLQ3HbJjcD9Gz9/poEz0BmUSp+
	4/gMHPsCdtwPqmlkrYh5ZS25lyUm9aK/yKEkaX3NTT6seroUF2oeLJNAcmXfQCvJqIGldSc
	Y8sVLGEKSF0TMQQ=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

When multiple CPU DAIs on the same sound card share the same physical
BCLK, add a hw_rule during PCM open that constrains the sample rate so
the resulting BCLK rate stays consistent across all sharing DAIs.

The hw_rule is registered unconditionally for every DAI that has a bclk
clock pointer set. The actual peer scanning happens inside the rule
callback at hw_refine time: it walks all DAIs on the card, looking for
an active peer that shares the same physical BCLK (via clk_is_match())
and has already completed hw_params (checked via dai->symmetric_rate
!= 0). This ensures the constraint uses the real BCLK rate established
by the peer's clk_set_rate() in hw_params, not a stale boot-time
default.

The first DAI to complete hw_params is unconstrained (no active peer
yet); subsequent DAIs are constrained to match.

The rule supports two modes:
- If the DAI has an explicit bclk_ratio set (e.g. for TDM where
  BCLK = rate * slots * slot_width), the rate is constrained to
  active_bclk_rate / bclk_ratio.
- Otherwise, the default formula BCLK = rate * channels * sample_bits
  is used to derive the valid rate range.

The constraint is purely additive: DAIs that do not set a bclk clock
pointer are completely unaffected.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 sound/soc/soc-pcm.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9b12eedb77c3..31f48795a653 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -12,6 +12,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/slab.h>
@@ -467,6 +468,111 @@ static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/*
+ * Shared BCLK constraint: when multiple DAIs share the same physical BCLK,
+ * constrain hw_params so that the BCLK rate (rate * channels * sample_bits,
+ * or rate * slots * slot_width for TDM) remains consistent.
+ */
+
+static int soc_pcm_shared_bclk_rule_rate(struct snd_pcm_hw_params *params,
+					 struct snd_pcm_hw_rule *rule)
+{
+	struct snd_soc_dai *dai = rule->private;
+	struct snd_soc_card *card = dai->component->card;
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *other_dai;
+	unsigned long active_bclk_rate = 0;
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval constraint = { .empty = 1 };
+	unsigned int target_rate;
+	int i;
+
+	/* Scan all DAIs on the card for an active peer sharing the same BCLK */
+	for_each_card_rtds(card, rtd) {
+		for_each_rtd_cpu_dais(rtd, i, other_dai) {
+			if (other_dai == dai)
+				continue;
+			if (!other_dai->bclk)
+				continue;
+			if (!snd_soc_dai_active(other_dai))
+				continue;
+			/*
+			 * Skip peers whose hw_params hasn't run yet.
+			 * symmetric_rate is set by soc_pcm_set_dai_params()
+			 * after snd_soc_dai_hw_params(), so non-zero means
+			 * the DAI's clk_set_rate() has already executed.
+			 */
+			if (!other_dai->symmetric_rate)
+				continue;
+			if (!clk_is_match(dai->bclk, other_dai->bclk))
+				continue;
+
+			active_bclk_rate = clk_get_rate(other_dai->bclk);
+			if (active_bclk_rate)
+				goto found;
+		}
+	}
+
+	return 0;
+
+found:
+	if (dai->bclk_ratio) {
+		/*
+		 * Driver has set an explicit BCLK ratio (e.g. for TDM where
+		 * BCLK = rate * slots * slot_width). The only valid rate is
+		 * active_bclk_rate / bclk_ratio.
+		 */
+		target_rate = active_bclk_rate / dai->bclk_ratio;
+
+		constraint.min = target_rate;
+		constraint.max = target_rate;
+	} else {
+		struct snd_interval *channels = hw_param_interval(params,
+						SNDRV_PCM_HW_PARAM_CHANNELS);
+		struct snd_interval *sample_bits = hw_param_interval(params,
+						SNDRV_PCM_HW_PARAM_SAMPLE_BITS);
+
+		/*
+		 * Default: BCLK = rate * channels * sample_bits.
+		 * Calculate the range of valid rates given the current
+		 * channel and sample_bits intervals.
+		 */
+		if (!channels->min || !sample_bits->min)
+			return 0;
+
+		constraint.max = active_bclk_rate /
+				 ((unsigned long)channels->min * sample_bits->min);
+
+		if (channels->max && sample_bits->max)
+			constraint.min = active_bclk_rate /
+					 ((unsigned long)channels->max * sample_bits->max);
+		else
+			constraint.min = constraint.max;
+	}
+
+	constraint.integer = 1;
+	constraint.empty = 0;
+
+	return snd_interval_refine(rate, &constraint);
+}
+
+static int soc_pcm_apply_shared_bclk(struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	if (!dai->bclk)
+		return 0;
+
+	dev_dbg(dai->dev,
+		"ASoC: registering shared BCLK rate constraint\n");
+
+	return snd_pcm_hw_rule_add(substream->runtime, 0,
+		SNDRV_PCM_HW_PARAM_RATE,
+		soc_pcm_shared_bclk_rule_rate, dai,
+		SNDRV_PCM_HW_PARAM_CHANNELS,
+		SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+		-1);
+}
+
 static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
@@ -903,6 +1009,13 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
 		if (ret != 0)
 			goto err;
 	}
+
+	/* Shared BCLK constraint across DAIs on the same card */
+	for_each_rtd_cpu_dais(rtd, i, dai) {
+		ret = soc_pcm_apply_shared_bclk(substream, dai);
+		if (ret != 0)
+			goto err;
+	}
 dynamic:
 	snd_soc_runtime_activate(rtd, substream->stream);
 	ret = 0;

-- 
2.54.0

