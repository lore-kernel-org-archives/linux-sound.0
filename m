Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E8223DFF
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714577; cv=none; b=umyqWKvzoHS/K7hRt2zyDoEE/NqWMPym35CU0cWUq+GyDw7FsftMCR6MSaYaxQGUtE8ZU7SRPqz+rdZj1GyK1zK95FTYXEE2n42pMsvGHpYi9S02BFlN4/zfWqNRx1tBhcdJMzOnGAsOJzsh0g+WiWBEI0390lfTqUUK2Bpdw7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714577; c=relaxed/simple;
	bh=7lBuRSPEgmZ9a+/jESzGhJRmqNmmVg//QwiKc44LjWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXh7jWncAUmY/JzWWV6er9z+nhbcETUWIIXW8I/Ra9CXGr7DENv8s6adoGONuIF8/zacG8XHLvswVD+GwedL5W9x0yp/6dhSQpf9jcmqTcrS+rk92u+ZD8WPsgNJia457YplhYrVfDnTH08r8XEA/rXW1KiemDTYHYVi4p9nbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YplBsCRS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YplBsCRS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2350fc2591dso5855905ad.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714576; x=1750319376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kzq7pTlEyk3DwCXw2bvXC8EVAUqzh3hKoNDLtBSSl4A=;
        b=YplBsCRSsrSQcYtlzVGkTI8xVSm9k97MBTbxpd33Uh09r2IGzZcEiuwjMWj5WnML5P
         WsptQaVwVFgp/K/tK41NgIZrqp49XrsP+Z6SatnbU5fo63mE9ZkgjdY/5/Hm7z9sqGiA
         u0z5QQS78a2nGr0NRRjQiNsgIn+ihhEzwVSXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714576; x=1750319376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kzq7pTlEyk3DwCXw2bvXC8EVAUqzh3hKoNDLtBSSl4A=;
        b=LAZZasjJVX7YQWTEyoZpg0f43ArMrZ7ueNolXzv6isgKdS3VRm70jLRpROJbRw0oa4
         7GQ4+yvAjgNVxzvGyv8poyWYTqnHLI86wHlTyP22XWiKDEcXlMz3iouaAROG9/mLVELg
         LbaVdS+JI0L84tkBMJjdtzsUnlIuCTXEhN3WmqGM7beu7EUUIQqvYFgEuyPJjFytICwA
         6KBM0U8lBDfgbFVOa8gQzSxQc42m8zLcerio8f9lfEd4F9Zk3gUxo1VNYQ+ExfMb1sjK
         +cwfU6Vf6kpLTEy8Af6pNLGhHu0OxrvRXvM/IyH4ppwpNlwowEzclgyTN/uK7yF3AOx5
         IeTA==
X-Forwarded-Encrypted: i=1; AJvYcCWErmwHdWajlFRjomWyAgNbVMZrReADnqEP35W94y6LTD4oPkZ1SMfEw3tUZc31MAu97HVY5f6ujEKDlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRnQJKoq7zXPEjCo5qqZJ90rxOjWFflKAkM7RBhrxBBlzivpx
	i7ydvxqJf+kdCPAod9AebOKTP/gweUnqMZwtYTnF6zSSgkLwV1SzRkO6HC66EwX2jw==
X-Gm-Gg: ASbGncvfmeXTb2bfS6Xz8BnERwRmNFndbpjyMyA79pI4O77hG00hNb3IAmNqOffN8EG
	B2hscTKqexScOu82C2HjU3gHuO9gHfFXJQ0D8+37rgKKPvDO2ZEDK8zjm4DRR//0UqKfGeye+cB
	1libo1zlf9LtOpjpwGFyzyEcNUNKznPgsCC+JMwIDcUOr248tQh3mzolVdfaj28axNpKZyWgrji
	6z3dGuEFBjpcoSGjcldqhi1J9dMg2tWRo8M2TFMmj8ijmKuL+1H/WYInjuANf6SRiVawkYfl6cg
	mHEDKgg7ImUVExrdC1ZBikCUh6pdE4Y2jZZ0gACCmBYUzRGpwy6qtJYqeFhNgD7elR92Luyhx/B
	Tgoo=
X-Google-Smtp-Source: AGHT+IEN7g9Kd2emZe+eC0bnFztivo7RuDUPLjNRq7/X/nnou4s5GK5KxWmXAWf3A6OG+nnmmIHeYQ==
X-Received: by 2002:a17:902:c941:b0:232:59b:5923 with SMTP id d9443c01a7336-2364cf36e59mr38491355ad.23.1749714575691;
        Thu, 12 Jun 2025 00:49:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
Date: Thu, 12 Jun 2025 15:48:58 +0800
Message-ID: <20250612074901.4023253-8-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes in v3:
- Rebased on top of "mt8183-afe-pcm: Shorten source code"
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 9b6b45c646e6..7383184097a4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -6,6 +6,7 @@
 // Author: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
 
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
@@ -432,6 +433,9 @@ static const struct snd_soc_component_driver mt8183_afe_pcm_dai_component = {
 		.reg_ofs_base = AFE_##_id##_BASE,	\
 		.reg_ofs_cur = AFE_##_id##_CUR,		\
 		.reg_ofs_end = AFE_##_id##_END,		\
+		.reg_ofs_base_msb = AFE_##_id##_BASE_MSB,	\
+		.reg_ofs_cur_msb = AFE_##_id##_CUR_MSB,		\
+		.reg_ofs_end_msb = AFE_##_id##_END_MSB,		\
 		.fs_reg = (_fs_reg),			\
 		.fs_shift = _id##_MODE_SFT,		\
 		.fs_maskbit = _id##_MODE_MASK,		\
@@ -463,11 +467,17 @@ static const struct snd_soc_component_driver mt8183_afe_pcm_dai_component = {
 #define AFE_VUL12_BASE		AFE_VUL_D2_BASE
 #define AFE_VUL12_CUR		AFE_VUL_D2_CUR
 #define AFE_VUL12_END		AFE_VUL_D2_END
+#define AFE_VUL12_BASE_MSB	AFE_VUL_D2_BASE_MSB
+#define AFE_VUL12_CUR_MSB	AFE_VUL_D2_CUR_MSB
+#define AFE_VUL12_END_MSB	AFE_VUL_D2_END_MSB
 #define AWB2_HD_ALIGN_SFT	AWB2_ALIGN_SFT
 #define VUL12_DATA_SFT		VUL12_MONO_SFT
 #define AFE_HDMI_BASE		AFE_HDMI_OUT_BASE
 #define AFE_HDMI_CUR		AFE_HDMI_OUT_CUR
 #define AFE_HDMI_END		AFE_HDMI_OUT_END
+#define AFE_HDMI_BASE_MSB	AFE_HDMI_OUT_BASE_MSB
+#define AFE_HDMI_CUR_MSB	AFE_HDMI_OUT_CUR_MSB
+#define AFE_HDMI_END_MSB	AFE_HDMI_OUT_END_MSB
 
 static const struct mtk_base_memif_data memif_data[MT8183_MEMIF_NUM] = {
 	MT8183_MEMIF(DL1, AFE_DAC_CON1, AFE_DAC_CON1),
@@ -764,6 +774,10 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
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
2.50.0.rc1.591.g9c95f17f64-goog

