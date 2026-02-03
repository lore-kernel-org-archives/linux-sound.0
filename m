Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605383D3CEE;
	Tue,  3 Feb 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137201; cv=none; b=q3R1CQwAnfaACGThJ+HNw+OJZLQ+hOUX46vP7BPywEHbihx2HxeyF8T/AeYz5Yke9p02OuL/OOkY9r187UIpABa4lNZjkvqkNYlNLpZzc45FwLo5ru0L6l8s4zVVuPrfe622MKsKTRNzwZiMnvzd7fZ9Fng7DPUpmQrAeu4pdTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137201; c=relaxed/simple;
	bh=pi4TI7H4itbep8bOjPNJrdS5hAS2gdaa+bre7RTmdIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SmxfGsxlN+6eyW6bIsz9dwOxXaUAeyvj8ly283K4aKs5jbrJhPzm7Vmf/qQYBS8ZMvuE2tUbaTsGaYgxme3C3MeJNnVblcIbL64w3YnefGuqtyaxwyJT2g/9moVLL77zGXHdq7v3bQiICJbNVJ9Y3R9YDW8VMQpDIHet+bEe8+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hcBdW37A; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hcBdW37A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137195;
	bh=pi4TI7H4itbep8bOjPNJrdS5hAS2gdaa+bre7RTmdIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hcBdW37AA1exy5Hk8RiwjgF6LlTMaRjAvHBG8mXHz5BuUQff+Kv8U6LoJa4c2A9dq
	 IYFDc47LIIbndj7cp+brSh4wl0CTfzHZQLLp0QGx6K5rwmFD+cGyaViIC2qRbGPwP3
	 wFfJG8RWYyJQN+zshsim19kuSW2rIwAeJm9FbQJBHC9wagCu2CzBjK/eQh7oMJ+uG4
	 Ga4Bud760RTgZX7GmhDdeGMmxkw7c4HFqlvYG0/HDMmRwMJUIoYz+XdTww54U4Xqvu
	 9X/lynHkStcWiH+kJo8hkwUeTQ/GZ/Ui09wBhi/7Wnat9JHw6sphCGqU9s3Tyh80C6
	 aut0OlbclfVOg==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5A4517E1516;
	Tue,  3 Feb 2026 17:46:34 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 199AB48002C; Tue, 03 Feb 2026 17:46:34 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 17:46:29 +0100
Subject: [PATCH v2 07/10] ASoC: rockchip: spdif: Add support for set mclk
 rate
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-7-4412016cf577@collabora.com>
References: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
In-Reply-To: <20260203-rockchip-spdif-cleanup-and-bsp-sync-v2-0-4412016cf577@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sjoerd Simons <sjoerd.simons@collabora.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=JfQt8iv01h3jUyWNHVEds69H5a+SlC3Qy6aZ/D87xHQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCJmnlOWtXPSUXVegwfbJ81P++b3bpPfk2z
 SfDgcFZ4gt68okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgiZpAAoJENju1/PI
 O/qaUbcP/jgzoVaKshqu3HLYM5MxNG8+T+vHpkI5z9RB5Ad5zErTRd8/a0x9z0O5p9Sa8Q5Fs5S
 MNml+Mcym/KXzSexxpGivxNl7HOjQVisqIBALZAiGACxAyWzjMhWt9kkduXApbNFh6ekpM8b7r1
 NdGTZFvdSSCEbOUXi7o/nVJsVTN2LGj0kDut/xt2YPE+kAIf79SIu47yoB2ee5tZ8HtMS4aFskf
 b+kPgMUW3vxxlg9+J6ND7XVV088AJD/Nkd1Xv/dIvyLhdTzMdlOwIhtLagXt6H0vWnRtpchJXpz
 tGzBavpyOjufaq1uqWOLtkF0jE6dvvB9nc3ACLItZGp6USjC6yF/W6hSkOnFPdnWjuK7ODxUr8c
 FdnEm2C1+XZk3FnsvXZqSMUf4y1jS4zZOMD0Uo4d17OHIsoxQHKr5bRkfgN/8NMN6kVEcrMIYB3
 /03W5lirAghbRThjZBaPY9Fc1oDFjnN2cRJ1u9o3yb/VaOT1WW9MDxcgoJomxyVEG+BSAcEx9mO
 HxcQVwUtZm0uAp6zOWOtZnQOttgNkzHDsHQB5ImO3Qc1mH8aVnP177WSdFn6jXbOEQ4Wg6gJfhr
 GcnCUgB51JvILOYXl0hXW21DmuVY2vUngcbs4CDwAfzQt7ieZmCe0yTDElU7rpNMW/6nq4bmcMZ
 Kjuky7USlTIDm1Z91w28wbw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Sugar Zhang <sugar.zhang@rock-chips.com>

