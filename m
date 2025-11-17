Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FA42DC333
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 05:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356635; cv=none; b=rk23jdofpLOVHJvia4aMs8LNBUy4pDDhEeka4dKfVmkdRQq7EY3mICp4jH8LPkNJdDN2fHthM61WcugJ3skhQPUGfXyPYpIEEeu2W4Hh9adefe7GVkSC9V33lFUIFt21B9Fxx+fBWrOdjP8SE4Qh9tuU9eUjOQ9U/7GKLbpYbrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356635; c=relaxed/simple;
	bh=jMetAjXswfKk89xDttBgjMjZ7rBfdZBoYOr/KWndOtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxqPuIOOZhDZjNOTAxeooRiPx4WQ6NGY/QPRo+hdZaYWJvLLMcoOsdqdGYYpZltbMVoM/LdMNZFABtIA+ofRTzO1pl8l8wgCjt54TTpjpWlKB0QGT5EY9ZX11/QdqG/hy/yFSENOinllmBmdIbtN/yeMjNY1QHKMH27V47t6sdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=PiC47BZG; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="PiC47BZG"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2ea5a44a9so76251285a.0
        for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 21:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356632; x=1763961432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zPoFzhzfSfJq6z3nwCCFRs05FcCD1UdEmhhsy+Y9N4=;
        b=PiC47BZGYCUlA1JFvPI6JxGd8ZrMt0PitZyHe2dV3YKzvS4JyCLQsV+xvo/Kf1COEb
         LGiXqwdsgeyxrsYdyCXKD39HtXiN519niHCjdte0aC27jgHMgXhodHz3AT2M0uUTK9Bw
         lxAKxUHsbmbp6qxQMO+fu/T4G7QqDV5iWy+UBUitgtEwNnl2jwDB/K8Fq6nuzJSY8tnK
         Tp115MWXZj7ujr89Goie+g3gXOPV1dBL2HzKzplRGz1JxgYNAi0aoPDZ29j7UnvdpSHC
         nJWBUupmqRw9+LW9Az7+s/TwHe5Hmq9d1eEaZEaGfKRPkh/OX/gHsOo+y//lRfXZL1Xj
         LrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356632; x=1763961432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zPoFzhzfSfJq6z3nwCCFRs05FcCD1UdEmhhsy+Y9N4=;
        b=q/OwbnuQuSasoMc0E+nUpfSDnX1q+RKflGVnxPxXCG//DqflROvTpCEUdb9IXmAm47
         Ap++ZvQ2fStHg7lDJMaN4m4+HVmpwmuFOhrePmWz87HrWSThfYIXkgeLTrckQCUjgVQr
         leOISENjngwgkbt9WR29RxAbGe14lf7VWvnA0Yr65VIfcHzxn99N4UTWYM7faRMIxOjC
         ILVN5ZlVgB/YSdS1OBpCrGPJ878QCVL/4kTjWp47HjOcoO7MmlZHw5DiXL/ObGP33yyV
         cucXdXQvNvixat01ulgKfranvKLWJKa3E3fXPE1ZFJ6kquRGvwiijvvD2UFlmDhk49e7
         yJmw==
X-Forwarded-Encrypted: i=1; AJvYcCUnyrF9DwN0eTpIMKs0NlQcprm0HqqkYtFzi+8OIkU2sl3FZc6KZbbsOCxQ7xupsYm2z28TUGnvZ94oTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziSKzdaqVU/rInTmhKf2BMZr6E922WAQw3ZmMpDdMzwE05O25m
	d/Pxpr2UGmeNWAAPxrVbMk450dIek5hQJBeCQo3IsheASr04OcXVS0JNNIxqyxcg48g=
X-Gm-Gg: ASbGnctgOgn1vCU8fMyy2S+lqGMXWTKZ7sA3MoRNrUc/eYz4HbjLRtiH/Dai815Nbv5
	6KCl/+tLOsEul2CFzEW2OB0jhW9S07s8JzkRud1gW5oMmW07HV3JDI7+AJKLEQJ6xY4q+LKmiEM
	7sogMCk6zrhmidwggQdxlq2mXpGcCVaPCzsisy6wFVgm1NgWBRUvJO/nfVJL8DdfXCjKlk7H0a7
	sPkE3DuAxyYjYEbLcbHr09wjP/L9vXV884ZMlwA9IG8wRrqILL9GaQNckPI8tTLLPalC4+dXOLM
	N2RgMkLYf8HwuIvSr9bQj/+BxfUvOJxYjWovWbC4UjOIJS4p9WgA+KWEW0xpJmaoceSfpfzbCwx
	kaCg30nAG0SpueH8U43PnMP8eILwkKQcA6m/WgEtY442Sr63qZtVGizQGzNueMPNAB8kcPKnBFX
	Hq2mZKCMHrC1lHFUZDUlnUMFOc4ZKexnG4NrZ5zPuihR+A2auVhsEIUVTmf25Gu4oHiA==
X-Google-Smtp-Source: AGHT+IEKEHjgfMdQRDp2kMcmdyptWSAZDc1BLteCr++y67jIrvfuS9EbngFPfnmOmRhGKb2Nu3/DLg==
X-Received: by 2002:a05:620a:2908:b0:8a2:a5b2:e3bc with SMTP id af79cd13be357-8b2c31e904emr1313924985a.89.1763356632100;
        Sun, 16 Nov 2025 21:17:12 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:11 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/9] ASoC: codecs: lpass-wsa-macro: remove useless gain read/write sequence
Date: Mon, 17 Nov 2025 00:15:14 -0500
Message-ID: <20251117051523.16462-2-jonathan@marek.ca>
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

Reading and writing the same value to this register does nothing.

Looking at downstream driver it seems there was meant to be an offset added

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6e54c1beac8f9..6f16d54aee401 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1567,17 +1567,14 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 				     struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 path_reg, gain_reg;
-	int val;
+	u16 path_reg;
 
 	switch (w->shift) {
 	case WSA_MACRO_RX_MIX0:
 		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
-		gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
 		break;
 	case WSA_MACRO_RX_MIX1:
 		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
-		gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
 		break;
 	default:
 		return 0;
@@ -1585,8 +1582,6 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		val = snd_soc_component_read(component, gain_reg);
-		snd_soc_component_write(component, gain_reg, val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		snd_soc_component_update_bits(component, path_reg,
@@ -1931,7 +1926,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	u16 gain_reg;
 	u16 reg;
-	int val;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
 	if (w->shift == WSA_MACRO_COMP1) {
@@ -1971,8 +1965,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					CDC_WSA_RX_PGA_HALF_DB_MASK,
 					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
 		}
-		val = snd_soc_component_read(component, gain_reg);
-		snd_soc_component_write(component, gain_reg, val);
 		wsa_macro_config_ear_spkr_gain(component, wsa,
 						event, gain_reg);
 		break;
-- 
2.51.0

