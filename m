Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2581AB4
	for <linux-sound@vger.kernel.org>; Mon,  1 Jul 2024 07:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819593; cv=none; b=ikf4cXwy5vme5cprw3n1zVaSLaDFsSJwwb1jbBLlaWf61fvxyOfpEyrAdSsylEbgNVnTLvMe1IeqTYQ4QYrGex7LmnifpnURU+igbt1So5NmFH3FznhzV9Z8qEhadGSOOZlOXFIOQrccljgEwt8ytO4TDtPXETu3yfPLEMAxnGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819593; c=relaxed/simple;
	bh=czPn/CM/13NiJAbbrT7HCu/fRfwdImlVtdxXFtiZJ1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKdP+ag3XHGkto7st5J3hEgTKsJQHyzfneC0MNKWvh8U/kS19AF7pH6cPcHFjU/XSBukfPRqtV5SOrD3FpfQz1PD7lYuZRMx2eq4Yzh+TeJSfnK5gWV5Jtw1XXmLdWOgHFIStX0XKg4Eo2cPJtIgEOYj0JWmDKskgDpv/dLKAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hch9Z4qC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hch9Z4qC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3629c517da9so2261235f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Jul 2024 00:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819590; x=1720424390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGvHzxmQKKMhIxfo+E0orJJbLqAKfrzT9/+PYfiLJl4=;
        b=Hch9Z4qCxuvSg7HGBm99ADPhGlMfet9v9OcZ+h98fwhVCAs0yRbtcpLzT2nDGUh+8O
         VHA9LnuclfnnYKoO0uBq1I43FWsTRVQwuAo++Qx4/OebX/kgBtHYKUiE8k1dxzDVhzNn
         svWI0dZAKVfT58q3mRkVFqER3zrsQyP1RJsQ1qlyRG4Bf/hi0XovmOlH/QJDGzFTQozI
         LWJDs88x3n9b+rF8Hxy7uUByoWZulOKy7SvhNL/EuYEHx6Nd0AFXDSYwwDV3Jn1YjMZy
         HsF9rH1GfCyvQOd0Jh3GPKIFx9sgEa7idzd2kcj+p4/z/SeFXK9wl4AR1gefO+yGSODj
         Gv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819590; x=1720424390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGvHzxmQKKMhIxfo+E0orJJbLqAKfrzT9/+PYfiLJl4=;
        b=LMsL/MqEuO0RtB4LNr/Bc64VMCR92lkYtnzvmTpLrmrk3BaSjmdniBODyuXjNVTuEX
         F2xWDdbcpEmvUWGsYTISFwI1T0d7wacUl3B9ZyKFwQfNDrCWMEDsZJToSqkLPbjirKyX
         zePV6RPaO5qnXQoR0aIEDWM2yf9ZrYKyz2t9hrQwS8oeIxaUhjCAF7uyiLWd1VUFJ1Vp
         EZbBPRYZjuCUIGJwT64hBc9anRyrb8bbJen6oBpvPcLZN13lr0dnybkLWPDDJ54D/36h
         gz2s4ObGJiMJtZ63ftq5GkNQg5Xy30sE/nQQN++AbkffwD2Xjn0IZ1N3IisDcq1B4WgS
         XYRg==
X-Forwarded-Encrypted: i=1; AJvYcCVx//XU/c5eN1LTjDlQBpxHRGSexsLZ9A4mkIVjohpVqI5L/Do23+IgJbO5kT69njMhoL5wZutmx+/citBZMM6kROAUXaArP2QF6K4=
X-Gm-Message-State: AOJu0Yzd+XLFyy4uIJm0xWC+rNY8WYfQCZtj411j2QKD2G4XjNY8+jOb
	3IVmb10ShtTwXA4gDXUMU9k8B5MfJFiZRk0aZkKvIkUdNWF9IUNNNwgXJ5Zy4qIDxizQjLaZuAR
	p