Allow setting the mclk rate from the machine driver.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 34 +++++++++++++++++++++++-----------
 sound/soc/rockchip/rockchip_spdif.h |  2 +-
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index c1221ff00ed7..3b66d97f0582 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -86,12 +86,15 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
+	unsigned int mclk_rate = clk_get_rate(spdif->mclk);
 	unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
-	int srate, mclk;
+	int bmc, div;
 	int ret;
 
-	srate = params_rate(params);
-	mclk = srate * 128;
+	/* bmc = 128fs */
+	bmc = 128 * params_rate(params);
+	div = DIV_ROUND_CLOSEST(mclk_rate, bmc);
+	val |= SPDIF_CFGR_CLK_DIV(div);
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
@@ -107,14 +110,6 @@ static int rk_spdif_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	/* Set clock and calculate divider */
-	ret = clk_set_rate(spdif->mclk, mclk);
-	if (ret != 0) {
-		dev_err(spdif->dev, "Failed to set module clock rate: %d\n",
-			ret);
-		return ret;
-	}
-
 	ret = regmap_update_bits(spdif->regmap, SPDIF_CFGR,
 				 SPDIF_CFGR_CLK_DIV_MASK |
 				 SPDIF_CFGR_HALFWORD_ENABLE |
@@ -177,7 +172,24 @@ static int rk_spdif_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static int rk_spdif_set_sysclk(struct snd_soc_dai *dai,
+			       int clk_id, unsigned int freq, int dir)
+{
+	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	if (!freq)
+		return 0;
+
+	ret = clk_set_rate(spdif->mclk, freq);
+	if (ret)
+		dev_err(spdif->dev, "Failed to set mclk: %d\n", ret);
+
+	return ret;
+}
+
 static const struct snd_soc_dai_ops rk_spdif_dai_ops = {
+	.set_sysclk = rk_spdif_set_sysclk,
 	.probe = rk_spdif_dai_probe,
 	.hw_params = rk_spdif_hw_params,
 	.trigger = rk_spdif_trigger,
diff --git a/sound/soc/rockchip/rockchip_spdif.h b/sound/soc/rockchip/rockchip_spdif.h
index d8be9aae5b19..fcc28b6c4f58 100644
--- a/sound/soc/rockchip/rockchip_spdif.h
+++ b/sound/soc/rockchip/rockchip_spdif.h
@@ -15,7 +15,7 @@
 */
 #define SPDIF_CFGR_CLK_DIV_SHIFT	(16)
 #define SPDIF_CFGR_CLK_DIV_MASK		(0xff << SPDIF_CFGR_CLK_DIV_SHIFT)
-#define SPDIF_CFGR_CLK_DIV(x)		(x << SPDIF_CFGR_CLK_DIV_SHIFT)
+#define SPDIF_CFGR_CLK_DIV(x)		((x-1) << SPDIF_CFGR_CLK_DIV_SHIFT)
 
 #define SPDIF_CFGR_HALFWORD_SHIFT	2
 #define SPDIF_CFGR_HALFWORD_DISABLE	(0 << SPDIF_CFGR_HALFWORD_SHIFT)

-- 
2.51.0

