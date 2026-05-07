Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045D72C0282;
	Thu,  7 May 2026 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149983; cv=none; b=WKRqbAoLj2YcOQRy4sat8TZESAsnQqlOQmsFy7a1H4X2xtQPhZ8omw39jGvEzybXyv3Rc8NNFp+XV8Wq2xoZw2EgsyHg2waleoWGo8DuDRbWsy0qWoDn1oJkg9Zg2Ltk9B3wJRq79dieSImcYlnM5AuGTwwlKwiAyHjN8ogt+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149983; c=relaxed/simple;
	bh=dHcuwQewOQ91+lcIOJFibASbfSOLIkUa8mNyTgSGWBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGgayNC95cudJWp5FsLvPmvZtLvsjayWcWt2P+TZdJ2iAb9AHClt6XpVykv5XTFx5AdmQu5YUCrxFZ1y+5SqYe6Vs2TsD5ahIrF1hYtip/w5wsM523Kn9tjBeyFB8kqgqSODVBD7lw81xNV9ztGcy3zWOsyFUk2wyKHPViB4Yv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=lUUZ9cT+; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="lUUZ9cT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778149926;
	bh=MzLAGIAWkK+XCchAd4hGeXE2CHkEuJGkm4cHQuRIBJ0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=lUUZ9cT+GygDgLz6wdHzaE3Y3IQwIJzkI7slPaanjOcSMLA5E2SCUTFIzMVobD3sR
	 4yKrfwShNYDbS9u457NmEqCT9cX3T5Emcktsruh9y9vZnrOMyMsa7JS6D3Raulc2vE
	 uSiR3W72yq0Jpxy+WfnQBEgYlAxNXmfKADzR3YO4=
X-QQ-mid: esmtpgz16t1778149918tf7e27786
X-QQ-Originating-IP: mHa7ppekGTzd1+13tMcGS5yqyWnnUNMpj+ng21mAHZk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 18:31:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15051299853537787261
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 18:31:43 +0800
Subject: [PATCH v2 2/3] ASoC: soc-pcm: constrain hw_params when DAIs share
 the same BCLK
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-i2s-same-blk-v2-2-ede05a22f732@linux.spacemit.com>
References: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
In-Reply-To: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778149908; l=5785;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=dHcuwQewOQ91+lcIOJFibASbfSOLIkUa8mNyTgSGWBs=;
 b=NbtniqEW25n4xUv0iVA/ktb5BAl2nFn4hzHuUE0SFUHJHAcndBmILS4Oonh6PP9u3dYgZGyUA
 pm4l88XWS+KDFpmXtGlKehkpEsI2/oEDh61kfA8VU0l40jZOViVemRV
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MzOrCbSXFQdfTT7uEET/FBlgp5PRiXI+H3t4NRuIB6slvEH2swrf9GUa
	oYvFHPbeZFcbwjqgh+ks8vF0wSeKoW7HwcAhjECyJdJbGMGtVPyY81WYhZkEl0cl6yCSRel
	E7Rr/UY7+s/4etipwIA2iOjoVTnQfx9VwETNR1WvFJqDy/98MvZ90KpX9bcxfaqqL8I5aCC
	juQ26FYBD6cCJwNjz0y3Pv4eytDeWH9SlQNigQLtiVqPEqV5J0WP6RRMnYiQPjyXnJmZ0t7
	lsdoCauCiM6qphlzHNPk8RQR2Cmu7wFBV2i9ky9V0/e2tJOJvrjXEsJdebFhntwEVB4bEk2
	mL2lbpnxArRWMcU9s2YTnRe/7ifxgGrK6TQsnMBnppRnznQVg3dLksPlsMcHhIJn1tGjBrj
	PxpzZ1TstlfcZTL8yBEox5iPGTHdUVCNBpDxFahikOJwUQSdpE4t2DXnxWb/P8U/Wk8h0VF
	P/hK67Wea3ru0E3j2UunmXwU1GU+Pas3L3zSVQgW20LGUznr7r1Jr3JTQtF46babjHlkijY
	SSEfBFYAFgNyQ9pYvMMyhg5qmUBjX0pjpd8QEIPebGyAdkl6vALi6fbeClyPbKcITZYvsuG
	G68ThD2JTys0xoHkyZ7GxCJexBnN4DC0HMN+dfby4S+0IdG+xkcNWzw+i9PQsRo0xfPI98L
	lz4Bj+Y73UjrO3ZFu/pH5ITU8QXBgPLB/2mGVYsZ0qBtA8JblQw1aD8+0tUNJIlWMfS3qLL
	PfUZn/ndA8jZ+KKqPzaKSp4B8GHBRU0TXQoGgudRJxMdCo+YagapupgxthLL+wMA3Sux4ss
	vHkQUCF6IS4i3s3+zxrSwbotxbuI0bILPttR09ny4Ab4iuVdiGeGmLGvOZhOeA12qoS/SHm
	7fW5b2s9u8mCX5imbKGl/DCRX6OWyDXo+GRtkl0A3CnktjnXwwNGaP7hzD7+r9K9YSgkmNn
	NXQCMEX5Ckf9qD76haAaxZXrPsnnAJ4dMcSI30Y4P40aD8gXUKtkKaHRZccaPK10aWoq1jf
	nOiRIWsv/2nekxgpLBbK1XAMtsCw1QE+RpUSC8iQXf9iNVvPE8oHd8YkTdAAl6PzlGC8Oy0
	6PQSrnG2zbXal3X25Hy8wnzB8iYitOSc6b8J+rgTkTxIaJXvsMrwKsSwkfsTKHHJg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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

