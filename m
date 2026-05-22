Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18A3E4C6C;
	Fri, 22 May 2026 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456945; cv=none; b=Mp+CtGJ0JNRE+rH7R82wo/ebY087jRi2ORpwqZZFUmh167kYKt7rWzTAcnd5urQNWuBo8ZFeED/xwsbjbtjEc2IC2V3Yc0zAN0SHMrLTVP0ZS8+RfU9pZtAV6j3oMoNoLiMOUw/kOjYxvESEZjKHtJfpW1BMHoRw8nipcm4M4Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456945; c=relaxed/simple;
	bh=HevkQyYoy3kiO1VrBKioDTilzos+sth9T5xZNgNnIUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JgNWfeSpQS70SYd/tuGSLWlNl+tu/Lwlh92umrSnV7rHP2UCBWXt3OLv2lyN9zOeaxFBnxOthY9nYzrX8FENGxLtIUeBkskfiSM8D9OupJTu6NKFuW74n1IUISXcubCX66nMUMYsmb9HGf9Sgp1gT93dQw3skm2NN+73p+qVsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=F2iauWZ6; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="F2iauWZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779456851;
	bh=AA/l8RpNRgQWhJKMhQO6AtegRn3p6g7Rx5XU5wAB/G8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=F2iauWZ6dwN7IOzBaJ8LcHm4UiQ2JyOYvJ/WdrGf9Y4LlwnhxVP5luua/qqSBC99L
	 MLVaVhMiPlB3dMKAp8Lui5OzmfVwB32Mgn8L3hAlB+wX0CbLmVqJbQha0iiOY9JrmN
	 uWPdvEbrYopmibRS7EbtHbN9flhTSobM7ICPP8Yk=
X-QQ-mid: zesmtpgz5t1779456843t72186e55
X-QQ-Originating-IP: HtiiAtny7Gj3pQY96fI+38eQMAm2J+SDcdT7dRq28k4=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:34:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9568325432404899100
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 22 May 2026 21:33:57 +0800
Subject: [PATCH v4 1/3] ASoC: soc-dai: add shared BCLK clock for cross-DAI
 rate constraints
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-i2s-same-blk-v4-1-a71a86faaa20@linux.spacemit.com>
References: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
In-Reply-To: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779456837; l=3103;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=HevkQyYoy3kiO1VrBKioDTilzos+sth9T5xZNgNnIUQ=;
 b=bJjkuyUf7OoZOlB6339r5wuFJ1/7Qg4nx+Vzb7ic6HD7rgfu5avURReJ3S/Qpn9RAVFt3nEnO
 wQaMahTPG39DpL6O0XaY3SoqQChMcMvlLVnFOBvBdMfOoO1pqhP1PeL
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OKhy7fcgXWEZn4ga0kf4NHu+4n02t8Pum455oBKJEsbaMhgR9Asj26Bf
	ZxSBRvyyVKwWKbws/FEf88cypXHr5d7LEXYXxY2jGvblGejSyqCXh5hCItwYCm02owsvcgO
	mxu0bUQ2NEY1ytfEPoyKWQT5RWSi6/9MXsH5J5aL5EuvgwNOub8J9XEzxkJtt1yBY3pJSfa
	tGirEgkRULhOqbzekgZD3di6Qi+/9GOunuR7O3FA9Z7v5yxEopIzKvEXn2eotB7N0vfphEz
	o6J7IZAMz9xDHS6r2xaLb3/WHZq+Pm201oNhcdcC/yo7PB1kUxVO4G7m2d/d/++WaaWDRli
	B8HORZ2octBXIPBCS9R8mfEmboFsRPocNTGtKOn6R04KwCuhhi4rujKbvPYqo9Mm3zO6W7y
	S4AoKbTIa/ZOItxUiBh0/VvUXUeZ7SmqChYbOQbEUbu4DzCluUWCIC+tqOtYbSFBqbcCBa7
	KggguqKHF+EOQYIoNUUa2pHSA/ZBxLqn63Kz/DxTFNYTSQwb4+H5n3iZ8Voyxxc0cTMer7c
	dgNy9UoBxlNnLEtvMJwGEhTg79s7VziKXBvNz2CQ6lbBReFPADcjvs3n8galO4VHn6rC/TI
	JQ044uCHo9+wvzyzhNz/jOAqnY8jemmH3Gy2J+ID5YaJCCQMqeSK+0EtgY1HNldJZWGdqXf
	8IoYlDlVE5kehIpjzxd0BkR8zFEEfkZWkk+YQTXLnJB/3uNury3PRLFSQ7MdSJ1Vg2AbNJa
	zV9nzwyB0TkS+RcPIhJaQhZjf5mjWFefDIT/UkBFmKluvfkwjrX5Xn6rBqatVHdL8x23bYM
	D8BSJLW3DPFyCdH00p6qexlnca+6jJ7s892xptZ1yfTu3b8X6ViUkrnm7fsB5/LJba9sPdu
	diQ9Qs9UbNayS5p39Kejigvy5zp/qGKmb2UsQ+D8pmqB+1VJ35vN7ec8aRLSNzHHhQk+Au3
	15JoW1sDZDtGVy2++yEqPxDXy9609KHYEJjR51ytfgNmmbwqaXPZN9Yf1Z08BFTb9zItBuz
	8IewVMaAyWAWx3RYL4aF/C7GvkosdNK3EH7vQBPaodNIGFgWv/ym3n309dV84U6F60oKGzb
	p5edv/p5/ZWJyoZpsB2S5EySZBH+Bwk087FcbR35tqraUbYyr+4rBjKPPrM6bqk3CCkUHBZ
	JDLJ9uVIVmVbKGwcg9a8UMIjzg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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

