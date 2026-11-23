Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477270;
	b=ABLw6xPuQ/GWI1H3uT4+d+l1oaftRTW5XtQ24am1n3UtKq+Ov+evdB3e3GaXORoRsMsO
	 Lra8v/R0vrEtYOTWni2nge/S/rT/OPcb4AbHDQo7vo+71SDHeDPkOx+3E1PsMhL4iuHIb
	 WS8SgBRZS68I8eCkcCHkvq0tmNhTs8NrEqpQAxMn0IGJ/daJ29dcGFViCS/X2dPdsHgRJ
	 qggtYQem+ZPWJjsT++vQHTkQJbnnwTt7r0HEwIvPOB/fNNF817O/M4G7AY5SesnQhns7B
	 yh/tcGKlXZLDN6AQePoniCO4ZS/flEZPNfhW2WJxDBqPb+VrT8GEXZD+T5B8eoNK6Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2vKrN6bgTHQAPUSAXLB2sa6FXef6bZRnfsxB2+/0yI0=;
	b=QApIWWUEe0q3N0OgjAEQciDAXKAxNmaElg4n/7n4+b7kgg05FzFlmRJk7XiiDysql1tx
	 eN0yuIkLGEqdY5GcJbcTFFsij/og5XTTQex6OfOOzsTOUqL13gFrIpIx2QS/qQLhW2UsC
	 MZyKUUtyfpt/vmBozH/02r7GbRxMfEx4GuyUE5RBJPc3PpeBz7hSnmhX0HdVnKXAErOlI
	 FfSym1knIm1MlfsT6B3McTCo8wya8l6S9fqwDEn+4umKjSy0AqO4qnBYOBzi/Kb8eQiDi
	 j+IVaM89VOrrzN6tWXTc5o8CD5BGdEk0wnCD3K3VSB9hAK2+679o53lOq98mHf/BIMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFe8Bkoc;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD0606A331
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 23:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CD0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vFe8Bkoc
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso27750175e9.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 15:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477268; x=1796082068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vKrN6bgTHQAPUSAXLB2sa6FXef6bZRnfsxB2+/0yI0=;
        b=vFe8BkocctGKfGnTj7d4CBl1sVvenYczE6VUmL8x2qVRoOUO8/Qtc8snFeCrvwWZKd
         Au0SH0ZRw67J6IoV+e0dDDzMkSZ5hF82jRGXOqYJqYdd0VqUWPKFx8T6S8mB3lkhd6ob
         DgRCVW602aWGLGom1Qvxc8GWIMi+urGC/qVgFoK9GddS0yoftRVk4Dqr6/NfLx8aI1il
         EhRCKGWNVGFenqp0XoTtJwVxVMpiT6uIz0VSHcbNtHY+N9895EGOT6yKHfS264cFy9N8
         +i1g450fJL/rul1GZELt1bDXAD7TyCGXnlzOB//2YSdPa70Umx5lawuzDL+CKGHEEmpp
         /CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477268; x=1796082068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vKrN6bgTHQAPUSAXLB2sa6FXef6bZRnfsxB2+/0yI0=;
        b=KnApQ+OZ5SbpaeYoJGjc5m0/jZ4zrpI6T58F+LleN/H3BLjOVS1TWeDnKWWSuMz0wW
         eUH9lnQEXV5BCteohlGX2dnGajci9Rx0d5NAVpJ79q2WN/eiQ8VH6aq957Y0VAqS8tNU
         3yjYV+fRlX2N9IlrJmHQ0R+lMNIiKaCH0gmGvtqKgI3jgDEZ5sirIUqxwmm5ND2a0bKV
         2gUmUGKZJ5EPjpJExisfS/cv3lYFCtSv2uqpKdsXch9QAo/Xy9rP4x9lDsomjrW78MH2
         /yhmkTfQewCEPS/w8AVoLUDFUIC2AepYxt8XcI8vg3migtcVzWrlod5oxWcci1GKwefV
         Fzsw==
