Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B0F3B2D10
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717798; cv=none; b=jMi0B+V4ZV6QHOphZcVsSXDFYU8nmoi961oPVjRhAvcD7suCrRme2K5GrOr1Zun1Vyk36jq9MtOF7hg8iK3J6ZMP8AWNhvE+HnNiKYsin8kRrHywWJbp0ha03r7r/7y0bfwZvPa7ePOetJS4P7zfH+j75H88lDKvNNJ0C6AUyOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717798; c=relaxed/simple;
	bh=KLOO+A+1/5XLck9wFIUskRNAYu38bZZV9QraigMfjJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaPPHRk0XSzK1Hee5Cdsxc/iAjtiz+QYrQ+qj9RrdwolAn6I5APS6f+fr5ux31crPh/LTUP1BMul/XpGq9yviBIu0jfPYF5iimNznVU/OXYhjk5cKnv4RVuo2jYM9ExQCR/5/uqkU9e0rZ6FKSuNnYQ8GCCqFcsBN4dB+1Em6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EDVQs9CJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EDVQs9CJ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-470174001a0so868096f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 14:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783717795; x=1784322595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJ4cp+Dez60Lk/0/twpxfAxM2T1ZemRxFXgI3U5E6xA=;
        b=EDVQs9CJl5S5T70WVvBOkAxOlh8gR8dX4JraJXazpLob09KEpHSB/I+aEGUnYD5alw
         +QjNpSEbmmxSzbjvVIEPuTv8b6WwFHXCGAuvCwFdpVavF7/IhxtGjgzkQZjkp0eKvk34
         FO4yGnVxoqaEFRk7ofqujNCr9yzQYD8x8/FnBKHryXvUjtBNB8Sa0vw0KzalZVnpAv5p
         XW7D0DxZUqqK+bavwt9tun3a6fMLtq16i27zXmCflmAIEDHj3T99r8Jve0pjsNvIEmAU
         Sozqs2avfXXxSfwXam5BC3vPT+0LfYydPKjHZf7ch+dnF0+58yvwYSD+3mwQOkiSZYpL
         YnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717795; x=1784322595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJ4cp+Dez60Lk/0/twpxfAxM2T1ZemRxFXgI3U5E6xA=;
        b=HVemHrg7thK3PLlvyy/soQ+Or5eQ7E1iBfJfxP7sHu7b6q6UAzWZm0AyzSR+pciM5F
         UKqgPlhd/u4g9z1YEDz6UCXat1Qixrs9eksm11lQK8wyo8KIyyk6cBYrNUto7m/kF7hl
         Ds11iqujH2bEfP8D7UVNantLdnefaVV/2/cx0MPYmVowUJjHWSi5ArhDsweaS77EQrvM
         pP5UIf/JQDvCJj7r8f5+MzA95WsyqZGdDnYRwIsVzEHscNsvRehcYYaw6voNA130tKAC
         ooIJPc1ftwmJb7TCQK1tZOO/oVcFPshe6o9zy1spi4lv7EV84JEsmbsZuOyOuY6kwPt+
         YWtg==
X-Gm-Message-State: AOJu0YzduoBARzHGjFW1/I616hOHmS+pEoaTUiSVo92PzGoIjlrQv698
	6ATZr10quUFjJGIzM0Tuzp0IeXsleO3VY2XNQbUQEHh6yfVNVpwl7n1I6e9PbbNY0Ao=
X-Gm-Gg: AfdE7cn+nYKx2mabWs3FAHYJaq5NI1ye9D6w/+lXEHPaOL1ByDU8qn/KrHhnHed5zoC
	4LrhvFVpd+McsDcunYaz3gnCF3LJ2k8tZZiXbwEKdGBD/++mqXLJH7Lm3tkK0+uF1sahkKdQyBl
	mNkend+tRCyVrvalV1yYht359rav2AsFFyBl6eZVSH9UyuqnC+V32DkVEubVLi0fZ2xsQYgYdrP
	Gy9cLaR69XKgZh5xvNZCh99NWfEp2OayMrtFJ2BC4/frPIfBOjbOrRaDje4yPR62B2tCmotOgPv
	z0qeEnCxMrGFO2GmLnTgnAMI5Sx1iPAru3n7VWwrd0PRaGnLiJiguuxxDI+uEgtW9D1ktdnMGvH
	z0iWg+zljhopMrnzEOCDpK4jAeztQ/EMW8aTcoVbil+uxX/fmgIx32KJjdsBeICDbVc5KlWaHIa
	TfB7+/ug9eRA==
