Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2083D226CFD
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490344; cv=none; b=jzxC5xGllMarbP7rA4CQqwyFQ/egs76Q7i8n2ypBuzfOi90CdI/+biIOr3ayXt8qEDnqrvhXNXxXgthulbKxc/4LVRDDj+CZ333LdQvrvxA/DYpx8P5Wrm86eWIkDV3yZe/nwSg69SFl+bCaCRmHCCQNLXVn8Z+9o0l+V2+59e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490344; c=relaxed/simple;
	bh=hCepBdzhR3imrEAzE78ikW1DLTohY4AHQ4vBGIcHc+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upopPwynZPgovXthgC7lYpRL0RM5yISxMP2jt/prVo2m39Sn4QI4II6L7odZ6TPonIv0lnlZe8/MlmEpu9035clk4KHe1pLnZsIUxFeNwnkSeDtNWUXd+gyNfx26YgurHxws5Dpk03R+jnYjHV4GV3Oy/IGWLPpUoqSU5y49EJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gOt2aRst; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gOt2aRst"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227cf12df27so7736915ad.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490342; x=1746095142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUBFebUvWCybPC7Gr0qjTf4RweTwPSwS4K+KvmFiZN4=;
        b=gOt2aRstLpgCHD8VX9jseKV3qfm1ja16UJMv5wCmcG4vFJ9kVjoCNF/uh3KndU14u4
         1kBkkuyGe5IfnBO3kyJNIa7FiRTAAVxWEXEVuqW4o7SO7Yds739k2J0MgkQX/d3Y/IKX
         w7U9QLRNH0HCcb1uBHhgbAczwIngCON4aeNN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490342; x=1746095142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUBFebUvWCybPC7Gr0qjTf4RweTwPSwS4K+KvmFiZN4=;
        b=GNvvhnOirrg987mmCHjVtOtVwMo7Ano3YlhWyxLarf4qzFgm1R+xAEGkitBuuN2uyx
         vbCp6fe2vy9Yk689dxVwp5yF9+YE/6cPajd8vDML/ynX7mOf3E2VsCSoiUfAaPcFu5nK
         SjOvtNVRJoE7mWa7i0S4T42aWQZGNNxFthS2J8z8vJIQ3wADBYTsqK2pnXguv/GOXWdp
         yA/qJ8AZ379y2xniKzGEnR8kVSpe2c5tHh//fOJnF4QItH4THljyBsF3dqobK+OnQfHb
         lbA2GV2BAOtwdTCB2tK6s0vQC8qVv7SC+VayWkPbLDuz73DZWNBykwgCZ2B5yIvzUGEt
         8f9w==
X-Forwarded-Encrypted: i=1; AJvYcCWpqdjOQGZ9FV6qVDclClAPApgadx8BnwOXx0Le93SgbUikJIqFWIEquME5MvNdXOhzGDSmnhOEAYmpng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4N3jZBqh4LShi698sNUpTDPIxBiMzO0aRZpR3BcL3BrQDtyf9
	cXoxKJd6fzn8rKqPmgB2mV1SHdjfw9YrYD4MOVzwD847ftVKY+OFe7To8o0s0g==
X-Gm-Gg: ASbGncsSPTJF3A0G71MiMxmbxws0RHvVswm2MUH+Luxbvz8FF3ZNYPDgh0pJOCTr6tX
	TPi0KhPWXiDgL3TREtmwywaRhjO7W3AClHNWzut+nOsgvmpbvaRmyijU1RrXNyf2S8qwQySvOZx
	Kxihbkp9ZFVLlvFCkYL8ZOq4qLTdaNt1sZiop2FJCghCxbMSVoGFJoJz06MrGkgOf9iOGDapFaE
	n1YoTh6FRb8xkGrwfavQfr0aq9qf96WkGZ/SEWAkpuwQZgj2WU5asiDu8qMhDWJGN6/HTwVPaTu
	s6O/ymL53AKorbX4+PEfY9cuf7MorfHcoyNK8Vkr/vNYXS9snaT74S8BSQ==
X-Google-Smtp-Source: AGHT+IElSoZ8SalHQQZjQTWtW0X8U3PTH+55sn5jfmyk6HGUSjVHCZyjfyjm0AvfmBvEv7DCr/VZOA==
X-Received: by 2002:a17:902:f544:b0:221:1356:10c5 with SMTP id d9443c01a7336-22db47f4dd0mr24547855ad.9.1745490342486;
        Thu, 24 Apr 2025 03:25:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
Date: Thu, 24 Apr 2025 18:25:01 +0800
Message-ID: <20250424102509.1083185-8-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AFE DMA hardware supports up to 34 bits for DMA addresses. This is
missing from the driver and prevents reserved memory regions from
working properly when the allocated region is above the 4GB line.

Fill in the related register offsets for each DAI, and also set the
DMA mask. Also fill in the LSB end register offsets for completeness.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index e7378bee8e50..a3c8054a434f 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -6,6 +6,7 @@
 // Author: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
 
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
@@ -431,6 +432,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_DL1,
 		.reg_ofs_base = AFE_DL1_BASE,
 		.reg_ofs_cur = AFE_DL1_CUR,