X-Google-Smtp-Source: AGHT+IEFUHmMK/zO4EhXYonANzhb1VC398eAUKhzg9PoG26Tmg8Yf/8gaFSAOmXzJqc3on/yu1St1w==
X-Received: by 2002:a5d:4d48:0:b0:35f:1d5e:e2ca with SMTP id ffacd0b85a97d-367756bc8c8mr3497048f8f.39.1719819590156;
        Mon, 01 Jul 2024 00:39:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:35 +0200
Subject: [PATCH v3 3/6] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-3-6d98d4dd1ef5@linaro.org>
References: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=czPn/CM/13NiJAbbrT7HCu/fRfwdImlVtdxXFtiZJ1I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl0911QVEpEmn3e4yxo9c43S/NXMWVmdZzHgw
 lt+1KTUZOiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdPQAKCRDBN2bmhouD
 1314D/9pLEdlN9cv+0mx85JAB9c8ARYBd9ncY+xyUMR4nDwAUg8uSIfnylTdfdRAGD87pVN0XYl
 tcp0+uQ9I23yWSoyjsdM1Bs8UIV8L6EKCAt38pvfyVJFdeaTHj8AndJXDl7Ki1O+7gWNpP/zVXC
 u2Wq+LHhgfgcZHbV/nD671ndzIiENpNGp6slZAWkqhqNAEC4brOpHkVEjpb13U/1ZwQilSPFIaw
 3t0HtgVQjpysrCQMNKeLRN59D1NBVwFsC43Cq7AUbobNF4t9FOTEdJx/kHymxASTdfDTydIJdjP
 +a8vq6KgBXcGN9LAqALmZsYapi6I4bTWzOM6oKmLjnOWqFNMwTuFcTeXI2Yd3eEORH4UbgLbnH9
 cIZRfYAVfpClqLXZaoYnPhNv5r5Qt1FhIIuPdI//MmfXBqzuEJyxc5NgRI+pDQReRO+/mViDe8p
 ffO1bz+KJyWHesgrS/vPT9zyOEFzSYOdSqYJjz8LQ3NJrnl164MLsbmM2owu6LzvL9Izbt8dgrs
 yciOwnj9Jsg6bYoSOn4FrYloVNh6NomNlB8Rr3PhE984sxSPkFu48TAf8/BqUi6z6pctBWC+E7L
 ZouoM3qZCjG1CkL3aBYn6RxoDun3XM0wycmP7USHs+slfdHRRNmTN6Jk1wrodDv0PR8qwkj1616
 Jdl+13eWO4IMv0Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The driver has static 'struct regmap_config', which is then customized
depending on device version.  This works fine, because there should not
be two devices in a system simultaneously and even less likely that such
two devices would have different versions, thus different regmap config.
However code is cleaner and more obvious when static data in the driver
is also const - it serves as a template.

Mark the 'struct regmap_config' as const and duplicate it in the probe()
with kmemdup to allow customizing per detected device variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Not adding Dmitry's Rb tag, because of major change devm->cleanup.h.
---
 sound/soc/codecs/lpass-rx-macro.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 638f3995a364..d4d7e02db83f 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1663,7 +1663,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
 	return rx_is_rw_register(dev, reg);
 }
 
-static struct regmap_config rx_regmap_config = {
+static const struct regmap_config rx_regmap_config = {
 	.name = "rx_macro",
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
@@ -3847,10 +3847,16 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	rx_regmap_config.reg_defaults = reg_defaults;
-	rx_regmap_config.num_reg_defaults = def_count;
+	struct regmap_config *reg_config __free(kfree) = kmemdup(&rx_regmap_config,
+								 sizeof(*reg_config),
+								 GFP_KERNEL);
+	if (!reg_config)
+		return -ENOMEM;
 
-	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
+	reg_config->reg_defaults = reg_defaults;
+	reg_config->num_reg_defaults = def_count;
+
+	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
 	if (IS_ERR(rx->regmap))
 		return PTR_ERR(rx->regmap);
 

-- 
2.43.0