X-Received: by 2002:a05:6000:25fe:b0:475:5e4b:588e with SMTP id ffacd0b85a97d-47f2dc9bf45mr393022f8f.20.1783717795139;
        Fri, 10 Jul 2026 14:09:55 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm64274135f8f.22.2026.07.10.14.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:54 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 10 Jul 2026 23:09:51 +0200
Subject: [PATCH 3/3] ASoC: meson: aiu-encoder-i2s: use the core
 symmetric_rate handling
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-aiu-improve-quirk-check-v1-3-2fdd1b6f8896@baylibre.com>
References: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
In-Reply-To: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=KLOO+A+1/5XLck9wFIUskRNAYu38bZZV9QraigMfjJc=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmB8fMqPrE8nRhfP30LO/vfSM6k6H9Wd/a1p3H6RzIu9
 vv7+MuEjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEyEX4fhn2KGWnPtrGvbgg+5
 /879806yOteupubvqj8RZ5dPXFH0bA0jw0MB3nTWTR/lv4i80mewK3trLxL4/eBbtb2HtG397W6
 +5QQA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

The driver manually implement the interface-wide rate symmetry enforcement
in hw_params(), which suffers from the same problem addressed in the
previous patch: the restriction is not visible in the hw parameter
constraints, so a stream with a mismatching rate only finds out via
-EINVAL late in the stream setup.

The ASoC core already provides this feature through the DAI's
'symmetric_rate' flag: when another stream of the DAI is active,
soc_pcm_apply_symmetry() constrains the rate at open time so the
restriction shows up during parameter refinement, and
soc_pcm_params_symmetry() still rejects a mismatch at hw_params()
time as a backstop.

Set 'symmetric_rate' on the I2S encoder DAI and drop the open-coded
check along with the now unused 'rate' member of struct gx_iface.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 21 ++-------------------
 sound/soc/meson/aiu.c             |  1 +
 sound/soc/meson/gx-interface.h    |  3 ---
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 4c62ea41d7e8..58dce9f08c9d 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -179,28 +179,14 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
-	struct gx_iface *iface = ts->iface;
 	int ret;
 
-	/*
-	 * Enforce interface wide rate symmetry only if there is more than
-	 * 1 stream active.
-	 */
-	if (snd_soc_dai_active(dai) > 1) {
-		if (iface->rate && iface->rate != params_rate(params)) {
-			dev_err(dai->dev, "can't set iface rate (%d != %d)\n",
-				iface->rate, params_rate(params));
-			return -EINVAL;
-		}
-	}
-
 	ret = aiu_encoder_i2s_set_clocks(substream, params, dai);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
 		return ret;
 	}
 
-	iface->rate = params_rate(params);
 	ts->physical_width = params_physical_width(params);
 	ts->width = params_width(params);
 	ts->channels = params_channels(params);
@@ -233,17 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
-	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 
 	/*
 	 * If this is the last substream being closed then disable the i2s
-	 * clock divider and clear 'iface->rate'.
+	 * clock divider.
 	 */
-	if (snd_soc_dai_active(dai) <= 1) {
+	if (snd_soc_dai_active(dai) <= 1)
 		aiu_encoder_i2s_divider_enable(component, 0);
-		iface->rate = 0;
-	}
 
 	if (ts->clk_enabled) {
 		clk_disable_unprepare(ts->iface->mclk);
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 64ace4d25d92..2668646e3597 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -154,6 +154,7 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.formats = AIU_FORMATS,
 		},
 		.ops = &aiu_encoder_i2s_dai_ops,
+		.symmetric_rate = 1,
 	},
 	[CPU_SPDIF_ENCODER] = {
 		.name = "SPDIF Encoder",
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index d9ab894589fa..2a6207e393e8 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -19,9 +19,6 @@ struct gx_iface {
 
 	/* format is common to all the DAIs of the iface */
 	unsigned int fmt;
-
-	/* For component wide symmetry */
-	int rate;
 };
 
 struct gx_stream {

-- 
2.47.3