+		.reg_ofs_end = AFE_DL1_END,
+		.reg_ofs_base_msb = AFE_DL1_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL1_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL1_END_MSB,
 		.fs_reg = AFE_DAC_CON1,
 		.fs_shift = DL1_MODE_SFT,
 		.fs_maskbit = DL1_MODE_MASK,
@@ -452,6 +457,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_DL2,
 		.reg_ofs_base = AFE_DL2_BASE,
 		.reg_ofs_cur = AFE_DL2_CUR,
+		.reg_ofs_end = AFE_DL2_END,
+		.reg_ofs_base_msb = AFE_DL2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL2_END_MSB,
 		.fs_reg = AFE_DAC_CON1,
 		.fs_shift = DL2_MODE_SFT,
 		.fs_maskbit = DL2_MODE_MASK,
@@ -473,6 +482,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_DL3,
 		.reg_ofs_base = AFE_DL3_BASE,
 		.reg_ofs_cur = AFE_DL3_CUR,
+		.reg_ofs_end = AFE_DL3_END,
+		.reg_ofs_base_msb = AFE_DL3_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL3_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL3_END_MSB,
 		.fs_reg = AFE_DAC_CON2,
 		.fs_shift = DL3_MODE_SFT,
 		.fs_maskbit = DL3_MODE_MASK,
@@ -494,6 +507,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_VUL2,
 		.reg_ofs_base = AFE_VUL2_BASE,
 		.reg_ofs_cur = AFE_VUL2_CUR,
+		.reg_ofs_end = AFE_VUL2_END,
+		.reg_ofs_base_msb = AFE_VUL2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL2_END_MSB,
 		.fs_reg = AFE_DAC_CON2,
 		.fs_shift = VUL2_MODE_SFT,
 		.fs_maskbit = VUL2_MODE_MASK,
@@ -515,6 +532,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_AWB,
 		.reg_ofs_base = AFE_AWB_BASE,
 		.reg_ofs_cur = AFE_AWB_CUR,
+		.reg_ofs_end = AFE_AWB_END,
+		.reg_ofs_base_msb = AFE_AWB_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_AWB_CUR_MSB,
+		.reg_ofs_end_msb = AFE_AWB_END_MSB,
 		.fs_reg = AFE_DAC_CON1,
 		.fs_shift = AWB_MODE_SFT,
 		.fs_maskbit = AWB_MODE_MASK,
@@ -536,6 +557,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_AWB2,
 		.reg_ofs_base = AFE_AWB2_BASE,
 		.reg_ofs_cur = AFE_AWB2_CUR,
+		.reg_ofs_end = AFE_AWB2_END,
+		.reg_ofs_base_msb = AFE_AWB2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_AWB2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_AWB2_END_MSB,
 		.fs_reg = AFE_DAC_CON2,
 		.fs_shift = AWB2_MODE_SFT,
 		.fs_maskbit = AWB2_MODE_MASK,
@@ -557,6 +582,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_VUL12,
 		.reg_ofs_base = AFE_VUL_D2_BASE,
 		.reg_ofs_cur = AFE_VUL_D2_CUR,
+		.reg_ofs_end = AFE_VUL_D2_END,
+		.reg_ofs_base_msb = AFE_VUL_D2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL_D2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL_D2_END_MSB,
 		.fs_reg = AFE_DAC_CON0,
 		.fs_shift = VUL12_MODE_SFT,
 		.fs_maskbit = VUL12_MODE_MASK,
@@ -578,6 +607,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_MOD_DAI,
 		.reg_ofs_base = AFE_MOD_DAI_BASE,
 		.reg_ofs_cur = AFE_MOD_DAI_CUR,
+		.reg_ofs_end = AFE_MOD_DAI_END,
+		.reg_ofs_base_msb = AFE_MOD_DAI_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_MOD_DAI_CUR_MSB,
+		.reg_ofs_end_msb = AFE_MOD_DAI_END_MSB,
 		.fs_reg = AFE_DAC_CON1,
 		.fs_shift = MOD_DAI_MODE_SFT,
 		.fs_maskbit = MOD_DAI_MODE_MASK,
@@ -599,6 +632,10 @@ static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 		.id = MT8183_MEMIF_HDMI,
 		.reg_ofs_base = AFE_HDMI_OUT_BASE,
 		.reg_ofs_cur = AFE_HDMI_OUT_CUR,
+		.reg_ofs_end = AFE_HDMI_OUT_END,
+		.reg_ofs_base_msb = AFE_HDMI_OUT_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_HDMI_OUT_CUR_MSB,
+		.reg_ofs_end_msb = AFE_HDMI_OUT_END_MSB,
 		.fs_reg = -1,
 		.fs_shift = -1,
 		.fs_maskbit = -1,
@@ -1081,6 +1118,10 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	if (ret)
+		return ret;
+
 	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
-- 
2.49.0.805.g082f7c87e0-goog

