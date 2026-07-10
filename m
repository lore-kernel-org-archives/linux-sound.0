Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94383537D0
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717798; cv=none; b=cUCHLi/19GjQY4aL6q4Z8jeu8Ss0Bv0PWlB+eWVGn9YQRIHBf+XVTsFeuc2nyH+gBVamNO+6WU403nd0zmXiNcJk6mQ6x6k8hT6dKEdV92+biyhCGQDwSge5fHetdP3QDh698CBCzd1zDk4vn+2kKoPFFxqsWBXd2VHDchJFBwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717798; c=relaxed/simple;
	bh=KeFdEWnIy0h8OsuDM6nXoQiK/x/W2mOvEHTnodUTR0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMT4HglDdCRW1Y8QukdVtw4YXJyeYrxZ2D8pziR8p8WOlX5VzsfJ1L5XmNN+aw2+Fb1vDfwrdHs9kM6+D6k9/e2Tl+Ld7xwFRmYWRpta+lBmxL4mojePJGtiGBbourK0F5ydTdvweA4I1KU6dO3JCo1llgDIkLOBHWyIZHxLVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j/wW0YzD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j/wW0YzD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-475417f010dso668177f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 14:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783717793; x=1784322593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rM5i69OmbRE0VBFYqnP7QagSMyMP9rPVK7lS65VX9Y=;
        b=j/wW0YzDzWIbZpJzbSttie0EX7TdlHLQ/n7xoTrkt/i10HbpbySe5n9DQr25ifLH1x
         QqV5sJ1r1+fyAdGvPHoS9xUHqE3jbxjDnq2fFUwovGe0parkybUI1RCrINPflvcxhjYk
         eoM/EEoBYSLxPM5RLI7yyNC7g6wPjm1noroa3tnyZGJeZdk8sUoEAq21waJQQv7r/6JG
         zuAlEKAbbiJiijNM8dbb2ZOwbxi4FHBAE9jjrl3JeOmxHwvo/POrTWAlb+30GrfiyBHJ
         /zJp8WdAlzpHuRWx4pT3C9wqOk2CYAJWxOliq0iVv1iXSutQQOBVBF/TMdT7d4q1hZRF
         2Fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717793; x=1784322593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rM5i69OmbRE0VBFYqnP7QagSMyMP9rPVK7lS65VX9Y=;
        b=S57VBlNegmBOfrPdn00ZeN7s6BIS1kGhcoOfBQBaQxJkJNS9ckOsYRJj/uI4cJEO2p
         vyS9lTDsrmFVUnE2AzfIe8XOz3qulGYBsysKmJjCqzxkZf6wam6JF6QWn6OfdQNJCkVP
         quuY3xyJY4jtAVi1FlFF6kAtdFSEz3RpPsKdBKsdX/XBoCsCUOJllYUWfP1jRZzneMRI
         7/xhdn4+Q0QRD8H45jXX7nrNIbI0I13nPb9V8ehDMW0l+SZCgyGPcBAftFEqvWC+MxTz
         CX4OagUKrxvejZ/w8rYRU6Vg8QRhI1uadGkynVzJdM7ekoXQOE2Jf0i0ABWEZxWL+cCt
         B4IA==
X-Gm-Message-State: AOJu0YxbyWTKhaPy438TAtYbsCgL2IkKDPeB6ZINR6mDLe69/LP3HdkO
	2P4HUFI03Umi3hd4NU3TfQ8mPKFW3BYRaijgE3+K8LGcmGyKp59WUvfU22miei36wQc=
X-Gm-Gg: AfdE7cn2rH8mZKbOHvcPk9GGvrivzkRMxGU6RqQlWRQL8pn8fsLLtI1pxzY7IEl9THR
	emN3VpZE2wdwTHJ0v0jjnOG/ctxOf9GIUTeCPRtnvEiWe1WZ/gV18jF/YUDkgogavLfNUqZCOPL
	2p3aiIioSz998IcBmBM5LU/LAyjiRHH5suJiv8h3sFfic1X3zOIi1SvH0n551zGF8q7yiu0yKzH
	l2V6o0+IzpmoaF1gHmP7fxieJ0Zgx8kBhlpnkJt6rBghlBHlZgBB1V794aak755fBrY9WHsBhbj
	d6huRcomDKx/q3hLUWsqzaJKshAolACrkkBoOSYbVO94aoB4fhJKC6YCDSQnrBN/GdmwiutYtbV
	beofV1gOXw1dm5mBxKofg3XKvoX8O3PZZWSaorVngmE8HXlVMVklDUMwysZIekvh8feIH3g9wWU
	N73vRXxa5l1A==
X-Received: by 2002:a05:6000:288c:b0:473:53b7:e390 with SMTP id ffacd0b85a97d-47f2dcac225mr411001f8f.11.1783717793050;
        Fri, 10 Jul 2026 14:09:53 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm64274135f8f.22.2026.07.10.14.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:52 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 10 Jul 2026 23:09:49 +0200
Subject: [PATCH 1/3] ASoC: meson: aiu-encoder-i2s: fix bs quirk
 incompatibility check
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-aiu-improve-quirk-check-v1-1-2fdd1b6f8896@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6429; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=KeFdEWnIy0h8OsuDM6nXoQiK/x/W2mOvEHTnodUTR0c=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmB8fN2th759Djs0mG3ipCVesvS+pLCPwg3Hr+VGf2/R
 KJ9lfGyjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzk5jmG/+ncWsvX27E90JbW
 upE2dYcgV+1yEcfHj+/HnGEQ/9i+8S3DPy1DZiHu+QwLVlW41GZmG7g9yu48NuGd5vKXJ9qP3/f
 6wg4A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

