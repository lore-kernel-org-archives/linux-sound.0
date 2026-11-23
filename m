Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477266;
	b=1B+qaYyuSaQiaIe/lCBz5E/WDg2tq5uTiE/iu+g9pTYIGtzMiQxVWjctkbxv7HAcK7Ak
	 DDw3YI40EM1kH1FNe8P9QoBAdv1vEYMWjgLfT8awKK4kzvVLT9PcVXI0/3f0/9ecF0tHo
	 9GjCJ1V2dDInB1X5cY2gv57UkofhkwvdGkY3XMQAbnM8J7ZIq1HVoL0EB1pEU9uLtHEY4
	 3sCt+Oa8PV4LQhxQeb4Dhm9rXMjgWIReNVn3zuZFSkI3TeiViElcCf0sas/UB5XT2ijeU
	 XMQ3AJAwFk8rsimmolxTQOG+p26RXXfolyZFg6IXwESnK5ELDWsn1NVaUtZlp8ZMUtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bDsDAMhXzZY7QIF9oImxY/mFcO7LsdkkD50C/kd98n8=;
	b=P4i87e9UGHxVGl7Y/Xqz/XRQW73Ie7FRDDntzoImkMC59J5ZD2IBoWHrbxf8/4vMopmb
	 bzH8+4wKSd0o1u/qy4KIrMZjs3d4IR92kXs1dIVfaZADG0LceumGM4O3h597Vl7AeBev/
	 gZQe8jSFvoR6x4BKmbtvEeylwyMrSeM/f8JUYcLHPz0LEY/KGV8/kCQUvoy2uB2lFG7L+
	 JdnpxKPgRpkTH4CUB7luD8Ds50e7W3Hxcfnf8LenhhUAHYEN2HQxiehjGgsmbSm73cWC3
	 UPy50TLBTxwytJrjS+foU77FsO3aVXbms9JIs3IBqz++urCwZ1xSrwQh7pG8vegkcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xt22lYsP;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F9606A331
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 23:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997F9606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xt22lYsP
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so36620195e9.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 15:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477264; x=1796082064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDsDAMhXzZY7QIF9oImxY/mFcO7LsdkkD50C/kd98n8=;
        b=xt22lYsPuBAC58KGKW4OGKbhFXxhz6V+vCWgBnjNzB8xmFILuiZEDjHn17MFd0B2rE
         NpX8UHd5h6QGCPZn2eu2qKLl+cOdpuHF8W0NnkT0yfJBubYpRMsS9F4ln8VHiLAtXzpS
         4IqK97daGmFq4oQeliDtr5a8jphN+1lB7NLDxAIW7F69Ca0PHUK2wE/6R5bB1qoBKQBh
         aOsU7syYkM3eFUuTcO8D82AwpnY/UiN4SfDo5MTpwlIjvwID43CvxoWNpMoO0hJB+4pz
         pcvs2grzVxMnkEfeXHU+9BNMpyf9wjPPDqQZ69N3wGNMGKpugDru/C3UnhiljhooDTPe
         YXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477264; x=1796082064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDsDAMhXzZY7QIF9oImxY/mFcO7LsdkkD50C/kd98n8=;
        b=G0VA/ZqBw27n9B2AROEBp8y+SWnIqPxCQy5X2A8uZ7uV8VRKDyhH3a75MX+yvjkJgR
         5X/oRltuFcKzW6ntuoOd99Q2FyTgwD4NI9XjX+CYjpSCz5AarqZ74nO38v+smYa/XEel
         7YbY63fEOi5XGVlmHb+qanGdWpOUcpsmbVPP6ukDDb7WHy6OuLvf8KsMb3kvCmXodshM
         1QeX15KHgK4gW6CLib8LIAbXRMg0MTQvvi9Z3/RcBam4gqOQizl3eO4tcQgCtKNheSIl
         HOqGTKqKU/w8jfijAMzdNIP4FwpX5qVZz4BNehJqwP1UvJdLtLPJgcnDqk2AJUWPF80V
         xsng==
