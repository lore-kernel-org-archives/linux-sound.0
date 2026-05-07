Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB5B346FCA;
	Thu,  7 May 2026 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150097; cv=none; b=C/Ocv24fewM0EyMYUgBj4WrU5lxduZ3fUh7viRJvUHKF7sTLur1EjLZh8No1T1Dmvno93te+tkZMbctU+Ri7xn7cUMz1qME7XrAT7z2fQAzw8rPkpRrDPSdUnar6RSAxn5Xw1spTRKurBoTahGVCJOuezJNMlrby1mPHQA+YZk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150097; c=relaxed/simple;
	bh=HevkQyYoy3kiO1VrBKioDTilzos+sth9T5xZNgNnIUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uriS+EwIBzd0oRgfBhPtsmH32uXbppXp0uNc/OiiZDmYr8UFQdDhViLk05fgf93GabZ2PDw2r8eOsHAN48LKjphln5aMCidfQCgLh6CZz0V/hvs+1Afei/PDGwbaHwPB0/V4i1AiUWxi7zYJ+bj93uabZwa2cQsUc9kJ6Ob2oFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mKz9LIST; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mKz9LIST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778150091;
	bh=AA/l8RpNRgQWhJKMhQO6AtegRn3p6g7Rx5XU5wAB/G8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=mKz9LISTxdOMjqAdw9/ysuTNUdNBJvPGHgdbyJbjQVeYjOIn5huQeN3d0qLv6bjQf
	 akIFrETVUeB0PwePeJiBbBOn/MTMdTe4q1XFi6FsDnfNkqUTuIYLQRb45tEnoPa/bA
	 0F/HcnDfz28asZcCADwA+i710fewYN9rKEJ5rjdM=
X-QQ-mid: zesmtpgz1t1778149914t5eb95826
X-QQ-Originating-IP: q0iU5z36pYpAszH2oFPO8xEGSgQLaSK2gKm4e5W7naI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 18:31:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5667795704540246135
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 18:31:42 +0800
Subject: [PATCH v2 1/3] ASoC: soc-dai: add shared BCLK clock for cross-DAI
 rate constraints
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-i2s-same-blk-v2-1-ede05a22f732@linux.spacemit.com>
References: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
In-Reply-To: <20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778149908; l=3103;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=HevkQyYoy3kiO1VrBKioDTilzos+sth9T5xZNgNnIUQ=;
 b=1wBfk5r93og4rl4TtfoXHWvQGYLKZnrhFvSIKzGC1ey5HGqMKcv7LK7VfR0vrHYQZCaGTkoyK
 Wbc0o53lQPQDdzDPTZEDHUk3FMXDaSVGgmHrvxWQmT9XMc4oMxyeXgU
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MHUne8CZIF193QyIEvKJroptxb4SosU2ca499hiPrYv0kIW9Rg4s/TeT
	IlcJrVec84QLjoM6RUeMELWtpzWDOMz9EfxckLTmWQ1w1S/qxPT28TEKKDl2o/k4+BDr3pn
	Llrj/iO9Nc8p2+kvFj2KWXFprjbqpKUfdmLUJsHDCOonuDvYrNSZLFrPrSsWk3YroZyLQhn
	aqhvo/o81wO2jML4sZtGx+2hbs7cXkAGmV4PmEEhutaEXOuZba8/z+4AbkdH5tWOKXabydN
	3HXCE6B/jWsMTyXzoDwxCSEUXJa5pFPb1Hd06YlpqLO3NZ6vUUczNzUMVzzKNkG501L0WWL
	naBrqK63GPSmtd7ilUp4VPpcl2Dc4jFwLZysnLsX+IhzUFS2wZNDtambeAuyeEeBtht+rLc
	gIXz/OAE9hiqRCFXpGqTwY7LcnJ9wcsLTRs2PcWfJxHa9wMcN2fwM+uk6MulaN/Hadq7ffg
	pj1LegkDL/PL/5NsO7r6yEHsEuiUlqwqXkLSq7iQ3heWELD3H0wqc30Lj9q4bG1IyUVCLin
	mwmev7C41z4I3lHctn/boLfBKw7KdTXp9s0Mq6tmI0O+IJRYb+Sf5MgA3zrnLP4qoPG6YHN
	TULHIJbqROielcVVQgpTeaGs3bWVfIgiXdP2SNUKeDPfdvuvmRgQRLrOpe5yIxPn1ILjxXw
	Zq0ORXA0LE5swrTkUiSZr7kW4vrM0c7thAWxJfubUMdYV0pyAZLFlGUn/Gj2C2EkoNp+ARe
	BuXJPbHAWd9I9HK9PEHVr49T4R3PdRrJg6jKy6JzumkovRPjsieUHAJLLlOixD0SAdPP2cx
	HxE5FXw5jlqagl27pKSuISZtDwz9+3GorOUbfNH8JQMpRUgt8p+ARtfDKUG81i3OuvP1anF
	/Gis3hFBnepM5TDuK/x8ox3TTOGo1nU9WyJLFm1inet4pOxBz4tGoe40XkImDfCCupVwgaZ
	aa7D6cyAhd/o01TBSVp+MoI6WQ8xfSQZKvViIeC+r6XpG+054u9gKvYxWZNZJCHz8TDeOLv
	yVbyexUhqkA6spGqUtfFegi9muQ6JBJ5mffIiXL1wfVuJ1VERTwYrgivmBKgO8Z4tvCHJnE
	sZ72Gse2LkAb20IYN6Z4FWao1VqJfPgRlN8txT+AYL7ojQw+1MeprIt0CwvOt0uYu/PjdW1
	HnGi
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Add a bclk field to struct snd_soc_dai and a helper function
snd_soc_dai_set_bclk_clk() that platform drivers can use to declare
which clock is their BCLK.