The bs-quirk incompatibility check has two flaws:

- It only rejects one direction of the mismatch. A stream that does
  not require the quirk is rejected while a quirked stream is active,
  but the opposite is not true: a stream requiring the quirk passes
  the check while a non-quirked stream is active, silently
  reprogramming the shared mclk/bclk divider with the 50% increase
  and corrupting the output of the running stream.

- 'bs_quirk' is only cleared in hw_free() when the last substream
  closes, but userspace may legally stop/reconfigure/start the stream
  without an intervening hw_free. Reconfiguring a single stream
  from the quirked configuration (8ch/16-bit) to one that does not
  need the quirk therefore fails with -EINVAL due to the stale flag.

Drop the interface-wide flag and instead compare the quirk
requirement of the incoming parameters against the committed
configuration of the opposite stream at hw_params() time. The
committed channels/width are cleared in hw_free() so that a released
stream no longer constrains the other one.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 66 +++++++++++++++++++++++++--------------
 sound/soc/meson/gx-interface.h    |  3 --
 2 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 83b579e98f1c..c2a280bfdfe2 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -62,13 +62,36 @@ static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 	return 0;
 }
 
+/*
+ * Return true if the given combination of channels and sample width requires
+ * the bs quirk. Return false otherwise.
+ */
+static bool aiu_encoder_is_bs_quirk(unsigned int channels, int width)
+{
+	return (channels == 8) && (width == 16);
+}
+
+static int aiu_encoder_check_bs_quirk(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct gx_stream *other_stream = snd_soc_dai_dma_data_get(dai, !substream->stream);
+
+	/* Nothing to do if the other stream doesn't exist or it's not configured yet. */
+	if (!other_stream || !other_stream->channels)
+		return 0;
+
+	if (aiu_encoder_is_bs_quirk(other_stream->channels, other_stream->width) !=
+	    aiu_encoder_is_bs_quirk(params_channels(params), params_width(params)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 					struct snd_pcm_hw_params *params,
 					unsigned int bs)
 {
-	struct aiu *aiu = snd_soc_component_get_drvdata(component);
-	struct gx_iface *iface = &aiu->i2s.iface;
-
 	/*
 	 * NOTE: this HW is odd.
 	 * In most configuration, the i2s divider is 'mclk / blck'.
@@ -76,25 +99,13 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 	 * increased by 50% to get the correct output rate.
 	 * No idea why !
 	 */
-	if (params_width(params) == 16 && params_channels(params) == 8) {
+	if (aiu_encoder_is_bs_quirk(params_channels(params), params_width(params))) {
 		if (bs % 2) {
 			dev_err(component->dev,
 				"Cannot increase i2s divider by 50%%\n");
 			return -EINVAL;
 		}
 		bs += bs / 2;
-		iface->bs_quirk = true;
-	} else {
-		/*
-		 * If the bs quirk is currently applied for one stream and another
-		 * ones tries to setup a configuration for which the quirk is
-		 * not required, then fail.
-		 */
-		if (iface->bs_quirk) {
-			dev_err(component->dev,
-				"bclk requirements are incompatible with active stream\n");
-			return -EINVAL;
-		}
 	}
 
 	/* Use CLK_MORE for mclk to bclk divider */
@@ -110,9 +121,11 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 	return 0;
 }
 
-static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
+static int aiu_encoder_i2s_set_clocks(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
 {
+	struct snd_soc_component *component = dai->component;
 	struct aiu *aiu = snd_soc_component_get_drvdata(component);
 	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int srate = params_rate(params);
@@ -133,10 +146,15 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 
 	bs = fs / 64;
 
-	if (aiu->platform->has_clk_ctrl_more_i2s_div)
+	if (aiu->platform->has_clk_ctrl_more_i2s_div) {
+		if (aiu_encoder_check_bs_quirk(substream, params, dai)) {
+			dev_err(dai->dev, "bclk requirements incompatible with other stream\n");
+			return -EINVAL;
+		}
 		ret = aiu_encoder_i2s_set_more_div(component, params, bs);
-	else
+	} else {
 		ret = aiu_encoder_i2s_set_legacy_div(component, params, bs);
+	}
 
 	if (ret)
 		return ret;
@@ -155,7 +173,6 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 	struct gx_iface *iface = ts->iface;
-	struct snd_soc_component *component = dai->component;
 	int ret;
 
 	/*
@@ -170,7 +187,7 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	ret = aiu_encoder_i2s_set_clocks(component, params);
+	ret = aiu_encoder_i2s_set_clocks(substream, params, dai);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
 		return ret;
@@ -219,7 +236,6 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 	if (snd_soc_dai_active(dai) <= 1) {
 		aiu_encoder_i2s_divider_enable(component, 0);
 		iface->rate = 0;
-		iface->bs_quirk = false;
 	}
 
 	if (ts->clk_enabled) {
@@ -227,6 +243,10 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 		ts->clk_enabled = false;
 	}
 
+	ts->channels = 0;
+	ts->width = 0;
+	ts->physical_width = 0;
+
 	return 0;
 }
 
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index 65c46dcce32a..d9ab894589fa 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -22,9 +22,6 @@ struct gx_iface {
 
 	/* For component wide symmetry */
 	int rate;
-
-	/* Only for GX platform */
-	int bs_quirk;
 };
 
 struct gx_stream {

-- 
2.47.3

