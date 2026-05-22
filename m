Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15043E8C78;
	Fri, 22 May 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456955; cv=none; b=WxU+Z3ZkG/0GpiqUfEzVFAyAhISUpzw5pTMCUPj2SOC+R72NL/GUa833QUZ2hTzRhgV1yC66ttsWkvLuUBJ+syunsaGqmnyLizKbNJV/C2dF6XSTy1sm57EB3yhzqPf65fYFyfC0vrn2DrQapzBHsVnLzeDxJ7v8F3u1fkOUA6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456955; c=relaxed/simple;
	bh=cj1EjUM699n6DwPiNAQ0TESANNZBoZiYy78W+H/j1Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOJOkPkZ/8S4XVY+OMHZvFJzSJSf2vZs+kpSwwhdiWNk0Dmnlyc/JJoyiFDBNZQo/WAtz7W2S30Y1CetNbShPZbTC7W7bHMahk69VcWAOxguctieMyarPIys8BBxfn5RHrSs0ZP4TMvkZJcpuysDmSgNvCnInVnI0KUHl6mkacY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VhfbEUny; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VhfbEUny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779456858;
	bh=SiHRNytKmirl6VM5/+dn44k5NGarOBSE2a5i2Emh2UM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=VhfbEUnynmNAiYrTLWN2vvVceC5mPQvNXoTooui2H43eB3Jz1ZcDtG8Ve2kAfhlDS
	 eCKzpqlBeN4oGOGH8GdNYARTtQNsAyGEE9HY5JOCR9pcyoGIgYHDXLw4ik2v4dmewu
	 cLmtyyNa2X4kBIIq4Txz8kfmoVQ09Bg4N/Z8buOs=
X-QQ-mid: esmtpgz15t1779456851tb55d8d6a
X-QQ-Originating-IP: IPlNtOEI7DEeqQyoCrxPS7wFFPg4RvZbZXDiILX/i9Q=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:34:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13054678115676240062
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 22 May 2026 21:33:59 +0800
Subject: [PATCH v4 3/3] ASoC: soc-pcm: constrain hw_params when DAIs share
 the same BCLK
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-i2s-same-blk-v4-3-a71a86faaa20@linux.spacemit.com>
References: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
In-Reply-To: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779456837; l=5579;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=cj1EjUM699n6DwPiNAQ0TESANNZBoZiYy78W+H/j1Vg=;
 b=5nr4kKimnGwTMoC+FhkfgLS/mCXu5CIsV4L92oHLVF4Z9cLDNqXJ+YtCWKTBwSCCUtV1K4Y2w
 +ObzqLfWQidAUeS8hvvGl+u1pFf/Tm0FqXAbex1eVk1vc3TTmoGKR0O
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ONsBhzqno2d9f6zvjxchYgaKjpHhVNUFyHRrfXzStsSHewDf7O/YFDNg
	ciyaSsIAGLpSPgAfLVXfpZwSBpjSBD9Exb9+NhC+6LQrgSO3LlHYhFTX1qIagdGdvsr25OD
	wzegeMxEERkUKac2QyCxlMuXW++FObJSfRqClQcJuSG6eCafRjWOf7GEyCNhoIE2/N8KED/
	5+zfxQngA/P6NI8utRGbVDHdBdVyBsIb6pvNfiuh3Fy5T/FC9ODxtoj2UsuT81Vy81dl+SS
	wJBK3rrZEo5oI3hmagBTnCRxSfjNfuGvxadrE5ib8S3RLLrnWR6t2MhNLWtlVNunC0K2NBy
	F9dmzaHMza5WMTMt4w5J8OfBWl+ae11+NmwrFVvTvE/4Zm0dQSo0GWKFj9spCh9Elzx9pKc
	qktOTtnUOKgi9rbfcDcEh8ChiaOtwHu0VBiQ3y8h7v9ObIvK13fSjVIKvjxOq3O7OExSF/W
	ro0M46riIRDxd/W8jn4qGYfNObdQPbTNpcOprXodkxeH3tuyz1LyP8Mm0RMKZfhwu762Zqm
	wA457/c94BwgwTjWFMXzHoKt1mEC8+CJ7LBXzYedHS6TlPtQx6PaPBrc+PnutmlitG07Uz1
	3d14ZrGiMDY91g8Qyh/dT6L+A0soc2l6QDVFKDCaa6kddxmn8BbVaxexOmAs1sB5D9NHIoD
	iObTOrRlJ7GjgR2syqFE2Ta5D0k1gxnGMymxZjWZGygtWNgX5eqtea/FGx+o6iIm6W7w5ZX
	BXUxuC4Y5mUP7oSYf8YQ31edsPBWfRoU0iiDrz4ckH14vYbdYliuIR+gCM0gfpczYWyOcsj
	2XSU38IaMgoYYNllWFgJwwZgkr3gxabuRiRpzlJOWzR5iuAmDcxZNOlpJC2kauZkYTWVAto
	sYaZyW98TC//6py0x1NDu7hi5+nsfVhp4fXYeIoW/8dK4tQjcB2XZPQujxsK5fEBnd9lIrD
	68z2TPuy3GmbrgmiVsf/2XyS1hyBwogtWTqSBhKMvx7J68EGVeNZkHa8psdrCrNWVkmi2Zb
	sCA8KswfiKZVJ+QnAPgyLzmgOqpOT1fg0HawA7fbGHHZ3dbk7OFCswueqDKM8mE5Vhog/ve
	yPwT1VV/COfSJ3bGJZHG40qYQVKrW/0xAZ4c5z1H6X9s9tzdPbWqFzsPKx4w2crWRCVmfPF
	NXCzN0n97aMnAj3jemsXZy+Qap8ZNKQh8/jz
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

When multiple CPU DAIs on the same sound card share the same physical
BCLK, add a hw_rule during PCM open that constrains the sample rate so
the resulting BCLK rate stays consistent across all sharing DAIs.

The rule callback scans all DAIs on the card at hw_refine time, looking
for an active peer that shares the same physical BCLK (via
clk_is_match()) and has already completed hw_params (checked via
dai->symmetric_rate != 0). This ensures the constraint uses the real
BCLK rate established by the peer's clk_set_rate() in hw_params, not a
stale boot-time default.

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
 sound/soc/soc-pcm.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 25e494c4ed81..0e49290a8c90 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -12,6 +12,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/slab.h>
@@ -470,6 +471,114 @@ static int soc_pcm_apply_symmetry(struct snd_pcm_substream *substream,
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
+	/* Protect the rtd list traversal with the ASoC card mutex helper. */
+	guard(snd_soc_card_mutex)(card);
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
@@ -906,6 +1015,13 @@ static int __soc_pcm_open(struct snd_soc_pcm_runtime *rtd,
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

