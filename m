Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655277;
	b=XVIChr8CE8Db2sz73EEtrHkdTyOoOPZfLgN5hmaz7c26ubZuVKLw1VKeJggZAO+17Sbd
	 fR6uP2TFPEU1rI45rhhmnNOym0vutSzpKmfO286PBnEVKP2QQrW5jlCNPUoFzxFGPJMoD
	 Q7oX2jwUw2IytIB1c1VuCc/aAJ52QPcrKSCBd6qF7swLFDYfC5gfUPT6Vrnuse0LWdJJ5
	 uPi5n3KAqWoiY/bwXoAXy3w/YoPVsrFlmY71md4Unn2q5ZR73VXE4RJdxzS+Rdzz0cTIc
	 v/0D8KZMx4TypN8/rjA8658L6OcT10dmz0kDDvwXZ7fFGoKmJKwHTkaCheujYDenITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655277;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=n3J3YrLFW0EvvD79kLyVZJtIz4g8V7gB1hWgV4b+zRI=;
	b=b/2ikOEj34Ya+dtGYi72EGvCooQ8jQxooKsvaUqklK5pWgI9ODlUmIRpXYraCtpo1UPw
	 F83kHhKQL+Hqok07JEPdoHU+GL6pLAUyXiCrlN3t2s/W7VcuZh7z0v9oNQLVl/TpnaR4d
	 ethgXAEcsICSa8ttWvkcUUp0RzRCfR3Au0AmD/gwg3TdgBTtP02OYnUEXfUlLCCR/FTYw
	 uiUiQlhkbEGU0elAazoARSrg9z+4r/TXx2PA0G0Zo7GpnW6qmuXhd8qLnajeTk81B2xz5
	 RlUA94RK6EGjlkTQAmG8ttNpaySh2BtRRje1pUS1BrezQeSiXwUVjQFkPVu+PS1tV3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Rb3LPEzx;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF19606A320
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCF19606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Rb3LPEzx
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261022074755euoutp02cc12ec11e1d9208b1aefdbf5b0c98a7b~gynmjGmhU1371813718euoutp02T
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 07:47:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261022074755euoutp02cc12ec11e1d9208b1aefdbf5b0c98a7b~gynmjGmhU1371813718euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792655275;
	bh=n3J3YrLFW0EvvD79kLyVZJtIz4g8V7gB1hWgV4b+zRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rb3LPEzxRp8lg/D7rw+sD/dTxTOB8ya2Do7FXl9rUjD/I31A0DHx94ZlJtDcimMIE
	 XzfnK6OPVMtCMuzaGoMkYoDTh67xnNIAa2qf+WnuGezBDVsEulZFEzCXT4JlrnmHZP
	 ko3kRRP1Mw62IhlKMUZA4BjsS7swqLTfyi8R+2tc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074754eucas1p26236204e3f0744b6f55d0fa7ad0a76b7~gynmG_sE22511225112eucas1p2b;
	Thu, 22 Oct 2026 07:47:54 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261022074754eusmtip2d0b17a117fd70ccdfec8e7f39267bd9c~gynlrc6YH0697506975eusmtip2q;
	Thu, 22 Oct 2026 07:47:54 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Artur Weber
	<aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 4/4] ASoC: samsung: midas_wm1811: run FLL1 at the AIF1
 configured rate when idle
Date: Thu, 22 Oct 2026 09:47:42 +0200
Message-ID: <20261022074743.625223-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022074743.625223-1-m.szyprowski@samsung.com>
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
X-CMS-MailID: 20261022074754eucas1p26236204e3f0744b6f55d0fa7ad0a76b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022074754eucas1p26236204e3f0744b6f55d0fa7ad0a76b7
X-EPHeader: CA
X-CMS-RootMailID: 20261022074754eucas1p26236204e3f0744b6f55d0fa7ad0a76b7
References: <20261022074743.625223-1-m.szyprowski@samsung.com>
	<CGME20261022074754eucas1p26236204e3f0744b6f55d0fa7ad0a76b7@eucas1p2.samsung.com>

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
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
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

