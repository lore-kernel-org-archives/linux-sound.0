Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8341A08BB
	for <linux-sound@vger.kernel.org>; Thu,  5 Sep 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545627; cv=none; b=uueY1fqm1ieALgfWABdEj9xxAjinNVTyuKR9voJd4Md9KupwZylQxLJlnA5NPyJhOQ0SH97Y8xPd7LkUOlO1AsiVyiEz6Tx3sxSMc432plxflfHg313lnZwwNho8JCc6JtZNtCbfs6FTBhogbzrAajkBnA721uCsDzFzwNqswwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545627; c=relaxed/simple;
	bh=XXaaAVjkchY/rqKPr1ocH7WdZ2HyLktu1KzKeahPou8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=olmS8l2YE0cLopGyoj0FXnEJgKX9mp7inFQpiO67NGXblR1snifBUeGXr6yMJ3y3rRggEygU3ZtZQ//Ux8qkJC9TczACzhXkX0NmUj4EbZnWb+ltgYyq2iboRFwqH8ZymXIJjxnjjUm9h5isC4PMC/HR1t0BtuTpXzn7tOWAb7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U/uSXVrf; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U/uSXVrf"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374d29ad870so488310f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Sep 2024 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545623; x=1726150423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMGhXEw0EMiOdueZyPaJHCVqWqxyBmUIEc+9ejnTuMw=;
        b=U/uSXVrfITRuytVMJyJIMXCgkgTve8IwJ9R2CiE3ju5yGZNgSdqsmGZ/VzHLUKYopL
         lHuMx9NO9DXpdu8gRUNjVMuvXiVOU7cGoLrqLRLdSSO8HSuIRfbtz4msUpSNljw/ZKMc
         w++7Z6DIBH8BK2XesuKtc+gt8KwEsSaMv4zhHuNFD79xjARbN5EcYIRq7mC5Zpvul8X3
         E1nRjjBHe+/kM5dMyQjO7kLy9YSIV/oJOTVbKfmjjaj8rnxzwZ8tOEDdg1Xas2cijFm9
         s3oA1CUcBRy1kg37bq//9bC8Tb2a9q+SPgbK5kKqOaqupFLwbcuV0K+5sPqiwBKO9DTe
         NWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545623; x=1726150423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMGhXEw0EMiOdueZyPaJHCVqWqxyBmUIEc+9ejnTuMw=;
        b=rQXlcZzaaZlJN3PPkfaK6tMJdxu2uTv+BCJzlW2nAIPaWbmNcXeXixMhpOUf2tZMgG
         ccFbDkANDFGZq5bFbrgobI18ySj563WRRBR6wyy3TUFjMQ99CKRmVuaKJPtFYbzElfep
         eIaggOgVBo3JFj0g6Gk7ro471F/WtjyjVC79oh+ST7575JspfKFf3qx7DAylVD2onNYM
         aCfQwfK/Ae0KHJXmJHYSSfr9iOD/x9QvWHxr0ZxdbiV00wbxFJXAqWyEO75hsL7dHzkX
         4E9dpmoSCzghxJaXTc1qbJKhCd8PQUrq/YMFP9tlD6RHz0j4J2z/hNfRmRXZITElNP8o
         Xu2w==
X-Gm-Message-State: AOJu0YyrUZQyjM0J/95+d4Bandy0drRp2SG08EcXcTIU3rbNEP0Hy0HZ
	5yYbAC9NQ1aPzl/YuEbCbgpFhkMBivZxVWZkkEcMqcMqHVZe02HuykP7xDpEBdI=
X-Google-Smtp-Source: AGHT+IHBquwgcDoVsD6UjFSAJZlg+wE5YNTlLR8lb6J1pcatZPhdoPS1oDkj1/VU2ExhbxuANwuKeQ==
X-Received: by 2002:adf:e592:0:b0:34d:ae98:4e7 with SMTP id ffacd0b85a97d-374bf1c7b74mr11792893f8f.41.1725545622875;
        Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:01 +0200
