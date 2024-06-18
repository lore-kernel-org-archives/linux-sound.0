Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B02158DD8
	for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718718563; cv=none; b=QOTUBZ6SoQyc+4sXv3rb6QHKgTc+Wf2VwykQDuV0WeFL2MN4KH4l+L6WL/9lcgF7FMNXJXj4kjMXjUBISrjW3irG8XabIsFjKZdpohHQDzy63S1udC2q7ApKYC2X5tCy5B6afI8FSz+H06vmw+lXyEgzvMaCStCMpVLOYKj+Yvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718718563; c=relaxed/simple;
	bh=pqG99NiBWHTOG1yuOzvntktNTElMoxg2aP15S8zgv/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khy5hN0u7XXQLLAheuHVofUvlxXc+4B5fP76ByjW1AI0UILLCfy9TTL/Iiq/B7edahU5hfYyu7+CsYsUbB12YB+dc2LxnoCa/IdmU6hHfjqk5eZZTGOfwTjo0I920mM5sgU9rQtUnFV6p8IAi8qUSDauTsJPGy7spjuge4tBKm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D6HayRqg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D6HayRqg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57cad452f8bso6193255a12.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718718560; x=1719323360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cq8BNVyT1lxgezLa3xN77vJrD/ds6UBuIoYNpcAHr8=;
        b=D6HayRqgWySabRCz7glCcAMWQzIKkuFSoKf30rQiv+mErs0sT5XtkxwePhPA61PnRe
         rUD/OTH6NKr7hYXCZxuhghH4MiX9QWfzzC1Xs4Xo/XAlDUxS9KC8o1KFp8UgfpMqLIKW
         wsNpCPPJXhjl21zjzddyI4SF1vyPYGwWqLGy0BP2RHQMs8K1BM9D4dnEQGQEaojRU620
         Z2oj1Qb2n9a2dw6dwaPFB1JQFIJ3YlcBYVQGsasb9nGCq6kufvnja+ZH/UeYJFXk7DSf
         G0ls/TXO9DXhzhueuMd2jXX/VsNjHIaomeZWzKZSUMTgR+veLuPUThUpMZpqTXBjqLaH
         0TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718718560; x=1719323360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cq8BNVyT1lxgezLa3xN77vJrD/ds6UBuIoYNpcAHr8=;
        b=EmhyZebHKSBy2CPWZWRdvhcjVI8tgTKEtqq7jSS267veQ2AaCA/THWFHzlkOOtOKxO
         vGxXdWeJDOUNk0xE+d/M5vRCqJSvhIrODeGCNBFXiaootffkvyh999Ld5VS03jnniXQS
         qoSNOtXX0Kr7fZiB4Pn6/QXacfS30ZHC6NawA9rOgHwS89JSGjRGX9LfOMxKgqsyzETb
         EZEgKOjBg6eBMlpnnASUubeqdXHcAdK+svV9JRVaUBWx3bv73XyQb8G11Nh5skSVLsr4
         1722D4DzH9XIXwWvqeFSOCyFuALDv8Toa61CNJK6NuhuIEqLt+1/Px3UkLn9YBnEce27
         Zunw==
X-Forwarded-Encrypted: i=1; AJvYcCWG4FollT9NGQ+LAOjjNJsqu+QdUxMWV60KanqN36K7PfrqHYjHfbPXSmo3CCDdzjXq/DaltD7Wun6uvCVRAjL2PhaZnISr0zBpKrk=
X-Gm-Message-State: AOJu0YzllU3n8FToiqZ+VvXgMSjbySj0vCTwOa/pGJnN9MkGMPxUMFoH
	1H55R8UGnDyzEUc+AhjxZoBE36pwh77bN6dHOnHYziCKBlrNQSJIAnEdXS5+TRo=
X-Google-Smtp-Source: AGHT+IH06zBAori5j78Ra33E+DRN1FHFA/kbfAGU8rA9O9veM5BnTvopHWzqDv6cMnW1092Kp2+/mw==
X-Received: by 2002:a50:cc9c:0:b0:57c:6efa:8381 with SMTP id 4fb4d7f45d1cf-57cbd6a8656mr7531606a12.42.1718718560123;
        Tue, 18 Jun 2024 06:49:20 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cbdfe1428sm6678397a12.27.2024.06.18.06.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:49:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 18 Jun 2024 14:49:01 +0100
Subject: [PATCH 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi
 channels
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-lpass-wsa-vi-v1-2-416a6f162c81@linaro.org>
References: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
In-Reply-To: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5876;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=pqG99NiBWHTOG1yuOzvntktNTElMoxg2aP15S8zgv/o=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZBcvMB+6ZwW+EnK6qwhD7CqaHmPJAw6oa11a
 z5zg0bOOBKJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGQXAAKCRB6of1ZxzRV
 N9zXCAClFg7FM8O1767qza2EL7Ysm1biOGceunEJhBnkfwOpoPartajuKcOhnni0xR17yVoOLLV
 IDyZZZO8OUeftIbUjGus18unyLvGPtlSoW/H7NkUqdomkU/KBmFB6A8/2geK8t5RGyy4JuyVlTJ
 lAmoYTp42swJJKt7TxbwriZS6uyb+L93hGiZdepqMu1n1Eoe4DwzWwsUJQPM4L64sOvdu8J9EA5
 3fI6weJ1eh8rGFkdhijE/NuR0OAWwbbXEDvm+XtmO1GOPVTzUpgI2u5SopoJ4Tuimn5MDxWwwxu
 e6OhUD3ewCUb+lIPNzRt+s9LTXM/U23Dc7nmmqzMulpccknT
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
paths eventhough we enable both of them. Fix this bug by adding proper
checks and rearranging some of the common code to able to allow setting
both TX0 and TX1 paths

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 105 ++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 7b6d495ef596..7251fb179db9 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1162,6 +1162,73 @@ static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+
+static void wsa_macro_enable_disable_vi_sense(struct snd_soc_component *component, bool enable,
+						u32 tx_reg0, u32 tx_reg1, u32 val)
+{
+	if (enable) {
+		/* Enable V&I sensing */
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
+					      val);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
+					      val);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+	} else {
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+	}
+}
+
+static void wsa_macro_enable_disable_vi_feedback(struct snd_soc_component *component,
+						 bool enable, u32 rate)
+{
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 tx_reg0, tx_reg1;
+
+	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
+		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
+	}
+
+	if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
+		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
+
+	}
+
+}
+
 static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					struct snd_kcontrol *kcontrol,
 					int event)
@@ -1203,45 +1270,11 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 			/* Enable V&I sensing */
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+		wsa_macro_enable_disable_vi_feedback(component, true, rate_val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* Disable V&I sensing */
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+		wsa_macro_enable_disable_vi_feedback(component, false, rate_val);
 		break;
 	}
 

-- 
2.25.1

