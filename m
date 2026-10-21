Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577907;
	b=M29bVQYOTFUjpEDdrVcCYgbp8VFoad/vPlDV6gZf5SYZr7PBwRtqtafWbi0xKS4r6Id4
	 E69YHUdJpgwXHc7kcHSHn+xGxaQ6i4+v/7M5rofH3kcG6g6JJh2nAtjrw7O9tGkwch3Fi
	 xjunaaNwD8c1UudIlM+e8dpND0krO7Tw+oBitldjnYitPfiznE6bkrc9KrEFvt5E/ObGU
	 MR/9Vcy/rg3oqyXw7dN7h6VIWXgHCg7aN82kpYS4AGA2+7Cug2ND5zFyqk43C8qcPPaJZ
	 0AvuzITHR31zK8dBeMDkzjHJ8Fm3GD50g1xy1sTP5gxDCHBHvcM0pH6s5FJKUa2gEew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577907;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=Si69uAnOSsIPiWfEPPA3kwJnSCAZCAQ79NA5fWfnm+4=;
	b=p+f/dk+dfphlNhXqxi0TD3kIY5xiR0gcq9kUEciTN5U88aETvp/y/kifF8bsdHuS2MFy
	 ZPP8Sf4JyDDC/Tn/Z/zbENmlXGA7K6mtUM9Qjbo1s1wOP06fiPDGPPm0eDFKiAjMM/MBZ
	 Z5eaItj5aMkMsChz9PkGLMeL77IvfJ5hXMCWaL9hDGVUPbZO4HRRenn9UYpDLg0d3bf8g
	 nk7OR2PBQPe5e5QsijU2hvLcchtXaN/3dUjmCcBD7SbkxMumPoFRDbU4/v3GWFMfxr3n+
	 L0at+4+50x1YBsRODm4HpikKuV3vRaG/gfbYKywSJtxY1vuwD7zHlTyQ/wpnORGtgmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AJvCFAln;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D70606A320
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D70606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AJvCFAln
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261021101818euoutp01b5f9317b6be5582e977b02d9d8c27734~ghBn9eZ1p1013310133euoutp01i
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 10:18:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261021101818euoutp01b5f9317b6be5582e977b02d9d8c27734~ghBn9eZ1p1013310133euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792577898;
	bh=Si69uAnOSsIPiWfEPPA3kwJnSCAZCAQ79NA5fWfnm+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AJvCFAlnEtPRnW4cTwpJbHzTzoeUlvT+eWpv6kJRzfcqYAxYgQifh11yoC/xKGhUG
	 uzxCn1sK0BZ0aoyofC6kXFCkyKSg8y0tLZ/d64ynAAXDinO22G+DRpyeSIjt5JOWZz
	 /Nng8LY0cxcbo8q7wRARXPr366d+hIR7s4s5Ta5Q=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261021101818eucas1p134e97fde95718540efe6e74639380fe9~ghBnQq9Zx3268432684eucas1p1L;
	Wed, 21 Oct 2026 10:18:18 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261021101817eusmtip20649c3fb9e4367552caa10abd14ea849~ghBmxcqLF0469204692eusmtip2g;
	Wed, 21 Oct 2026 10:18:17 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Simon Shields <simon@lineageos.org>,
	Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ASoC: samsung: midas_wm1811: run FLL1 at the AIF1
 configured rate when idle
Date: Wed, 21 Oct 2026 12:17:45 +0200
Message-ID: <20261021101750.3297770-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021101750.3297770-1-m.szyprowski@samsung.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261021101818eucas1p134e97fde95718540efe6e74639380fe9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261021101818eucas1p134e97fde95718540efe6e74639380fe9
X-EPHeader: CA
X-CMS-RootMailID: 20261021101818eucas1p134e97fde95718540efe6e74639380fe9
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
	<CGME20261021101818eucas1p134e97fde95718540efe6e74639380fe9@eucas1p1.samsung.com>

When the codec is brought up without an active stream, for example
because the mixer state restored by alsactl powers up a digital path,
midas_start_fll1() sets FLL1 to the default 11.2896MHz rate. The
codec's AIF1 however keeps the configuration of the last stream, or its
reset default of 48kHz at 256fs before the first stream, which needs
a 12.288MHz AIF1 clock. The digital paths then run with AIF1 clocked
at a rate not matching its configuration.

Remember the FLL1 rate requested by the last hw_params() call, which
matches the AIF1 configuration kept in the codec, and use it when no
specific rate is requested. Change the default rate used before the
first stream to 12.288MHz, matching the codec's default AIF1
configuration.

Fixes: fd0ea9cd9698 ("ASoC: samsung: Add sound support for Midas boards")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 sound/soc/samsung/midas_wm1811.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index d43af5069baf..11466dd3539e 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -25,7 +25,8 @@
  */
 #define MCLK1_RATE 24000000U
 #define MCLK2_RATE 32768U
-#define DEFAULT_FLL1_RATE 11289600U
+/* Matches the codec's default AIF1 configuration: 48kHz, 256fs */
+#define DEFAULT_FLL1_RATE 12288000U
 
 struct midas_priv {
 	struct gpio_desc *gpio_fm_sel;
@@ -34,6 +35,7 @@ struct midas_priv {
 	struct gpio_desc *gpio_headset_key;
 	struct iio_channel *adc_headset_detect;
 	unsigned int fll1_rate;
+	unsigned int aif1clk_rate;
 
 	struct snd_soc_jack headset_jack;
 };
@@ -171,11 +173,12 @@ static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
 	if (!rate)
 		rate = priv->fll1_rate;
 	/*
-	 * If no new rate is requested, set FLL1 to a sane default for jack
-	 * detection.
+	 * If no new rate is requested, set FLL1 to the rate the codec's AIF1
+	 * is currently configured for, as its digital paths can be powered
+	 * up without an active stream.
 	 */
 	if (!rate)
-		rate = DEFAULT_FLL1_RATE;
+		rate = priv->aif1clk_rate ?: DEFAULT_FLL1_RATE;
 
 	if (rate != priv->fll1_rate && priv->fll1_rate) {
 		/* while reconfiguring, switch to MCLK2 for SYSCLK */
@@ -241,6 +244,7 @@ static int midas_aif1_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct midas_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int pll_out;
 
 	/* AIF1CLK should be at least 3MHz for "optimal performance" */
@@ -249,6 +253,8 @@ static int midas_aif1_hw_params(struct snd_pcm_substream *substream,
 	else
 		pll_out = params_rate(params) * 256;
 
+	priv->aif1clk_rate = pll_out;
+
 	return midas_start_fll1(rtd, pll_out);
 }
 
-- 
2.43.0

