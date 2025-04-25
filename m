Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917BA2356B0
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569566; cv=none; b=AD0RetsJcCuWDu2dHTFIL4X0inMWXJtvmxeT4Hr7zisjHvaoDVL7/45oEQ8nW4vW823yWvH6BK8UsERZqeSGBGvrZeG1rh+Vua47JZLWUCL8XXuVZM5KbC/x7ZlWEvSYe8lZVagcl0/kHOlbmnc4OXBAIKp6RU6JoBblq02l5A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569566; c=relaxed/simple;
	bh=sd9Zy3RykMw81bElq6sMYsARq4HQCJuVXQCjD6fXNKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrTf4xvmfPIbx3OVrkH2V2fUacmgmDNtT1SJ9YsdtONx+J47fvFCqG5F1t8hBjoUkYosxrrPNfVQV5Zn6D7AJ+4b0aXRh/ZzinkuREQm+Za+Y7o4sOQ2t2J2whulWgs4MIhyxyxCaV/vrNQEaQV6+J6GjnicdPUo548ombGet3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LPALg9Zy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LPALg9Zy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224341bbc1dso24574615ad.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745569564; x=1746174364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIoPxPd/4SKxFzQ2sbT9yyaISz0ZfnDIApKeqMxKAVM=;
        b=LPALg9ZyJfzZr0rOhmaGx91kJTExQbfQYKmej7aoK4YwQ+4p8gDbRqBqmrCJ+0KYdY
         fEhauZdgUQecwXzOtVUb+Ikz8Tw+H48x1nTsiRwcamScPKufEQaWw31b7XwuUf8u6Bq8
         rnCJWtaGJ2DzxyKC0sa5lQyRtWOSA7qh+xesE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569564; x=1746174364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIoPxPd/4SKxFzQ2sbT9yyaISz0ZfnDIApKeqMxKAVM=;
        b=aShGCjO77hjFuT8OaHFguQRAbrSATUbiPlRbjA8OtYDdQezOS9EL6vi9hAEkMxnEM5
         rHRaNyZpbpitrm7KzQRFJsEe0lOIUAjv/JLwKCJD3i35piNrxhWguLio0QqLz8M+wK7l
         1dtD9Z/HYhn0Expysdbc83lfHOTE7a5GoX/FuzLN5tUIk/EjiICTdAiyVonIfaMuk/Ii
         n8GokkYr2u0wwnp2P3MO98r9VSWKTjSLYMIuV3n0NRX8vpNFWJrocofZI35nmQTxuGD8
         kkyQWVlFvBJ4HO6mTdo2VMhVBkIzQInjIpkYVGAhTY3jzlfILNWQ44+wRQZ6b3q7jm7h
         HV0A==
X-Forwarded-Encrypted: i=1; AJvYcCVgP3d2/Efn3O0DoHlrWOXxI1+T8SDUPAoqGKO8hXshdndCkCTMiUBviiUF8kJr0kM9VCzKSipYCawQXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznnLW2BLmh0ZQzdHQtEGKKE1Jps9LWLKMGmerGdUXhQSawNoxU
	PL3HaU/tuqNFWrTJUpBxv7xugVr5vVsDEnVnb5I1qltJG8Lr7k74/xXu6B6YwQ==
X-Gm-Gg: ASbGnct4li4d0VdMvRa8Ea0npznFW0Gnq3Mzr1uKbGk66U4YCN+E1GievMGdAUdlkyQ
	LAtzk0EJXQnGVyLBUG0y/Z2iCGdz5Fu0X9i2CAEgOVYvy+aB8sE820tKjcFhVgF5kaH4rHFX353
	/vsBpmu/Y7sHLG05QLfrVYNCz7BbF2+Ry9bZmTyzlxeHBooO9biidjBpIMRVxlEAs7A0uG24HFV
	il/DY55K9VwaoIbYy3teJXfZmKNS//QHQPoSTErH6LQkXOcl2OCSHBLLpibj4UtGMxDM8V0+EKI
	06p90TTOLKY7TpTrGHUQgqZZChM8KKZ/mHLDnv27JV/Ah4O8B++0MRMHi5HLNjg69qFr5w==