X-Forwarded-Encrypted: i=1; AL+hErF8DH2AnYZxp2waNQeBlvHQDnrwOoUliQWLI+MgeMekwGUC+ZNTG4sPrrMAB+DzX+BnkcJ+MAJKvQANDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VWvHxcqLONrhkLJ14IHu0vgDJYMiPmJYjHQGhZUlbcayRABGU
	666dekPINHC6jWyDNIqmspKgRWd1/VChiaqBgR3Gc/7juzh5ewRZlCc=
X-Gm-Gg: AZFdTZdJOw/AMpV+FJoVE7/Lxoe7k8RZHOQ5YEhVD8FoZwkLv8sufGwWvFk01RBqLkq
	eS+o4n3QS5Aa8205iFg1iq8mmkqiu2jibC3ssffoFJK8nNaeLylDUwQ7Gwmd7Bv/NBLYI7GA8IK
	D+u3jA612G2kPIeoZX5olSaFIoljrNfhM9wshuMMkS26UlGiT2JmZ1TH77Vy5LaUdWpyntolS+E
	zejV+FED/ZptsbyDQvcMqbB/RFphBQOi8SfwAUD89X+NV+D9zNGQupYLWIAP5Qa4TjmZD0GRt4p
	50d/qm3zsUFGiz1a1rhIcOVYHma2EnidJhHBmmx0p6574+ilq1PgxD4COc1ZxcCAEh0QVrHSBFb
	mlQjWl+AmMuAR1d1nS/Da0zjfULI5BCJTtesLakaUgg6N2ieiCdzGQyFFlDG2gKyy3nG+08U2IY
	OOB/cR4K1vKiFhOK/Hss6TXGLkuQB5yT0JbSokEXIGoWFovaTZ0tyzk193KWR4aEhdonPyc9Xkx
	bUFKdThjNPX2K+LanLVrMzuP1+ePVWFdPKA/nfvCAMkrstYSgHjjSELY2f9o0GQB++GTMl/OclV
	eGyUUlj9H6cek6BP/S0SkXQZwTd+yLMpz/8Pzavm4KgFbkYEmcoJS8NBKcQtTLZfZdo+qe+iK5U
	=
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr281666185e9.20.1795477268346;
        Mon, 23 Nov 2026 15:41:08 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:08 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 4/4] ASoC: tlv320aic32x4: Add CM2_L and CM2_R negative MicPGA input routing
Date: Tue, 24 Nov 2026 00:40:50 +0100
Message-Id: <20261123234050.150364-5-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
References: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Left and Right MicPGA negative terminal input routing configuration
registers (AIC32X4_LMICPGANIN and AIC32X4_RMICPGANIN, Page 1, Registers
54 and 57) expose a second common-mode resistor selection (CM2L / CM2R)
in bits 1:0 alongside CM1L / CM1R in bits 7:6.

Add the CM2_L and CM2_R DAPM mux controls, widgets, and routes while
keeping the existing CM_L and CM_R names unchanged to preserve ABI
compatibility with existing userspace configurations.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 80ff52c6bbbe1..4fdac637ea472 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -394,6 +394,7 @@ static SOC_ENUM_SINGLE_DECL(in1r_lpga_p_enum, AIC32X4_LMICPGAPIN, 0, resistor_te
 static SOC_ENUM_SINGLE_DECL(cml_lpga_n_enum, AIC32X4_LMICPGANIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in2r_lpga_n_enum, AIC32X4_LMICPGANIN, 4, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in3r_lpga_n_enum, AIC32X4_LMICPGANIN, 2, resistor_text);
+static SOC_ENUM_SINGLE_DECL(cm2l_lpga_n_enum, AIC32X4_LMICPGANIN, 0, resistor_text);
 
 static const struct snd_kcontrol_new in1l_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_L L+ Switch", in1l_lpga_p_enum),
@@ -423,6 +424,10 @@ static const struct snd_kcontrol_new in3r_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_R L- Switch", in3r_lpga_n_enum),
 };
 