Also cache the bclk_ratio in snd_soc_dai_set_bclk_ratio() so that
the framework can use it later in hw_rule evaluation for TDM
configurations where BCLK = rate * slots * slot_width.

When multiple DAIs on the same card share the same physical BCLK
(detected via clk_is_match()), the ASoC core can automatically
constrain their hw_params so that the resulting BCLK rates are
compatible. This commit adds the data structure support; the actual
constraint logic follows in the next patch.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/sound/soc-dai.h |  7 +++++++
 sound/soc/soc-dai.c     | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 6a42812bba8c..df010a91b350 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -17,6 +17,7 @@
 struct snd_pcm_substream;
 struct snd_soc_dapm_widget;
 struct snd_compr_stream;
+struct clk;
 
 /*
  * DAI hardware audio formats.
@@ -188,6 +189,8 @@ int snd_soc_dai_set_pll(struct snd_soc_dai *dai,
 
 int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio);
 
+void snd_soc_dai_set_bclk_clk(struct snd_soc_dai *dai, struct clk *bclk);
+
 /* Digital Audio interface formatting */
 int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd);
 u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority);
@@ -473,6 +476,10 @@ struct snd_soc_dai {
 	unsigned int symmetric_channels;
 	unsigned int symmetric_sample_bits;
 
+	/* shared BCLK clock for cross-DAI rate constraints */
+	struct clk *bclk;
+	unsigned int bclk_ratio; /* BCLK = rate * bclk_ratio (0 = use channels * sample_bits) */
+
 	/* parent platform/codec */
 	struct snd_soc_component *component;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2f370fda1266..1719ddcefa4b 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -116,10 +116,28 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	    dai->driver->ops->set_bclk_ratio)
 		ret = dai->driver->ops->set_bclk_ratio(dai, ratio);
 
+	if (!ret)
+		dai->bclk_ratio = ratio;
+
 	return soc_dai_ret(dai, ret);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
 
+/**
+ * snd_soc_dai_set_bclk_clk - set the BCLK clock for shared clock detection
+ * @dai: DAI
+ * @bclk: BCLK clock pointer (or NULL to clear)
+ *
+ * When multiple DAIs share the same physical BCLK (detected via
+ * clk_is_match()), the ASoC core will automatically constrain their
+ * hw_params so that the resulting BCLK rates are compatible.
+ */
+void snd_soc_dai_set_bclk_clk(struct snd_soc_dai *dai, struct clk *bclk)
+{
+	dai->bclk = bclk;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_clk);
+
 int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai;

-- 
2.54.0