Subject: [PATCH 10/13] ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-10-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2940; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XXaaAVjkchY/rqKPr1ocH7WdZ2HyLktu1KzKeahPou8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byGxo81ExacfBJI81+ntmOih8+z3ldyeNe5p
 14qWKO8BtOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hgAKCRDm/A8cN/La
 hSBoD/9eW7KOYMCCavytluGtMs7KD2nL+UinfgARTNGDbqp5udgQ2B6jgk3T88uxIPdnxYUe3cj
 MjiyvaOUVqBJZlzj4NCJMzBEQY4ADrkc/UCpwYvzKCOaRm5UlDKwXsAnQIPZh/oL3+nc2hAY5dX
 yRLYnghzyXECZkDFTFo/MixLa4LoYMbD/lyKQrPBQzXXQK8UFfL8nQaHpVSiR22tFP9XgDKN2Yd
 /ufhKtaKHzuc1whFPon6rF5tBMwNrGmwJws406yr3+fZIBgIOFJjF/L/Ln6huP832EFvxStoPtD
 UJTiKpTxP4gqIbBCubzoQalXtJ3KIb05Jxdg3kGERNkhtnHxIpAH0UtMuDGLNHnhoXC/AzRGGMw
 Os6aIVYzFvb90va5lQxHbNBbS6h+bWCktz7t1FCiAHZXddfb3GA88MSew6NtAieiq8gba3O6Vu+
 hNtDdt/5IKKYktss2RWYAb6Z3gAJKwWzfWE1edd7fWeo+cphCfD2cpI/Oj7xPECGdDn8xsZKwVM
 dVkosxTnKkC502b3DS64t+8SPm9Y9ZHD5se/X9kna6uaV6ScfLWh3wwFRZXrkB95RukPC/8CH83
 EkPqzT4q1kZgT/oltlSBnTUPkW1BTMPEuEIrfmTi3TlO5b+KTWwHq4lQfDOJnIC9k775yfgUVx4
 UQwYLqEzwD2MhVw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 3913706ccdc5..045100c94352 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -128,8 +128,13 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 #define Q6ASM_FEDAI_DRIVER(num) { \
 		.playback = {						\
 			.stream_name = "MultiMedia"#num" Playback",	\
-			.rates = (SNDRV_PCM_RATE_8000_192000|		\
-					SNDRV_PCM_RATE_KNOT),		\
+			.rates = (SNDRV_PCM_RATE_8000_48000 |		\
+				  SNDRV_PCM_RATE_12000 |		\
+				  SNDRV_PCM_RATE_24000 |		\
+				  SNDRV_PCM_RATE_88200 |		\
+				  SNDRV_PCM_RATE_96000 |		\
+				  SNDRV_PCM_RATE_176400 |		\
+				  SNDRV_PCM_RATE_192000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
 					SNDRV_PCM_FMTBIT_S24_LE),	\
 			.channels_min = 1,				\
@@ -139,8 +144,9 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 		},							\
 		.capture = {						\
 			.stream_name = "MultiMedia"#num" Capture",	\
-			.rates = (SNDRV_PCM_RATE_8000_48000|		\
-					SNDRV_PCM_RATE_KNOT),		\
+			.rates = (SNDRV_PCM_RATE_8000_48000 |		\
+				  SNDRV_PCM_RATE_12000 |		\
+				  SNDRV_PCM_RATE_24000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
 				    SNDRV_PCM_FMTBIT_S24_LE),		\
 			.channels_min = 1,				\
@@ -152,18 +158,6 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 		.id = MSM_FRONTEND_DAI_MULTIMEDIA##num,			\
 	}
 
-/* Conventional and unconventional sample rate supported */
-static unsigned int supported_sample_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
-	88200, 96000, 176400, 192000
-};
-
-static struct snd_pcm_hw_constraint_list constraints_sample_rates = {
-	.count = ARRAY_SIZE(supported_sample_rates),
-	.list = supported_sample_rates,
-	.mask = 0,
-};
-
 static const struct snd_compr_codec_caps q6asm_compr_caps = {
 	.num_descriptors = 1,
 	.descriptor[0].max_ch = 2,
@@ -390,11 +384,6 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		runtime->hw = q6asm_dai_hardware_capture;
 
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE,
-				&constraints_sample_rates);
-	if (ret < 0)
-		dev_info(dev, "snd_pcm_hw_constraint_list failed\n");
 	/* Ensure that buffer size is a multiple of period size */
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);

-- 
2.45.2