+static const struct snd_kcontrol_new cm2l_to_lmixer_controls[] = {
+	SOC_DAPM_ENUM("CM2_L L- Switch", cm2l_lpga_n_enum),
+};
+
 /*	Right mixer pins */
 static SOC_ENUM_SINGLE_DECL(in1r_rpga_p_enum, AIC32X4_RMICPGAPIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in2r_rpga_p_enum, AIC32X4_RMICPGAPIN, 4, resistor_text);
@@ -431,6 +436,7 @@ static SOC_ENUM_SINGLE_DECL(in2l_rpga_p_enum, AIC32X4_RMICPGAPIN, 0, resistor_te
 static SOC_ENUM_SINGLE_DECL(cmr_rpga_n_enum, AIC32X4_RMICPGANIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in1l_rpga_n_enum, AIC32X4_RMICPGANIN, 4, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in3l_rpga_n_enum, AIC32X4_RMICPGANIN, 2, resistor_text);
+static SOC_ENUM_SINGLE_DECL(cm2r_rpga_n_enum, AIC32X4_RMICPGANIN, 0, resistor_text);
 
 static const struct snd_kcontrol_new in1r_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_R R+ Switch", in1r_rpga_p_enum),
@@ -460,6 +466,10 @@ static const struct snd_kcontrol_new in3l_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_L R- Switch", in3l_rpga_n_enum),
 };
 
+static const struct snd_kcontrol_new cm2r_to_rmixer_controls[] = {
+	SOC_DAPM_ENUM("CM2_R R- Switch", cm2r_rpga_n_enum),
+};
+
 static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 	SND_SOC_DAPM_DAC("Left DAC", "Left Playback", AIC32X4_DACSETUP, 7, 0),
 	SND_SOC_DAPM_MIXER("HPL Output Mixer", SND_SOC_NOPM, 0, 0,
@@ -500,6 +510,8 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in1l_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_L to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
 			 in3l_to_rmixer_controls),
+	SND_SOC_DAPM_MUX("CM2_R to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
+			 cm2r_to_rmixer_controls),
 
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", AIC32X4_ADCSETUP, 7, 0),
 	SND_SOC_DAPM_PGA("Left MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -517,6 +529,8 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in2r_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_R to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
 			 in3r_to_lmixer_controls),
+	SND_SOC_DAPM_MUX("CM2_L to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
+			 cm2l_to_lmixer_controls),
 
 	SND_SOC_DAPM_SUPPLY("Mic Bias", AIC32X4_MICBIAS, 6, 0, mic_bias_event,
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
@@ -610,6 +624,11 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"IN3_L to Right Mixer Negative Resistor", "20 kOhm", "IN3_L"},
 	{"IN3_L to Right Mixer Negative Resistor", "40 kOhm", "IN3_L"},
 
+	{"Right MicPGA", NULL, "CM2_R to Right Mixer Negative Resistor"},
+	{"CM2_R to Right Mixer Negative Resistor", "10 kOhm", "CM_R"},
+	{"CM2_R to Right Mixer Negative Resistor", "20 kOhm", "CM_R"},
+	{"CM2_R to Right Mixer Negative Resistor", "40 kOhm", "CM_R"},
+
 	/* Left Input */
 	{"Left ADC", NULL, "Left MicPGA"},
 	{"MAL Power", NULL, "Left MicPGA"},
@@ -648,6 +667,11 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"IN3_R to Left Mixer Negative Resistor", "10 kOhm", "IN3_R"},
 	{"IN3_R to Left Mixer Negative Resistor", "20 kOhm", "IN3_R"},
 	{"IN3_R to Left Mixer Negative Resistor", "40 kOhm", "IN3_R"},
+
+	{"Left MicPGA", NULL, "CM2_L to Left Mixer Negative Resistor"},
+	{"CM2_L to Left Mixer Negative Resistor", "10 kOhm", "CM_L"},
+	{"CM2_L to Left Mixer Negative Resistor", "20 kOhm", "CM_L"},
+	{"CM2_L to Left Mixer Negative Resistor", "40 kOhm", "CM_L"},
 };
 
 const struct regmap_range_cfg aic32x4_regmap_pages[] = {
-- 
2.25.1

