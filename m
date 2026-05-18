Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C053E2ADB;
	Mon, 18 May 2026 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085369; cv=none; b=DqLbP6EvljFcL0q/SnXgGktSDHqdLruZQb45apdmBIdB8hOgXUTVxXsPtkTyI1VmB8lgQNUfCVUftHg1sj6Ln5L0SrGvaZPOeWrfWiyQ65uCEh+9if6cRfOCGzB1pFVRPSZ0e1YZXMwRyBaixWXUpacUp7ThcGDSCiPbvnJTzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085369; c=relaxed/simple;
	bh=dHcuwQewOQ91+lcIOJFibASbfSOLIkUa8mNyTgSGWBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFiComwakDiQq8YcMgMWh9jNDhHJo+K5EeWvRsVngqUzwuMcfWkDvZ2MhEx3SX2dtzZBUbLG+pg7999C/CMyyPH6tTliT02vfzPrQt4HzWpkzXdsIYT4BRnNB9cjsdvH8jqZQAAQMmV5fYEiW2Vo0t7kPAkqtlp1GPPEOTogS8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=jstzffJx; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="jstzffJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779085288;
	bh=MzLAGIAWkK+XCchAd4hGeXE2CHkEuJGkm4cHQuRIBJ0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=jstzffJxK8VTfUEGmM5FnTWoPh/mmOmV9akrGQkPng+SOHZbd1YEISiXWOb+fO9vy
	 yiV4Hr0btWdRMu9SqmYYaHnxT8lvxPymkUAomcgslCszm/uxeVLibZ1GcoSUStJ+yL
	 Ac3NAq5P7cQVsYmzDhw3iKvNtUIukyS/GsG7A+NA=
X-QQ-mid: zesmtpsz8t1779085280t3c7af7b1
X-QQ-Originating-IP: E3Ys73emsUdUyf9XkmiQ0SIGqXhmKVAS1Gx4p/Hd35g=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 14:21:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1184573455148698779
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 18 May 2026 14:21:09 +0800
Subject: [PATCH v3 2/2] ASoC: soc-pcm: constrain hw_params when DAIs share
 the same BCLK
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-i2s-same-blk-v3-2-2ba1c4f41db9@linux.spacemit.com>
References: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
In-Reply-To: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779085269; l=5785;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=dHcuwQewOQ91+lcIOJFibASbfSOLIkUa8mNyTgSGWBs=;
 b=6D8ZuFt4bPxPHExkd2VotXaHhHDkhYQIpQWWLctSzGnwYoo5vGnXrVA+KDrcBHyUi0VT6bZRN
 cCCTk/mVDvxA2/rSOjSYgWCjJbwhHGuyVCyIClLZ27dHpzhyBTdJd9J
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OcFnI1CoIwQYRA1yQVDrADRzvBuxzly4b/O9GzOrBTjZ5CCTvLm+4ZMU
	RsTZ1jlUx+fi207Su7vlKwLrnDRFsipQyc1SVIE69myzeLHlPrZbEtrkI3DyRfswnAP4SrP
	1pIlaft3S1d6UqPJD60tqM37lhBs9pMZwZAnaWLzvOREXuyhIODN+Mfv6bEneKEaPAF/Wrk
	760WAi6WlCkSZCibSyPFS/H92975BLZxpFAzAvk+OU4aq9Uc/t5d4oBtwPXT+kXn5BFlOLW
	i8lS92a3WV/C1iWN7VVi77vctKbygqgDAnqMyj7pbl364NbDuO/zOe+Wq5WXgYvql5Xa1j6
	rSm+mmIgxaguHkPnxaLjp3uDFfS/5XWyXA+7bskauhfdD8PDtBK79bipfTBmozmYQZeCPlB
	359OPbONXt3iLhg887gRmJoLNDT1x+y5b6Z6sG1X/AzwMQWW52kyI7CyXS4aynxG55p/l1+
	wMbFOrwE9plfKhc+2fidOh6Re5aeygW3yzwGdC5VCVu1vvZjTFFoEpc/npn3UZicQulX0wc
	Rwad62a4jRIykaGodaww46yRGBDG6K4fKez/8Lm4lEA8VqDLsSaKX8dgt4cyHSIIFA0fZOy
	dgJk/uOz2XmoNjy7YXmlX3Rf2/T0lwEuQqh1PwC46LTiE7HPVUeMYOR7G4BHT8KNDzJk32r
	r8pJkXJCu26WVJfWh9bFd6HZlT3t23JdwTwZNWpZTTaJmF1tNo19/FPqWv/EwIBfyYgcqWq
	LAM3QAsZlNzZIXafAwywLfyL5A0v+uumJsofeKF9/q/PStPrC/xN4Jp7SutpYlWfWdkUjql
	6x3ZRZWl3wP/Ht20kF7vyvwLpn1JpMZwJu7kvdJb/oevX9g2Lhh5cbEhgpcaJuoEawcfFg4
	MIQ51CzEtsn1gRQUj9iA9Xgeya6xzh5diX6HPTtXMM03Q/ybfhdzXGb8N59jFpy31rAEoNi
	RvHC85xDPZ6IKWL3QLZWavUk8WWRQhsuvI//BzZ7o0Kj+uvAOzXsHN+k9YUlcCfZcz1E7lw
	owars6muFN/8Ttvhdq3ZZIby+CcZlvN9yphHEXi5l5ieLAhuzCmb1gA+/9lUzekshKa6//o
	n+An9BPtlLK44t/p7bVrXTh+JFuhcb23q1kmt6gUyxHhC3ANSWMOIqaYSWnfv3uUw==
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
 sound/soc/soc-pcm.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9b12eedb77c3..e75c343b8d4e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -12,6 +12,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/slab.h>
@@ -467,6 +468,117 @@ static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
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
+	/*
+	 * Protect the rtd list traversal.  No nesting: this callback runs
+	 * from snd_pcm_hw_refine() which does not hold card->mutex.
+	 */
+	guard(mutex)(&card->mutex);
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
@@ -903,6 +1015,13 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
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