X-Google-Smtp-Source: AGHT+IF7ci9aHN2WDhs7A1XDuuym2fXQ0c+JrRPPEzEqgV1pI/nJMNeBjSjR3voxcnyJVTXvDDG1FQ==
X-Received: by 2002:a17:90b:35c5:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-309f7df0012mr2983136a91.14.1745569563829;
        Fri, 25 Apr 2025 01:26:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4b10:d9aa:98d0:5bb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77417d6sm1019179a91.4.2025.04.25.01.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:26:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Darren Ye <darren.ye@mediatek.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8183-afe-pcm: shorten mt8183_is_volatile_reg()
Date: Fri, 25 Apr 2025 16:25:50 +0800
Message-ID: <20250425082551.1467042-4-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
References: <20250425082551.1467042-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8183_is_volatile_reg() is a large switch-case block that lists out
every register that is volatile. Since many pairs of registers have
consecutive addresses, the cases can be compressed down with the
ellipsis, i.e. GCC extension "case ranges" [1] to cover more addresses
in one case, shortening the source code.

This is not completely the same, since the addresses are 4-byte aligned,
and using the case ranges feature adds all unaligned addresses in
between. In practice this doesn't matter since the unaligned addresses
are blocked by the regmap core. This also ends up compiling slightly
smaller with a reduction of 128 bytes in the text section.