X-Forwarded-Encrypted: i=1; AL+hErGdtuoGg/UCsj7eBUMljA99WoUkwlq1VUMeSZJrbcjw9xJP+drIYLXExoQeaG/1s0nftNyzEVn+m7bJag==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lBaN/FSabgWrm181HtsZP2J7747kbCKTC/5/+bCe974BWCJlz
	LtqsbAj36WLEAGonqxNSiW5n/MpXEPpcgIguUjAul6q8MlND6z9xb/M=
X-Gm-Gg: AZFdTZcJtgnPMNk20AXRWarcmXEPxRr7x+rBfcVZGuOZgnweKtrb0MJNWtJP8j3i4v9
	jk5Od6KiGVkPkQHMAMh2HqVt/9x1dru4WS4MRYUJ4y424KR8e+/n8hRkn4u3AeNQiuZ67oHf15F
	7GM6TgJqN9SLYaFUpHGOqt11tdaCW/3fiR8vlzpBU9AufrsXTrZMyGv2gFGn+2u5IZVSLtrl2Z4
	fA14T7kSJaP+oFP36e+C3vjbiYyPYLk0cJWMdkSI6A4Gprtvi8nweWd1uOeW0APWNL/ozo/73fF
	nxS1TJDbtg4BGdbCXbdZAaI6On/bTRUwtw0aji1h4lXQUUjLU/mXhQj0CBiNfl4pgw57f9G6Qj1
	sbh2T7tx4vG86yke00KXdcv8ORRt0TV/qP/PL6SMr4s12DqDa38kKfFZKRchY/ofPo2G4/+eQod
	oLBkifiJGNLkkyupV44Af0PcW1LZPSspEdaMePe/QSO1hX9Hc0zbFfxKxWBnWSZLIjPKBhOiyYr
	ii+2K1yrGgE/1Zzgu/weEV/jFcff40lUvq2f/o5NUy4mUUni6Tw2ydgsJuXtXdeWbHMvj8M/eb+
	ULZiCXK8/6G2Hs3Ttr934aC2plihVvPT9VqA0+6dtYK1Qo6hiyk5IA==
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr256218215e9.12.1795477263720;
        Mon, 23 Nov 2026 15:41:03 -0800 (PST)
