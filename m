Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37385250BF6
	for <linux-sound@vger.kernel.org>; Thu,  3 Apr 2025 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696159; cv=none; b=p0GA7OXOJxcsAuuurM4roCJ8JFCUZiD4o5yHRro/0+2p2Ih2HneAMm/EprZg+gbjdghk5S9GYsUK4DUJr2O0EUGcCe/kHvNDLhvnJu5sjUov+RSRQjdiALr5fw9H1vXO4ptQ1VkbM7uz2pOhZCNEmu3uhktopG/XkNc7d7kePpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696159; c=relaxed/simple;
	bh=prWl/oKjeICCpY8NVeCuorCzG8tznA9V1MVAwdGvN7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GAwIBBM2PljmUa8tdaU+V64Pp6LNRjgv81h2hI4x7ytPMlmlHispP6q5Sy8KvCnPgjyZIr1qBrjAVTjTxdLJWA6L/qo2mZKIv9Kc8TCayZUUPkVgTL3f3MDrvc6DkPp9J8a5/DIE8DzUgg4FT7swGIakjSicMP/MSWwKlPkhHSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QACvxo3h; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QACvxo3h"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so11251005e9.3
        for <linux-sound@vger.kernel.org>; Thu, 03 Apr 2025 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743696154; x=1744300954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGxHCbeyYb+MzV1Ab/qs9UuRGLyJNxdDlt8RO81d10Q=;
        b=QACvxo3hUWmo7bF0hEi98HCr59fO8fHhk95yiHsCU1HoN9riiN4kLIbJ4BYzC7Wzpn
         DT/xrraiveqtZ3S7sB7XQprADdD3dQcamA9fHpcIYrvJz7FIgzIb4ixWtng4JN3XkZ0W
         Keg35bOjugX23ADS9KTcdPEwv6YL0PtLC8ektDLKeMN0RQI1txJwfCzyoOQEp1Wg/rhF
         yJ80QF67hNLg/3C2HJHarvl9/gB+7BDLihEgzmnBAg7skq3vKynH/vHFoIRDDHT+YU0h
         qd8f7fpLJmL7+L1tQn6OqWe/lKPE6mNpF57jyQ6dD8L7+hBDDx9YmP6QPBnKdo4am2vN
         8Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696154; x=1744300954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGxHCbeyYb+MzV1Ab/qs9UuRGLyJNxdDlt8RO81d10Q=;
        b=cfTLFhgnjxb089Dfen/BON6vCBKbamHOMfUWIDmsjXJupr6XsU6VXqQrp1SP8S4hQ/
         W07JIueWxukqhR9biE9ldswUqTspzkJ1cc9IveB1pZTNWlP1sFWwkF3adqITXuJPb7aq
         inodw/h66gV3X3dT7/+t7cdKN+JCHG1kqs7OkG3Yr1o3caZnNWTaF/xNvI2dPP8UofZy
         eBRDQHMFQDNoxsG+BXmeJNujg6X+mf/Tn39DTGVaQsm/P7DcZ0udgP0IvvnPGhXdsX1a
         jKwTDg7XnDHc3TSiEENto7Hjn+vX77zFDSQMwKrMimuR37xvumqR1jEmBar9XUqI9Jx7
         ELgw==
X-Forwarded-Encrypted: i=1; AJvYcCUT1ZTyTg7qovVEdqyUvaaeWBFJAJDlIQSQQvjl1purWz3RoRxTshMJUs3xmLivZD50neBdmzU8MYjUAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMD0azurw/0e16ADguc4qLhWMP5AIV1GDtciq+SuJZRNYURkRU
	E564wRY7+8M/QRR7MNlguhJ91nKAZQFnjvCWzvyelpdn8L0vcSqVamnjCui1PgI=
X-Gm-Gg: ASbGncvRh1VcH6rlb1PAOgkxgLW4qHWo5QxNHVGot6UQlZC6tHkTOJR/oud7TYIyMUR
	SH6FQzf+n/iVgHDvuGPQ2AiFRwFx/jBzPFmdQnnnotKesrkwy5pkm5xK1tu0eKBvQC7R+hinY7J
	DatRJtYZOMtCb+yElX27Y+KDFW7B6exTWTOlrdrjg89LKztM/BiZmEaPeWuWdCJHjMkUOMEQRpN
	lRmATcJuRCsQwVW/WlxzRZtPknGvcnsOFjWJpkVN3G6ACpRfR7ycYDa2q3TK5OIW9+w+Yjv4e6w
	5RDR27MH5RGpSdbwN4BgAQbhTGvrGWlx0Blga4KvwU8YyUnVxPTsB9hr7pX9ltR0d8OsyQ==
X-Google-Smtp-Source: AGHT+IHlLfWrjl1pJEbIehA/TvECe+DFfF7GwTjvWr48M60HR1U3VlaUWlMl7YRIt0U7CPSoj1yfHQ==
X-Received: by 2002:a05:600c:4f88:b0:43d:762:e0c4 with SMTP id 5b1f17b1804b1-43ec14e531dmr27974775e9.27.1743696153851;
        Thu, 03 Apr 2025 09:02:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbc64sm21811285e9.21.2025.04.03.09.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:02:30 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Date: Thu,  3 Apr 2025 17:02:08 +0100
Message-Id: <20250403160209.21613-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
References: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Currently the VI feedback rate is set to fixed 8K, fix this by getting
the correct rate from params_rate.

Without this patch incorrect rate will be set on the VI feedback
recording resulting in rate miss match and audio artifacts.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 39 +++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index c989d82d1d3c..ac119847bc22 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -63,6 +63,10 @@
 #define CDC_WSA_TX_SPKR_PROT_CLK_DISABLE	0
 #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK	GENMASK(3, 0)
 #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K	0
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K	1
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K	2
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K	3
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K	4
 #define CDC_WSA_TX0_SPKR_PROT_PATH_CFG0		(0x0248)
 #define CDC_WSA_TX1_SPKR_PROT_PATH_CTL		(0x0264)
 #define CDC_WSA_TX1_SPKR_PROT_PATH_CFG0		(0x0268)
@@ -407,6 +411,7 @@ struct wsa_macro {
 	int ear_spkr_gain;
 	int spkr_gain_offset;
 	int spkr_mode;
+	u32 pcm_rate_vi;
 	int is_softclip_on[WSA_MACRO_SOFTCLIP_MAX];
 	int softclip_clk_users[WSA_MACRO_SOFTCLIP_MAX];
 	struct regmap *regmap;
@@ -1280,6 +1285,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	switch (substream->stream) {
@@ -1291,6 +1297,11 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 				__func__, params_rate(params));
 			return ret;
 		}
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		if (dai->id == WSA_MACRO_AIF_VI)
+			wsa->pcm_rate_vi = params_rate(params);
+
 		break;
 	default:
 		break;
@@ -1465,6 +1476,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	u32 tx_reg0, tx_reg1;
+	u32 rate_val;
+
+	switch (wsa->pcm_rate_vi) {
+	case 8000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
+		break;
+	case 16000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
+		break;
+	case 24000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
+		break;
+	case 32000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
+		break;
+	case 48000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
+		break;
+	default:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
+		break;
+	}
 
 	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
 		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
@@ -1476,7 +1509,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-			/* Enable V&I sensing */
+		/* Enable V&I sensing */
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
@@ -1485,10 +1518,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+					      rate_val);
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+					      rate_val);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
-- 
2.39.5

