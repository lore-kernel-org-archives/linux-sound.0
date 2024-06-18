Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FCA13D52A
	for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718718563; cv=none; b=uoybFglRX9SVxQZxjQMoLPeevqYxbWGbFBN7zzgboDA+x3NdblLXXEahJ4EBaUM9fyx3SS+G20iUfi8c3R15c8lKA1nHwn9EIPEvazNmxGQKNE+T0pZvERW0JUM+fanv1Yzxe9zGPlhA31a/7Ywp0fp2my9C2+mPFGM5SYgrBzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718718563; c=relaxed/simple;
	bh=XbOLlOWlwcD1EYYwvE5qAsvZWmsWuvVl0dXINENlJqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CD8PsaLb++1IAmjoEX+5nKqmPTy4WzAE5MWPZzjUDtUTFPJhPPfJxeGroHP19UJSrZoPj4E2phqXPz7VIwHrsMwdwnnjNH870HTj20QzwjEWq0vYFrM93jMiQyyuuB19afPDCAorCJyAi9nuJxp9CbIB+myM9Y3Om1AB7hp91Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNPzUz2a; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNPzUz2a"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso7331701a12.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718718559; x=1719323359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mT8eUKe7uKBDcnOx0sNjTt1FDPm4Rm6266oWd39xCYo=;
        b=MNPzUz2aT2CbuIyWLUz7w0j2uT+lDGVvmWiFmLy+Aq+yh/JnOOQ6i8EXPAM4TDpPOd
         IZesRgE7ww9k6hzWTSDfdEiddvt8376/nWTXzNDeLj32QC84KEICRZ7f4o/XUj66hka3
         8CskHoRbItVinso1AtJvUEUvIACV3j2RRJf99TtF3BNXmedCPhQtc6bEV+5AirpFE9cO
         7mOAVdDQlD6iQVA4qVyYviYNL8Ivh2exuv03/8mAHEKVW4dkZFj7qGoDTYHudxMmWfum
         EcN9NYGfLIyZjPv54CL8AnqkK1QYHcfpwAu6R0DWWgvpVYi+4MwBda2yNQ0CD9UP4MN6
         mi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718718559; x=1719323359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mT8eUKe7uKBDcnOx0sNjTt1FDPm4Rm6266oWd39xCYo=;
        b=ivD2c+Tn679dRL3IC+OKprIacq7MJsiHdxzkQ40JrpXhbZWiws3xo4Ow0MwnGv2xPo
         7MoDsbPl5Z9d/w0L8xWKAy+UkIa8MvRrI+Az1vgILJr/91IozTKNc+Z8xzwkni3HCj4O
         df+bcdDP4xZhpApAxsd0WnPG11WN/HoOM2EE9MQstUyPdpihdqQoxQv0SSd+0bA0nxP0
         U4iyVDSaGrmJVjXSZ6jotv0genkI2E3OZsXa5L3oStdpTVJeep0sMtgDdHadbgAQMbmR
         LUOUVr5xMeAgfV7VzC8HgR+CS7E/L9LmREvbe1zRsoV1T2EAPgMP4aNDsJNh9Q22RueI
         lZxA==
X-Forwarded-Encrypted: i=1; AJvYcCVI4xi0MDYxA1ZON1BZtLAZEdgRz64WJBb8EtkEOmqVTXrcbGbn1yw/b8QsoD9kdA+d03xLyBwWnaU1SDUkEuNL/cgeW51LDKE6xlw=
X-Gm-Message-State: AOJu0YybKGQ2tPHs6U8UvJGfXbO2wLYg0Kciqsab1YRVYMHcTKtlZeGN
	POnF7E7RBNFPuXXfCtAh0yU7vsahoVUjJPRe19Kiz0AhJwGS5JKCDtUqnaU8eLo=
X-Google-Smtp-Source: AGHT+IHT9mgFIP4gnreH1Y2uJj9kPskt5MMHqGXeZ9KFWYTuiCUeGqK0leKSOhfBMrPQANcKRdxP7Q==
X-Received: by 2002:a05:6402:2881:b0:57d:c8:d295 with SMTP id 4fb4d7f45d1cf-57d00c9385fmr771440a12.4.1718718558796;
        Tue, 18 Jun 2024 06:49:18 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cbdfe1428sm6678397a12.27.2024.06.18.06.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:49:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 18 Jun 2024 14:49:00 +0100
Subject: [PATCH 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-lpass-wsa-vi-v1-1-416a6f162c81@linaro.org>
References: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
In-Reply-To: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=XbOLlOWlwcD1EYYwvE5qAsvZWmsWuvVl0dXINENlJqE=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZBc9D7yd3a5UzFrmBLYPMBR3Ul/av8RYu1jp
 AzNLuv0aYGJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGQXAAKCRB6of1ZxzRV
 N1oBB/9ZFw/xEXGQ83UmQrU2jJQjhaofE3cC2STGIKGSKk+FJThNkXePz/nsaUlq+jS3SkPejGx
 ezNvz9MKSAClo2teAXL++zyAVx3vj/V27DkNGBAo9XshdHCl75B3dvtCRqd55US4Hs+OuKY9SQT
 HnWhy2NzMhFK4knArLNnhoIzZe/hijWhfigU1bPD6rJsKZldekk6nryqs/0J+kK7kUrEzi6l5Mq
 LIL97KGRCVc+nazheV3t9wOusLYmEs+4Za+/0+o1UgjB02kSkaatAcZ1hPgmGDSk1TZUzCEgLMl
 +PGrImS171EIMWVKgqdYQzo99POMH/JANZIqv0fKZhj8cP4T
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Currently the VI feedback rate is set to fixed 8K, fix this by getting
the correct rate from params_rate.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..7b6d495ef596 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -66,6 +66,10 @@
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
@@ -347,6 +351,7 @@ struct wsa_macro {
 	int ear_spkr_gain;
 	int spkr_gain_offset;
 	int spkr_mode;
+	u32 pcm_rate_vi;
 	int is_softclip_on[WSA_MACRO_SOFTCLIP_MAX];
 	int softclip_clk_users[WSA_MACRO_SOFTCLIP_MAX];
 	struct regmap *regmap;
@@ -974,6 +979,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	switch (substream->stream) {
@@ -986,6 +992,10 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		if (dai->id == WSA_MACRO_AIF_VI)
+			wsa->pcm_rate_vi = params_rate(params);
+
 	default:
 		break;
 	}
@@ -1159,6 +1169,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
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
@@ -1179,10 +1211,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
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
2.25.1

