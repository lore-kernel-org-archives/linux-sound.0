Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106130E0FD
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 05:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356636; cv=none; b=V8mH3mwQXvGUDUGklwP87zB5Y9orBAmipmkL+B9NntaSKL1SCcZz6LBD0wbhcn+XnhUlcmM8rITp+Kg75iJw/765nVwr4IVg26EBiC7lX5gnAOWuwpFWsf4/gwQMmYYrWSJ8CDcmjalQcb7WTpe3auGc+TqzimA9DhSwoS++DdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356636; c=relaxed/simple;
	bh=+7f6/EfUB0qNuJaPGqb/loDCvdGQawT/Zj+p3Tc3sW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K87ly0QrhWGodvwQ3i56OF9fFw7awkMHPJ9UCrYs4FyD8ZaxD5dYQ0ZbzDJdHFuU3hxlPIPZqe7etrMnHVmdgbtNDne5OimmYMpBRTS4pTaVQQZlMuwFtq61H/F0S+3rtLyOwhMrUYc8NCCGJLGPGkTDV6/7JSjiFN5Gt2z+vto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=OJe/OLwx; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="OJe/OLwx"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b2f2c5ec36so35459485a.1
        for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 21:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356634; x=1763961434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOdK1eF0Hvwt85eYnDgcLuM6/1GRm0/JCkihIeiWd9Q=;
        b=OJe/OLwxgRMWXJynhHnscMCTCFNamIhvRsB+2k0EqIcM/SKoNhbs5A2+NSNPPyD6dN
         minB8SYxVp934YIsbQI+qZHn4e6D26+nf0Dh2dRVhjyyCHlg6z+lm5K/S2yU7y+frBlT
         puWu9PwdE2xNo+EwaC6CTU12ByiddT36mhWc0JuVOpoMXILp6GxN732high+a8+bvVx3
         xHnQ+3eMTNgZP2p2971VyonF9OuKAWQdywiIoDtANBCPSSTUYJKaiNHbLwQ+gTKFZ2dJ
         1VdIom1JXtGeKA+pzYjqEOqi+J1AyG8rOTJd+juPB9uF4ON+FuL/AQ8x73I27etr+Hca
         5SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356634; x=1763961434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOdK1eF0Hvwt85eYnDgcLuM6/1GRm0/JCkihIeiWd9Q=;
        b=dBcoOUvUl8jwgEwnv/zk4+bCZBEt9UnT6BBDMFKtQLTOTTeBQ1LdbEWHFYEND8BAZt
         o2ymzhMEn5mdbeIRKbFYnZL9Ur3xpEVV4PXxRr6c6SK1gNDZxYYisjp57ozRq9TSZmux
         MLwG7xICodVJPgwVDkpQtwGpmgN14Z5CH8dtZZYxfaCjQgDmmxEp95NAOw6ir4P0LDQz
         b86xCXNRusovXYV0FJNckNHvQNQG2gWwfDrk5BdLiIhyEzm/cOWHPP6WmxbeeDjGg97W
         ofd7n1VkD3otpQpAmBZUqEhPuiASiEDqywY7iBMQNPImeL8HB/69NqVEjAjs6ifCj86N
         WThA==
X-Forwarded-Encrypted: i=1; AJvYcCXTjb5tFQmzmone1GijDJ2Ow9OXLaFaTm+FGSy3dzl9CKvmzfPrY9iP1iMq3Td9uJFbf/vFBSsN6eO+VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR8Nc3R/K7+nzmFXcFssGnu+R2Rl+FoDjGCFb4mGxqsVE4nfxv
	Sh2+JO8xXXEMGxKMaAf9wECNlzZ3iOqO5i0nxYakI4IfpBg5pgaefZptew5rglFFczs=
X-Gm-Gg: ASbGncsaSpEugV7mm/y+A7P8cmfGAonsU+MgyKVVu1elK1eBGp9E6kaI2Gq4xZBLtMv
	yuAp8MjhqwYiuCGFEfa43sU0FxEprHvceVbmgK+GT1NMHM8vZWSfVVMpT2omcDK2NY0gGyJgtxs
	gxFNWI5eIRCQqfKs0X2flOEErR/oOXyZrDiQTDleUOehsay7gNBdp4LxmYre/b9PfBx5ypQmZ+c
	oQx2OQ0tFfXacNSu9QN1eP+NWp6CCaq89E8KyIL0kfiHym5tlgNQdJzCCAmCcCVnR1QgJkUvuKb
	/0ML//yLwjpw3qjuR0x/sEMI0m6Mr9ZCtAS/D5auDHtuATBU+hW4Gl+R2EqxBldOg4Jz3TExnRS
	4qU07wmJSAAiBxwa7QvX7MrrjvTqnTCgR5SfqqyPNPOGjXH3I/k72ytUVMHFnjkUqxRwaG/N2SQ
	hZ7WtgC3a+Paulp0oA5p9KJ2PbOfhpe7sQdHgo0JJKXxa7AxvxuvuTx+Q=
X-Google-Smtp-Source: AGHT+IHlXzebUqdY82V9w3n+/S11C6VL9ads9Mdbd/RMezxOdbHnm5SUqQobCOulYUjpC5m5dQVF2Q==
X-Received: by 2002:a05:620a:2a10:b0:8a9:b9cc:b90d with SMTP id af79cd13be357-8b2c31d3cfamr1245027985a.65.1763356634034;
        Sun, 16 Nov 2025 21:17:14 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:13 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/9] ASoC: codecs: lpass-wsa-macro: remove mix path event
Date: Mon, 17 Nov 2025 00:15:15 -0500
Message-ID: <20251117051523.16462-3-jonathan@marek.ca>
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

All it does it disable the mix path clk bit, but this is already managed by
the WSA_RX_MIX0_CLK/WSA_RX_MIX1_CLK supplies.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 46 +++---------------------------
 1 file changed, 4 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6f16d54aee401..06570e474c850 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1563,36 +1563,6 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
-				     struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	u16 path_reg;
-
-	switch (w->shift) {
-	case WSA_MACRO_RX_MIX0:
-		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
-		break;
-	case WSA_MACRO_RX_MIX1:
-		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
-		break;
-	default:
-		return 0;
-	}
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		snd_soc_component_update_bits(component, path_reg,
-					      CDC_WSA_RX_PATH_MIX_CLK_EN_MASK,
-					      CDC_WSA_RX_PATH_MIX_CLK_DISABLE);
-		break;
-	}
-
-	return 0;
-}
-
 static void wsa_macro_hd2_control(struct snd_soc_component *component,
 				  u16 reg, int event)
 {
@@ -2475,30 +2445,22 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_1[] = {
 	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_1),
-	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
-			   0, &rx0_mix_mux_v2_1, wsa_macro_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX0 MIX INP", SND_SOC_NOPM, 0, 0, &rx0_mix_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_1),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_1),
-	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
-			   0, &rx1_mix_mux_v2_1, wsa_macro_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_1),
 };
 
 static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
 	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_5),
-	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
-			   0, &rx0_mix_mux_v2_5, wsa_macro_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX0 MIX INP", SND_SOC_NOPM, 0, 0, &rx0_mix_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
 	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
-	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
-			   0, &rx1_mix_mux_v2_5, wsa_macro_enable_mix_path,
-			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
 };
 
 static const struct snd_soc_dapm_route wsa_audio_map[] = {
-- 
2.51.0

