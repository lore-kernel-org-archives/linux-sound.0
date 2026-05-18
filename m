Received: from smtp-usa2.onexmail.com (smtp-usa2.onexmail.com [35.173.142.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A63E00BA;
	Mon, 18 May 2026 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.173.142.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085385; cv=none; b=KtUFAJVN7lYSCHm8kwvwiWKFReNx1u0K3fmYuLOzUzWypinN0S6twMhRER+6vuXjBQSW4Vaz4N/y4nDyDOyYcPyYG3ydqFJIctXdH9F2zuPdgLmuFjlN20Z1QoGeTxevETLENHdZA9xPu86ufyDLBl/fTxiZK0cuTGNMANtiJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085385; c=relaxed/simple;
	bh=HevkQyYoy3kiO1VrBKioDTilzos+sth9T5xZNgNnIUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgQrDrL+rGIKTOe0YDZ+B75ukprL8VspIb0ECHCoEk7p+S9hMk7i/bF+qvE1NU51yEB3hvzGhzDOseqpv16ZwDcH1XJkM1NmSfqTjj1PaiV1LH0MzIRu99SiYFx0RYcZXApztms7bmNiu/t2K/hH5kwC4eJ4ZGPdRRf0fdWabs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PTI6OXlx; arc=none smtp.client-ip=35.173.142.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PTI6OXlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779085285;
	bh=AA/l8RpNRgQWhJKMhQO6AtegRn3p6g7Rx5XU5wAB/G8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=PTI6OXlxOVP/3sYqdbM3gO4oc3QBMQ4uArvE+og9Q5gOpOly7j699peydJxgUoD6I
	 rkooglGYvDleFuGRTsK1IEO3QDKjyxjHcIuX64mwlwxdIoKndBKM0Os6NUi3OvdTl6
	 W9TFSyC0HgpHDyhz2usRfXBD295Z11+ifWuDJesg=
X-QQ-mid: zesmtpsz4t1779085276tbc16854b
X-QQ-Originating-IP: XUOY8olp5tWvrlcinXAzUJujrciY5GNrZ0gVtvOuPtE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 14:21:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11071802599520518211
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 18 May 2026 14:21:08 +0800
Subject: [PATCH v3 1/2] ASoC: soc-dai: add shared BCLK clock for cross-DAI
 rate constraints
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-i2s-same-blk-v3-1-2ba1c4f41db9@linux.spacemit.com>
References: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
In-Reply-To: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779085269; l=3103;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=HevkQyYoy3kiO1VrBKioDTilzos+sth9T5xZNgNnIUQ=;
 b=0IB0x7GcAP8a0HCvrjlANPcpstzssXGwMcptOr/ixP8/iqljPrvm5R9iiLtsY0xva1rIR+QHl
 GjCdwcuPFwRA94tJJpBskjKkVIyWsS/R/arkgsbaUbChGsLsZMa+fJ7
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M0cNKL/w7T3m97YO+J8aR9iEEYv19JCfUV5XuTDHb8c0A7YRLceqnzcL
	Xfw4at0nWZIPK2Dfp+u34yVRCYgjkC3/Jn5hb2CChO07oary3M2pEE+6H2rWwhzoL/r0xxM
	cZ4TTR1qupZlPEmfZIq9GbFd+PsfCC0izVUUv4sYZlYVC43nfZfz/6txdWRUPh3C7IqUlD4
	zF6RkaJi0O4FaDMbIAkbLttO3nSVOr42H2c0i7exbbvS2vS6s531YcMjEib/0e2x+Ntwn2D
	AEknCNMpVxncOJqm9EoHTofi7hRNs9/BhZXwpb7iaV+4dH4AqTYkW+K5bhYx27Wnpreo0fw
	xawWbiVQTBXk3/YWRjQyrtQXl7+LlGyNjraDuwYg/y3mmoL9k7O69gIp7dY7bjKNzWJlmh4
	MH4PU38NIsW5+wvpiOkaCD8B8Swv7Qmv43Uwu05JvOIYrnrFPRL02U4nyxb6s2BlsY4i4aj
	oOs0J4It90ANPRlpVJcqHnXhVLki52DBIkr+T90FtC3sldyRjERpFgAaOk7WumsH+CywLSf
	i8MY7UJW5xfKVCSrakmmHdMEl2r4MN2ZPfCc0DO7DX2QjU0sO56/UDmYY3LN6IwIKYI/ewJ
	PEPwFcQ494Kp6flUWdyjPwtKRUg4TQnM9pMoULRNrnkH6I7metMxV5tzh7xULXzb2rkuc1J
	v92vtjqkOG7qhJhJOl/sOtMyfTyDqKlbniPJ7h6Z//6VU5BTW80T9Fi4DCXnS4EjgCp3D6f
	TZRWzjOXz99hUBqQaMC9Fy4oAdIuhKHufPQ79oPJ1mWJ26CAnN4XY86qzqO0ve8mE0+i4Ij
	yhvqWApWNAYec+sPpcMHLGlCCndnfsyX9XkxZMeUQ/Nsk48FP0aIKvr+etm47dvy7EqpxDV
	vDMXzmWhh+vab216EK7NJIXnGhz1HaxVCU7XiqY81AVP4S5qLDTQcVEWubxtgh+dfGajKVl
	uFpr4vOBd3Rtyr2fG3+XCWAMja1Zwao2VQt3ya9pchSrZUsbmQzS4iIHX0IuuFNQ9M9dMoI
	KtEk79u8hIOfWZlgHE1dfpSTYrFX4SQ8lo9RF38zNRr5tnv/B2rq5e0clpCCP+cqUliJXhb
	kD+gWGdK3N1O0kTdGIg2CDbia/LYrTWdu8nSdJk89mqvytPAvff0XjjqjLqiF06JQBZYOiZ
	WHyr
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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