Received: from localhost.localdomain ([193.207.76.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm568321645e9.13.2026.11.23.15.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:41:02 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: tlv320aic32x4: Add Left and Right Mixer Amplifier DAPM support
Date: Tue, 24 Nov 2026 00:40:48 +0100
Message-Id: <20261123234050.150364-3-gianfranco.mariotti94@gmail.com>
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

The TLV320AIC32x4 features Left and Right Mixer Amplifiers (MAL and MAR,
controlled by AIC32X4_OUTPWRCTL bits 1 and 0) that route amplified
signals from the Left and Right MicPGAs directly to the headphone and
line-out output mixers, bypassing the ADCs and DACs (TI SLAA557, Section
2.2.2 and Figure 2-1):
- AIC32X4_HPLROUTE bit 1 (MAL) and bit 0 (MAR)
- AIC32X4_HPRROUTE bit 1 (MAR)
- AIC32X4_LOLROUTE bit 1 (MAL)
- AIC32X4_LORROUTE bit 1 (MAR)

Insert Left MicPGA and Right MicPGA DAPM PGA widgets between the input
resistor muxes and the ADCs, feed MAL Power and MAR Power from the
respective MicPGAs, and wire the MAL/MAR switches into the HPL, HPR,
LOL, and LOR output mixers.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 48 ++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index f39856d0b1f19..9f90e41076992 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -320,23 +320,28 @@ static const struct snd_kcontrol_new aic32x4_snd_controls[] = {
 static const struct snd_kcontrol_new hpl_output_mixer_controls[] = {
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPLROUTE, 3, 1, 0),
 	SOC_DAPM_SINGLE("IN1_L Switch", AIC32X4_HPLROUTE, 2, 1, 0),
+	SOC_DAPM_SINGLE("MAL Switch", AIC32X4_HPLROUTE, 1, 1, 0),
+	SOC_DAPM_SINGLE("MAR Switch", AIC32X4_HPLROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPRROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_HPRROUTE, 3, 1, 0),
 	SOC_DAPM_SINGLE("IN1_R Switch", AIC32X4_HPRROUTE, 2, 1, 0),
+	SOC_DAPM_SINGLE("MAR Switch", AIC32X4_HPRROUTE, 1, 1, 0),
 	SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lol_output_mixer_controls[] = {
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_LOLROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_LOLROUTE, 3, 1, 0),
+	SOC_DAPM_SINGLE("MAL Switch", AIC32X4_LOLROUTE, 1, 1, 0),
 	SOC_DAPM_SINGLE("LOR Switch", AIC32X4_LOLROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lor_output_mixer_controls[] = {
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_LORROUTE, 3, 1, 0),
+	SOC_DAPM_SINGLE("MAR Switch", AIC32X4_LORROUTE, 1, 1, 0),
 };
 
 static const char * const resistor_text[] = {
@@ -424,6 +429,7 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			   &hpl_output_mixer_controls[0],
 			   ARRAY_SIZE(hpl_output_mixer_controls)),
 	SND_SOC_DAPM_PGA("HPL Power", AIC32X4_OUTPWRCTL, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("MAL Power", AIC32X4_OUTPWRCTL, 1, 0, NULL, 0),
 
 	SND_SOC_DAPM_MIXER("LOL Output Mixer", SND_SOC_NOPM, 0, 0,
 			   &lol_output_mixer_controls[0],
@@ -435,12 +441,14 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			   &hpr_output_mixer_controls[0],
 			   ARRAY_SIZE(hpr_output_mixer_controls)),
 	SND_SOC_DAPM_PGA("HPR Power", AIC32X4_OUTPWRCTL, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("MAR Power", AIC32X4_OUTPWRCTL, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("LOR Output Mixer", SND_SOC_NOPM, 0, 0,
 			   &lor_output_mixer_controls[0],
 			   ARRAY_SIZE(lor_output_mixer_controls)),
 	SND_SOC_DAPM_PGA("LOR Power", AIC32X4_OUTPWRCTL, 2, 0, NULL, 0),
 
 	SND_SOC_DAPM_ADC("Right ADC", "Right Capture", AIC32X4_ADCSETUP, 6, 0),
+	SND_SOC_DAPM_PGA("Right MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MUX("IN1_R to Right Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
 			 in1r_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_R to Right Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
@@ -457,6 +465,7 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in3l_to_rmixer_controls),
 
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", AIC32X4_ADCSETUP, 7, 0),
+	SND_SOC_DAPM_PGA("Left MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MUX("IN1_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
 			 in1l_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN2_L to Left Mixer Positive Resistor", SND_SOC_NOPM, 0, 0,
@@ -495,12 +504,15 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	/* Left Output */
 	{"HPL Output Mixer", "L_DAC Switch", "Left DAC"},
 	{"HPL Output Mixer", "IN1_L Switch", "IN1_L"},
+	{"HPL Output Mixer", "MAL Switch", "MAL Power"},
+	{"HPL Output Mixer", "MAR Switch", "MAR Power"},
 
 	{"HPL Power", NULL, "HPL Output Mixer"},
 	{"HPL", NULL, "HPL Power"},
 
 	{"LOL Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"LOL Output Mixer", "L_DAC Switch", "Left DAC"},
+	{"LOL Output Mixer", "MAL Switch", "MAL Power"},
 	{"LOL Output Mixer", "LOR Switch", "LOR Power"},
 
 	{"LOL Power", NULL, "LOL Output Mixer"},
@@ -510,84 +522,92 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"HPR Output Mixer", "L_DAC Switch", "Left DAC"},
 	{"HPR Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"HPR Output Mixer", "IN1_R Switch", "IN1_R"},
+	{"HPR Output Mixer", "MAR Switch", "MAR Power"},
 	{"HPR Output Mixer", "HPL Switch", "HPL Power"},
 
 	{"HPR Power", NULL, "HPR Output Mixer"},
 	{"HPR", NULL, "HPR Power"},
 
 	{"LOR Output Mixer", "R_DAC Switch", "Right DAC"},
+	{"LOR Output Mixer", "MAR Switch", "MAR Power"},
 
 	{"LOR Power", NULL, "LOR Output Mixer"},
 	{"LOR", NULL, "LOR Power"},
 
 	/* Right Input */
-	{"Right ADC", NULL, "IN1_R to Right Mixer Positive Resistor"},
+	{"Right ADC", NULL, "Right MicPGA"},
+	{"MAR Power", NULL, "Right MicPGA"},
+
+	{"Right MicPGA", NULL, "IN1_R to Right Mixer Positive Resistor"},
 	{"IN1_R to Right Mixer Positive Resistor", "10 kOhm", "IN1_R"},
 	{"IN1_R to Right Mixer Positive Resistor", "20 kOhm", "IN1_R"},
 	{"IN1_R to Right Mixer Positive Resistor", "40 kOhm", "IN1_R"},
 
-	{"Right ADC", NULL, "IN2_R to Right Mixer Positive Resistor"},
+	{"Right MicPGA", NULL, "IN2_R to Right Mixer Positive Resistor"},
 	{"IN2_R to Right Mixer Positive Resistor", "10 kOhm", "IN2_R"},
 	{"IN2_R to Right Mixer Positive Resistor", "20 kOhm", "IN2_R"},
 	{"IN2_R to Right Mixer Positive Resistor", "40 kOhm", "IN2_R"},
 
-	{"Right ADC", NULL, "IN3_R to Right Mixer Positive Resistor"},
+	{"Right MicPGA", NULL, "IN3_R to Right Mixer Positive Resistor"},
 	{"IN3_R to Right Mixer Positive Resistor", "10 kOhm", "IN3_R"},
 	{"IN3_R to Right Mixer Positive Resistor", "20 kOhm", "IN3_R"},
 	{"IN3_R to Right Mixer Positive Resistor", "40 kOhm", "IN3_R"},
 
-	{"Right ADC", NULL, "IN2_L to Right Mixer Positive Resistor"},
+	{"Right MicPGA", NULL, "IN2_L to Right Mixer Positive Resistor"},
 	{"IN2_L to Right Mixer Positive Resistor", "10 kOhm", "IN2_L"},
 	{"IN2_L to Right Mixer Positive Resistor", "20 kOhm", "IN2_L"},
 	{"IN2_L to Right Mixer Positive Resistor", "40 kOhm", "IN2_L"},
 
-	{"Right ADC", NULL, "CM_R to Right Mixer Negative Resistor"},
+	{"Right MicPGA", NULL, "CM_R to Right Mixer Negative Resistor"},
 	{"CM_R to Right Mixer Negative Resistor", "10 kOhm", "CM_R"},
 	{"CM_R to Right Mixer Negative Resistor", "20 kOhm", "CM_R"},
 	{"CM_R to Right Mixer Negative Resistor", "40 kOhm", "CM_R"},
 
-	{"Right ADC", NULL, "IN1_L to Right Mixer Negative Resistor"},
+	{"Right MicPGA", NULL, "IN1_L to Right Mixer Negative Resistor"},
 	{"IN1_L to Right Mixer Negative Resistor", "10 kOhm", "IN1_L"},
 	{"IN1_L to Right Mixer Negative Resistor", "20 kOhm", "IN1_L"},
 	{"IN1_L to Right Mixer Negative Resistor", "40 kOhm", "IN1_L"},
 
-	{"Right ADC", NULL, "IN3_L to Right Mixer Negative Resistor"},
+	{"Right MicPGA", NULL, "IN3_L to Right Mixer Negative Resistor"},
 	{"IN3_L to Right Mixer Negative Resistor", "10 kOhm", "IN3_L"},
 	{"IN3_L to Right Mixer Negative Resistor", "20 kOhm", "IN3_L"},
 	{"IN3_L to Right Mixer Negative Resistor", "40 kOhm", "IN3_L"},
 
 	/* Left Input */
-	{"Left ADC", NULL, "IN1_L to Left Mixer Positive Resistor"},
+	{"Left ADC", NULL, "Left MicPGA"},
+	{"MAL Power", NULL, "Left MicPGA"},
+
+	{"Left MicPGA", NULL, "IN1_L to Left Mixer Positive Resistor"},
 	{"IN1_L to Left Mixer Positive Resistor", "10 kOhm", "IN1_L"},
 	{"IN1_L to Left Mixer Positive Resistor", "20 kOhm", "IN1_L"},
 	{"IN1_L to Left Mixer Positive Resistor", "40 kOhm", "IN1_L"},
 
-	{"Left ADC", NULL, "IN2_L to Left Mixer Positive Resistor"},
+	{"Left MicPGA", NULL, "IN2_L to Left Mixer Positive Resistor"},
 	{"IN2_L to Left Mixer Positive Resistor", "10 kOhm", "IN2_L"},
 	{"IN2_L to Left Mixer Positive Resistor", "20 kOhm", "IN2_L"},
 	{"IN2_L to Left Mixer Positive Resistor", "40 kOhm", "IN2_L"},
 
-	{"Left ADC", NULL, "IN3_L to Left Mixer Positive Resistor"},
+	{"Left MicPGA", NULL, "IN3_L to Left Mixer Positive Resistor"},
 	{"IN3_L to Left Mixer Positive Resistor", "10 kOhm", "IN3_L"},
 	{"IN3_L to Left Mixer Positive Resistor", "20 kOhm", "IN3_L"},
 	{"IN3_L to Left Mixer Positive Resistor", "40 kOhm", "IN3_L"},
 
-	{"Left ADC", NULL, "IN1_R to Left Mixer Positive Resistor"},
+	{"Left MicPGA", NULL, "IN1_R to Left Mixer Positive Resistor"},
 	{"IN1_R to Left Mixer Positive Resistor", "10 kOhm", "IN1_R"},
 	{"IN1_R to Left Mixer Positive Resistor", "20 kOhm", "IN1_R"},
 	{"IN1_R to Left Mixer Positive Resistor", "40 kOhm", "IN1_R"},
 
-	{"Left ADC", NULL, "CM_L to Left Mixer Negative Resistor"},
+	{"Left MicPGA", NULL, "CM_L to Left Mixer Negative Resistor"},
 	{"CM_L to Left Mixer Negative Resistor", "10 kOhm", "CM_L"},
 	{"CM_L to Left Mixer Negative Resistor", "20 kOhm", "CM_L"},
 	{"CM_L to Left Mixer Negative Resistor", "40 kOhm", "CM_L"},
 
-	{"Left ADC", NULL, "IN2_R to Left Mixer Negative Resistor"},
+	{"Left MicPGA", NULL, "IN2_R to Left Mixer Negative Resistor"},
 	{"IN2_R to Left Mixer Negative Resistor", "10 kOhm", "IN2_R"},
 	{"IN2_R to Left Mixer Negative Resistor", "20 kOhm", "IN2_R"},
 	{"IN2_R to Left Mixer Negative Resistor", "40 kOhm", "IN2_R"},
 
-	{"Left ADC", NULL, "IN3_R to Left Mixer Negative Resistor"},
+	{"Left MicPGA", NULL, "IN3_R to Left Mixer Negative Resistor"},
 	{"IN3_R to Left Mixer Negative Resistor", "10 kOhm", "IN3_R"},
 	{"IN3_R to Left Mixer Negative Resistor", "20 kOhm", "IN3_R"},
 	{"IN3_R to Left Mixer Negative Resistor", "40 kOhm", "IN3_R"},
-- 
2.25.1

