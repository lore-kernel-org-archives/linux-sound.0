Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A769B314A74
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 05:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356641; cv=none; b=uiIXcAYLSusoIqBGvkJydxkiRalcNnQpsUlKc46taajI2sNfzkoBHtIjUgHE0tr9NLV9xNB+mBunap1bvK0767l6XW5NxfwjTmwSBsdMRj7UWagsIIigoXR1Tj8NnbK9DJ0GMWaFu/IALDrvQVOsNG6cYS2DpbaB96AFkuYiA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356641; c=relaxed/simple;
	bh=nPfi1cqWPH+uoaysXqvyZ9RStliWvV/SheA0t8CK5o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKet/K71E+tAQ31pWl2FEA5fXRwR5v1QaQvCW+oEFCFT7E65KSN+RhGLgDNMTGiYRUEcFMwJDK/oyFTlqJH/iGICX2mFdsNSILNwBAmmoUIX5lW2YUHlzM2HC/wIxAARi5lGslF8B2XYWjbsVDSqISm7xrayFh4bmidYhQ+Ll+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=N/lwHWG0; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="N/lwHWG0"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2627269d5so455855085a.2
        for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 21:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356638; x=1763961438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+q/DJ3T1QwmqJRkGDl3IH0ngS+XUlezRwVul2293Q4=;
        b=N/lwHWG0vlmOQZK1CJXo834Vlp8LAurUVv8mPaVTQajjQOrai4lYqvnPahhV109XxK
         +5lJV3lTfV89yN2RaX/AHCLX1RC3rgjd4VY41tNZZJzZAyC/3RGAbrWxG6GXcM4DWS8u
         /N2FFVgWDBmPamBhxgFuzguMlyHFhvyi4yY/p0LO1gztYey6PyG4op9qhQcHSpzgpfRQ
         ghvqW4gAqC/077FBsumnvfg3l86TH+EYJQuaSEpK5RN634iiUQ2dYBiOSi7LvdsfxE9L
         OM+/9YDDWeddxGBKMPLvgMf12fBQk4Ad4TVB0lZw+lX1W+FV3xAs2lPg5B7Z/xWohMcd
         JDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356639; x=1763961439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V+q/DJ3T1QwmqJRkGDl3IH0ngS+XUlezRwVul2293Q4=;
        b=wz30A4ADCpUBXZj2//3itlWvYsc6QtQCLDpdByeglh4GuzD8cQ8jB1W1fE60YMQTHm
         jHgFbXO4CVCVnd5lC1VoR8XuIbflRIN1nijBdarbyTFCjhiija9zXZkXBq6hdaJNAhCs
         JvezhjaFVlZK3Mq/Toc56gdok8UloVxoJqaqY4VFaPQ9yOY3uoNno/u2f3Pwh+T2T13V
         LrZY/EDoCDsl76+CEFq02JlB0Hb27idw/KaTYiKROPop8YBLRGKs+XW/iM+S/n5yGbkI
         4HkQS+TvWzG3pI5Ilhx09RjR4FiidPOsgmw/i8HAmPXPLc9o6xh93IBW7jCXUpDNLXPp
         kI5w==
X-Forwarded-Encrypted: i=1; AJvYcCVwn2vSE/TCN3+WffsIGkGvmT5AiLrmD6HVzgR0aClmL6RWhVLP23JrL3JfaagQUr7inRp7eR4hu9HmYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWcgxE7/UcK8icCF5wi1GJ+c0FEiGK0Af77BPtBIgF4bFNsXsy
	Y2cenZgcC1tzLjrd9Mv4P83UCzpBJEE3oTkfjVWhkh15eGc5XMgFOUGHuJK8PHasTG0=
X-Gm-Gg: ASbGnctGBunbBOF7JVsGQuzzoslIr5bE+ADeBOpKA/r32TL6PObNmn9i6iBerHooDd0
	ZtGuiR6TGvnPqQ4/NFB6htiCcshfIT1xmJ1msqiJ+kDFIXN0unsXh252O8Bkb2jsH9kRndZB6m7
	0ktamXJ+Yy4YjaesiTVsczip6k40cETwIkB/8yiXkggjW2KRPY/zfEw/WfYLcG/IIherrJwq+j/
	5FsOuvvm1l9w/rF0EqfBTlqRnx/CWfKky+3A+FqMl4iObf8jA6GCfKWLaUfrUZ/MeosiDDHBEZL
	Kqf4qL7g651vPAy9l0jzTMdfnw+J7zn3Npw/qoXWPsSpMBcV71RQouLfFuKXnyjV/sp9p/sZB9M
	xMxdNUf+uNCEdnEkcd5DpSdMgYwLHL1/BGqGj9HygT+pB9Ugrpc/MRJyWjshGlX5aubKCPUuC4m
	NjMJ/a0481o/2endAfKPlabb5S1HVFLL+QIqdBz6gbhXFNPeKL9D8qg8bGfLVgAToVZg==