[1] https://gcc.gnu.org/onlinedocs/gcc/Case-Ranges.html

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 152 ++++++---------------
 1 file changed, 40 insertions(+), 112 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 5e340e77b9d5..c88a6705bf7e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -533,86 +533,46 @@ static bool mt8183_is_volatile_reg(struct device *dev, unsigned int reg)
 	/* these auto-gen reg has read-only bit, so put it as volatile */
 	/* volatile reg cannot be cached, so cannot be set when power off */
 	switch (reg) {
-	case AUDIO_TOP_CON0:	/* reg bit controlled by CCF */
-	case AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
+	case AUDIO_TOP_CON0 ... AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
 	case AUDIO_TOP_CON3:
-	case AFE_DL1_CUR:
-	case AFE_DL1_END:
-	case AFE_DL2_CUR:
-	case AFE_DL2_END:
-	case AFE_AWB_END:
-	case AFE_AWB_CUR:
-	case AFE_VUL_END:
-	case AFE_VUL_CUR:
-	case AFE_MEMIF_MON0:
-	case AFE_MEMIF_MON1:
-	case AFE_MEMIF_MON2:
-	case AFE_MEMIF_MON3:
-	case AFE_MEMIF_MON4:
-	case AFE_MEMIF_MON5:
-	case AFE_MEMIF_MON6:
-	case AFE_MEMIF_MON7:
-	case AFE_MEMIF_MON8:
-	case AFE_MEMIF_MON9:
-	case AFE_ADDA_SRC_DEBUG_MON0:
-	case AFE_ADDA_SRC_DEBUG_MON1:
-	case AFE_ADDA_UL_SRC_MON0:
-	case AFE_ADDA_UL_SRC_MON1:
+	case AFE_DL1_CUR ... AFE_DL1_END:
+	case AFE_DL2_CUR ... AFE_DL2_END:
+	case AFE_AWB_END ... AFE_AWB_CUR:
+	case AFE_VUL_END ... AFE_VUL_CUR:
+	case AFE_MEMIF_MON0 ... AFE_MEMIF_MON9:
+	case AFE_ADDA_SRC_DEBUG_MON0 ... AFE_ADDA_SRC_DEBUG_MON1:
+	case AFE_ADDA_UL_SRC_MON0 ... AFE_ADDA_UL_SRC_MON1:
 	case AFE_SIDETONE_MON:
-	case AFE_SIDETONE_CON0:
-	case AFE_SIDETONE_COEFF:
+	case AFE_SIDETONE_CON0 ... AFE_SIDETONE_COEFF:
 	case AFE_BUS_MON0:
-	case AFE_MRGIF_MON0:
-	case AFE_MRGIF_MON1:
-	case AFE_MRGIF_MON2:
-	case AFE_I2S_MON:
+	case AFE_MRGIF_MON0 ... AFE_I2S_MON:
 	case AFE_DAC_MON:
-	case AFE_VUL2_END:
-	case AFE_VUL2_CUR:
-	case AFE_IRQ0_MCU_CNT_MON:
-	case AFE_IRQ6_MCU_CNT_MON:
-	case AFE_MOD_DAI_END:
-	case AFE_MOD_DAI_CUR:
-	case AFE_VUL_D2_END:
-	case AFE_VUL_D2_CUR:
-	case AFE_DL3_CUR:
-	case AFE_DL3_END:
+	case AFE_VUL2_END ... AFE_VUL2_CUR:
+	case AFE_IRQ0_MCU_CNT_MON ... AFE_IRQ6_MCU_CNT_MON:
+	case AFE_MOD_DAI_END ... AFE_MOD_DAI_CUR:
+	case AFE_VUL_D2_END ... AFE_VUL_D2_CUR:
+	case AFE_DL3_CUR ... AFE_DL3_END:
 	case AFE_HDMI_OUT_CON0:
-	case AFE_HDMI_OUT_CUR:
-	case AFE_HDMI_OUT_END:
-	case AFE_IRQ3_MCU_CNT_MON:
-	case AFE_IRQ4_MCU_CNT_MON:
-	case AFE_IRQ_MCU_STATUS:
-	case AFE_IRQ_MCU_CLR:
+	case AFE_HDMI_OUT_CUR ... AFE_HDMI_OUT_END:
+	case AFE_IRQ3_MCU_CNT_MON... AFE_IRQ4_MCU_CNT_MON:
+	case AFE_IRQ_MCU_STATUS ... AFE_IRQ_MCU_CLR:
 	case AFE_IRQ_MCU_MON2:
-	case AFE_IRQ1_MCU_CNT_MON:
-	case AFE_IRQ2_MCU_CNT_MON:
-	case AFE_IRQ1_MCU_EN_CNT_MON:
-	case AFE_IRQ5_MCU_CNT_MON:
+	case AFE_IRQ1_MCU_CNT_MON ... AFE_IRQ5_MCU_CNT_MON:
 	case AFE_IRQ7_MCU_CNT_MON:
 	case AFE_GAIN1_CUR:
 	case AFE_GAIN2_CUR:
 	case AFE_SRAM_DELSEL_CON0:
-	case AFE_SRAM_DELSEL_CON2:
-	case AFE_SRAM_DELSEL_CON3:
-	case AFE_ASRC_2CH_CON12:
-	case AFE_ASRC_2CH_CON13:
+	case AFE_SRAM_DELSEL_CON2 ... AFE_SRAM_DELSEL_CON3:
+	case AFE_ASRC_2CH_CON12 ... AFE_ASRC_2CH_CON13:
 	case PCM_INTF_CON2:
-	case FPGA_CFG0:
-	case FPGA_CFG1:
-	case FPGA_CFG2:
-	case FPGA_CFG3:
-	case AUDIO_TOP_DBG_MON0:
-	case AUDIO_TOP_DBG_MON1:
-	case AFE_IRQ8_MCU_CNT_MON:
-	case AFE_IRQ11_MCU_CNT_MON:
-	case AFE_IRQ12_MCU_CNT_MON:
+	case FPGA_CFG0 ... FPGA_CFG1:
+	case FPGA_CFG2 ... FPGA_CFG3:
+	case AUDIO_TOP_DBG_MON0 ... AUDIO_TOP_DBG_MON1:
+	case AFE_IRQ8_MCU_CNT_MON ... AFE_IRQ12_MCU_CNT_MON:
 	case AFE_CBIP_MON0:
-	case AFE_CBIP_SLV_MUX_MON0:
-	case AFE_CBIP_SLV_DECODER_MON0:
+	case AFE_CBIP_SLV_MUX_MON0 ... AFE_CBIP_SLV_DECODER_MON0:
 	case AFE_ADDA6_SRC_DEBUG_MON0:
-	case AFE_ADD6A_UL_SRC_MON0:
-	case AFE_ADDA6_UL_SRC_MON1:
+	case AFE_ADD6A_UL_SRC_MON0... AFE_ADDA6_UL_SRC_MON1:
 	case AFE_DL1_CUR_MSB:
 	case AFE_DL2_CUR_MSB:
 	case AFE_AWB_CUR_MSB:
@@ -622,55 +582,23 @@ static bool mt8183_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_VUL_D2_CUR_MSB:
 	case AFE_DL3_CUR_MSB:
 	case AFE_HDMI_OUT_CUR_MSB:
-	case AFE_AWB2_END:
-	case AFE_AWB2_CUR:
+	case AFE_AWB2_END ... AFE_AWB2_CUR:
 	case AFE_AWB2_CUR_MSB:
-	case AFE_ADDA_DL_SDM_FIFO_MON:
-	case AFE_ADDA_DL_SRC_LCH_MON:
-	case AFE_ADDA_DL_SRC_RCH_MON:
-	case AFE_ADDA_DL_SDM_OUT_MON:
-	case AFE_CONNSYS_I2S_MON:
-	case AFE_ASRC_2CH_CON0:
-	case AFE_ASRC_2CH_CON2:
-	case AFE_ASRC_2CH_CON3:
-	case AFE_ASRC_2CH_CON4:
-	case AFE_ASRC_2CH_CON5:
-	case AFE_ASRC_2CH_CON7:
-	case AFE_ASRC_2CH_CON8:
-	case AFE_MEMIF_MON12:
-	case AFE_MEMIF_MON13:
-	case AFE_MEMIF_MON14:
-	case AFE_MEMIF_MON15:
-	case AFE_MEMIF_MON16:
-	case AFE_MEMIF_MON17:
-	case AFE_MEMIF_MON18:
-	case AFE_MEMIF_MON19:
-	case AFE_MEMIF_MON20:
-	case AFE_MEMIF_MON21:
-	case AFE_MEMIF_MON22:
-	case AFE_MEMIF_MON23:
-	case AFE_MEMIF_MON24:
-	case AFE_ADDA_MTKAIF_MON0:
-	case AFE_ADDA_MTKAIF_MON1:
+	case AFE_ADDA_DL_SDM_FIFO_MON ... AFE_ADDA_DL_SDM_OUT_MON:
+	case AFE_CONNSYS_I2S_MON ... AFE_ASRC_2CH_CON0:
+	case AFE_ASRC_2CH_CON2 ... AFE_ASRC_2CH_CON5:
+	case AFE_ASRC_2CH_CON7 ... AFE_ASRC_2CH_CON8:
+	case AFE_MEMIF_MON12 ... AFE_MEMIF_MON24:
+	case AFE_ADDA_MTKAIF_MON0 ... AFE_ADDA_MTKAIF_MON1:
 	case AFE_AUD_PAD_TOP:
 	case AFE_GENERAL1_ASRC_2CH_CON0:
-	case AFE_GENERAL1_ASRC_2CH_CON2:
-	case AFE_GENERAL1_ASRC_2CH_CON3:
-	case AFE_GENERAL1_ASRC_2CH_CON4:
-	case AFE_GENERAL1_ASRC_2CH_CON5:
-	case AFE_GENERAL1_ASRC_2CH_CON7:
-	case AFE_GENERAL1_ASRC_2CH_CON8:
-	case AFE_GENERAL1_ASRC_2CH_CON12:
-	case AFE_GENERAL1_ASRC_2CH_CON13:
+	case AFE_GENERAL1_ASRC_2CH_CON2 ... AFE_GENERAL1_ASRC_2CH_CON5:
+	case AFE_GENERAL1_ASRC_2CH_CON7 ... AFE_GENERAL1_ASRC_2CH_CON8:
+	case AFE_GENERAL1_ASRC_2CH_CON12 ... AFE_GENERAL1_ASRC_2CH_CON13:
 	case AFE_GENERAL2_ASRC_2CH_CON0:
-	case AFE_GENERAL2_ASRC_2CH_CON2:
-	case AFE_GENERAL2_ASRC_2CH_CON3:
-	case AFE_GENERAL2_ASRC_2CH_CON4:
-	case AFE_GENERAL2_ASRC_2CH_CON5:
-	case AFE_GENERAL2_ASRC_2CH_CON7:
-	case AFE_GENERAL2_ASRC_2CH_CON8:
-	case AFE_GENERAL2_ASRC_2CH_CON12:
-	case AFE_GENERAL2_ASRC_2CH_CON13:
+	case AFE_GENERAL2_ASRC_2CH_CON2 ... AFE_GENERAL2_ASRC_2CH_CON5:
+	case AFE_GENERAL2_ASRC_2CH_CON7 ... AFE_GENERAL2_ASRC_2CH_CON8:
+	case AFE_GENERAL2_ASRC_2CH_CON12 ... AFE_GENERAL2_ASRC_2CH_CON13:
 		return true;
 	default:
 		return false;
-- 
2.49.0.850.g28803427d3-goog