X-Google-Smtp-Source: AGHT+IHKW6VEyuUZwqdEUiPubm0TQiXXe1MtRR/yF1NhaBCs2zxrDW/nVJOBuPjryrUoA+ryeI/pwA==
X-Received: by 2002:a05:620a:28c6:b0:8b2:f228:ed73 with SMTP id af79cd13be357-8b2f228f14fmr146295985a.7.1763356638634;
        Sun, 16 Nov 2025 21:17:18 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:18 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/9] ASoC: codecs: lpass-wsa-macro: remove main path event
Date: Mon, 17 Nov 2025 00:15:18 -0500
Message-ID: <20251117051523.16462-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event enables the main path clock when the mux is set to DEC0/DEC1.
My patch ("ASoC: codecs: lpass-wsa-macro: fix path clock dependencies")
makes it depend on the main path clock, so this event is now redundant.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 59 +-----------------------------
 1 file changed, 2 insertions(+), 57 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 2a814a5d2d1f0..e2e78ff6dd54e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1726,59 +1726,6 @@ static int wsa_macro_config_softclip(struct snd_soc_component *component,
 	return 0;
 }
 
-static bool wsa_macro_adie_lb(struct snd_soc_component *component,
-			      int interp_idx)
-{
-	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-	u16 int_mux_cfg0,  int_mux_cfg1;
-	u8 int_n_inp0, int_n_inp1, int_n_inp2;
-
-	int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + interp_idx * 8;
-	int_mux_cfg1 = int_mux_cfg0 + 4;
-
-	int_n_inp0 = snd_soc_component_read_field(component, int_mux_cfg0,
-						  wsa->reg_layout->rx_intx_1_mix_inp0_sel_mask);
-	if (int_n_inp0 == INTn_1_INP_SEL_DEC0 ||
-		int_n_inp0 == INTn_1_INP_SEL_DEC1)
-		return true;
-
-	int_n_inp1 = snd_soc_component_read_field(component, int_mux_cfg0,
-						  wsa->reg_layout->rx_intx_1_mix_inp1_sel_mask);
-	if (int_n_inp1 == INTn_1_INP_SEL_DEC0 ||
-		int_n_inp1 == INTn_1_INP_SEL_DEC1)
-		return true;
-
-	int_n_inp2 = snd_soc_component_read_field(component, int_mux_cfg1,
-						  wsa->reg_layout->rx_intx_1_mix_inp2_sel_mask);
-	if (int_n_inp2 == INTn_1_INP_SEL_DEC0 ||
-		int_n_inp2 == INTn_1_INP_SEL_DEC1)
-		return true;
-
-	return false;
-}
-
-static int wsa_macro_enable_main_path(struct snd_soc_dapm_widget *w,
-				      struct snd_kcontrol *kcontrol,
-				      int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 reg;
-
-	reg = CDC_WSA_RX0_RX_PATH_CTL + WSA_MACRO_RX_PATH_OFFSET * w->shift;
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		if (wsa_macro_adie_lb(component, w->shift)) {
-			snd_soc_component_update_bits(component, reg,
-					     CDC_WSA_RX_PATH_CLK_EN_MASK,
-					     CDC_WSA_RX_PATH_CLK_ENABLE);
-		}
-		break;
-	default:
-		break;
-	}
-	return 0;
-}
-
 static int wsa_macro_interp_get_primary_reg(u16 reg, u16 *ind)
 {
 	u16 prim_int_reg = 0;
@@ -2395,10 +2342,8 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("WSA RX_MIX0", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("WSA RX_MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
 
-	SND_SOC_DAPM_MIXER_E("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0,
-			     wsa_macro_enable_main_path, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_MIXER_E("WSA_RX INT1 MIX", SND_SOC_NOPM, 1, 0, NULL, 0,
-			     wsa_macro_enable_main_path, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_MIXER("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("WSA_RX INT1 MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	SND_SOC_DAPM_MIXER("WSA_RX INT0 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("WSA_RX INT1 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
-- 
2.51.0

