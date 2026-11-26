Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716644;
	b=tgyhJpUD5UP0Q4QTCkDg7qQiDqO/7wKfTnZdF1CEhKS6FJsQIdMsxW6XHCafJmtQFzn1
	 /DzKIFXY9m0qm3cnE8SIHRC1mIcSxkTUbq8TTgGexdpgqUvHsEbjFN0Trx0vFXLXYahP3
	 Divdolod2JxyKJ9rJS6s+Do10rmt9zn38bKz1Q0Z/sRtRbtZFw+0SMDT+6bGfwtogFtC8
	 JsFf7T2o/9G3wPmERRSmSvJ23271lKM+sZh1pyEPphzVCmDHiVDqy9/ePRWgWw6DaT92i
	 qZEzULuuXw4C+SUvv5aCIxPcrXTO6yLuFmEHZ/WtEOuNFrKgMv94l3yWZw6mtBNr2AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YrzaC5bW3BU9+qo8GLcTwcBItYjzFfpMeNl0j4bmHlI=;
	b=al1U6zyMFo25loab7fIq3LsA3lAOXjMUZdXmLLQz4Ard6XXMTdsxmIMo48T2+iEob5/P
	 Y92H74cH6cssryhPieqOqSzNpyZ0x3qF11xdhnVgiSL3tpGaLmyN6M1IX2wj+8Xn3EUdN
	 MqdWUd266IuEB+GUSxA+xc8nMQIkhpXh1gW6jX5a4MIHNVG12zY9rv7GwsdDBlGOYXLGV
	 AQIylIOp5n7DbPwP0WU6UVXVojMdxnSd3PqQP2VQtoI7p7b/4RCC1T+8kReeSxmrmuZTY
	 BGRceyPkueWG9omcRekPnetQGBsN/SLJIQ9nLfoAQCsdr6SdJuN5eP6Qj0QsDx6q2Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejeXiUZx;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F1606A32C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejeXiUZx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so71056295e9.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716642; x=1796321442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrzaC5bW3BU9+qo8GLcTwcBItYjzFfpMeNl0j4bmHlI=;
        b=ejeXiUZxbAfCQtA9Iycq4EVtSlJbg5D1zyNAl4Le7mRnlMHnodhEfPHCVHXw/M0rR+
         UzXQHAQSMVfpNc8EpjFP+TQ07RnhMv8XwuqWQr4ng478UwtpB7yyw+TTng/EM09cWKAx
         hLl/6YrMOaPvwptmx8QK9sYqHmWdr+54/CnvOJVqyEKagc7FrcsgPn4uW6wwbSO9k810
         NXbT9bDMmG0P0hnc7VIOwJ/gnFWLl1oMZ57Pmm51BzxbGfKgko89+Ub/9N3Qqw2SXRd2
         FWSFh6LLGNHkp49dEu/JOz7rwbZH1ef4FXp3XurzxvYYxZHfCrJ3MxCxAGW1c5B0cq8v
         /khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716642; x=1796321442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrzaC5bW3BU9+qo8GLcTwcBItYjzFfpMeNl0j4bmHlI=;
        b=OxwwAyIjEn6WNGSldEMNdlZbJ/nBJvG502mM1KUw25mTuJiWHB0ebhvxBpa9HaOTPE
         sKbY4QL7CYa1nGuTarJHpjpbjkgygxtN8N96a1Os2inLChLX/eio9iCK0ip3PHNon3EV
         Ac1pS3grwq80mWOHkYQdoIACzzMV4ogwkNZTxBVBFZZoibiPt9r0wHbJfAORU2wcg1EO
         ap8xi+dV15fXt2ZhzudUDaUH5EDJTaCLFUzImDmraroBz2XKEjGBBXSPuuLcfGcaq+aw
         pq0aQiYTCNPdVOTDoQusHM6oRG3tPX47k0v1o/K6Jt5ZIyjHUTa0L2efvQtWKApnjvZQ
         YAsA==
X-Forwarded-Encrypted: i=1; AL+hErEca+yNplAgsgUyMKjZl/7tNwgUZ4j9e33ES41SLfitnMrDQARyDruhCowz6cnJkbyXrAq3pjYGoMv4Kw==@vger.kernel.org
X-Gm-Message-State: APuU4Z97LQf3fPoLUkjj2ZhbOEQtp6nTLzNsmwvt/8GL/XJ7y5K/d7jV
	AEem28yfpxx+2LkMdCX0pyH6NlLGhh93UiFy8EMQPCj3DoiJHQh6Xik=
X-Gm-Gg: AZFdTZcFK1LCR2tiF8wQBFoLnBsK6xg76T3VlEFySeKZ89LqDDfeNakJ+NN4ujud+Q8
	rmFtrxeb4kUWT11F8RYuF0Eshs6JMCa96yJCIXjTrB/4zYNlDszTbPpB/8LKQWJL1Zc2gv8sBje
	/bJu1ZsnEfMboCtKZzX4PtH3eem4YfCL5kbtjdAid5/gPVnDxrGQCTlMfmJJ0kS0DMoapjHSmd2
	BYco7p4r5iCffC5bmZctISEOCYGGJyfUP9QilLuNlZqoXm3fId7kN7GHg9aCnRxu6Fx+5lqZDnj
	Q5vg/i+v6xDWodMeVxkzQt5anwrUv0nNo6abotP6OzG+pXno9fTBRNExHaP4YzWfpw6TYlxGXSi
	la2GaqRdZ6lPsVVByHo4u+4dXt2G/0iBU6l6AWwJmaqdHaiiuhF7m/QNylipAZTicYw53pY/r72
	McvXYbJdeTLf3/ipGIwJGQA30nGMcRnWiaUWPmFS2+v2Hh7Q4KntdqVEttyMfEQENklBHJTfUGw
	sATnR1eRidxqXWL64khBQ5YeBPdolPaFtK/iuDPh17mvaGVtkgd6aw8YJS3EfX9/+PzagvO5oRC
	kGXnbQcjg1JCrdNy4kxcdfl/JNl6SADorUVMS3AyIUCDgvghW1lkjR6utneKm+1/pKJOqBOfk0U
	u/zzC790hbS32rH0OOISjEaK/8pNTonVzEMye8XUzQ+dANnJ1nqcntgRtTT0=
X-Received: by 2002:a05:600c:6298:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb88934652mr421855085e9.27.1795716642260;
        Thu, 26 Nov 2026 10:10:42 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm42675231f8f.16.2026.11.26.10.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:10:41 -0800 (PST)
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
Subject: [PATCH v2 1/4] ASoC: tlv320aic32x4: Add missing DAC and driver output mixer routes
Date: Thu, 26 Nov 2026 19:10:35 +0100
Message-Id: <20261126181038.99595-2-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126181038.99595-1-gianfranco.mariotti94@gmail.com>
References: <20261126181038.99595-1-gianfranco.mariotti94@gmail.com>
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

The HPR and LOL output routing selection registers (Page 1, Registers 13
and 14) support routing the opposite DAC channel's negative
reconstruction filter terminal as well as bridging the HPL and LOR
output amplifier stages for mono differential configurations:
- AIC32X4_HPRROUTE bit 4: Left DAC negative terminal to HPR
- AIC32X4_HPRROUTE bit 0: HPL output driver to HPR (AIC32x4 only)
- AIC32X4_LOLROUTE bit 4: Right DAC negative terminal to LOL
- AIC32X4_LOLROUTE bit 0: LOR output driver to LOL

Add the corresponding DAPM mixer controls and routes, sourcing HPL/LOR
bridging from the HPL Power and LOR Power PGA widgets so the upstream
driver stage is powered when bridged.

Because AIC32X4_HPRROUTE bit 0 is reserved on TLV320AIC32x6 devices
(SLAA463 / SLAU306, which use ground-centered charge-pump headphone
drivers rather than AVDD-powered headphone drivers), register the HPR
Output Mixer widget in aic32x4_component_probe() so 'HPL Switch' and its
route are only exposed on AIC32X4_TYPE_AIC32X4.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
v2:
- Restrict 'HPL Switch' (AIC32X4_HPRROUTE bit 0) and its DAPM route to
  AIC32X4_TYPE_AIC32X4, since bit 0 is reserved on TLV320AIC32x6
  (Mark Brown).

 sound/soc/codecs/tlv320aic32x4.c | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 875d934bb5c8d..ba881b28f1fd6 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -323,12 +323,17 @@ static const struct snd_kcontrol_new hpl_output_mixer_controls[] = {
 };
 
 static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
+	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPRROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_HPRROUTE, 3, 1, 0),
 	SOC_DAPM_SINGLE("IN1_R Switch", AIC32X4_HPRROUTE, 2, 1, 0),
+	/* HPL Switch (bit 0) is AIC32x4-only; keep last for AIC32x6 */
+	SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lol_output_mixer_controls[] = {
+	SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_LOLROUTE, 4, 1, 0),
 	SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_LOLROUTE, 3, 1, 0),
+	SOC_DAPM_SINGLE("LOR Switch", AIC32X4_LOLROUTE, 0, 1, 0),
 };
 
 static const struct snd_kcontrol_new lor_output_mixer_controls[] = {
@@ -427,9 +432,6 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA("LOL Power", AIC32X4_OUTPWRCTL, 3, 0, NULL, 0),
 
 	SND_SOC_DAPM_DAC("Right DAC", "Right Playback", AIC32X4_DACSETUP, 6, 0),
-	SND_SOC_DAPM_MIXER("HPR Output Mixer", SND_SOC_NOPM, 0, 0,
-			   &hpr_output_mixer_controls[0],
-			   ARRAY_SIZE(hpr_output_mixer_controls)),
 	SND_SOC_DAPM_PGA("HPR Power", AIC32X4_OUTPWRCTL, 4, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER("LOR Output Mixer", SND_SOC_NOPM, 0, 0,
 			   &lor_output_mixer_controls[0],
@@ -487,6 +489,22 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("CM_R"),
 };
 
+static const struct snd_soc_dapm_widget aic32x4_hpr_dapm_widgets[] = {
+	SND_SOC_DAPM_MIXER("HPR Output Mixer", SND_SOC_NOPM, 0, 0,
+			   &hpr_output_mixer_controls[0],
+			   ARRAY_SIZE(hpr_output_mixer_controls)),
+};
+
+static const struct snd_soc_dapm_widget aic32x6_hpr_dapm_widgets[] = {
+	SND_SOC_DAPM_MIXER("HPR Output Mixer", SND_SOC_NOPM, 0, 0,
+			   &hpr_output_mixer_controls[0],
+			   ARRAY_SIZE(hpr_output_mixer_controls) - 1),
+};
+
+static const struct snd_soc_dapm_route aic32x4_extra_dapm_routes[] = {
+	{"HPR Output Mixer", "HPL Switch", "HPL Power"},
+};
+
 static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	/* Left Output */
 	{"HPL Output Mixer", "L_DAC Switch", "Left DAC"},
@@ -495,12 +513,15 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"HPL Power", NULL, "HPL Output Mixer"},
 	{"HPL", NULL, "HPL Power"},
 
+	{"LOL Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"LOL Output Mixer", "L_DAC Switch", "Left DAC"},
+	{"LOL Output Mixer", "LOR Switch", "LOR Power"},
 
 	{"LOL Power", NULL, "LOL Output Mixer"},
 	{"LOL", NULL, "LOL Power"},
 
 	/* Right Output */
+	{"HPR Output Mixer", "L_DAC Switch", "Left DAC"},
 	{"HPR Output Mixer", "R_DAC Switch", "Right DAC"},
 	{"HPR Output Mixer", "IN1_R Switch", "IN1_R"},
 
@@ -961,14 +982,33 @@ static void aic32x4_setup_gpios(struct snd_soc_component *component)
 
 static int aic32x4_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct aic32x4_priv *aic32x4 = snd_soc_component_get_drvdata(component);
 	u32 tmp_reg;
+	int ret;
 
 	struct clk *codec_clkin = aic32x4->clocks[AIC32X4_CLK_CODEC_CLKIN].clk;
 	struct clk *pll = aic32x4->clocks[AIC32X4_CLK_PLL].clk;
 	struct clk *bdiv = aic32x4->clocks[AIC32X4_CLK_BDIV].clk;
 	struct clk *mdac = aic32x4->clocks[AIC32X4_CLK_MDAC].clk;
 
+	if (aic32x4->type == AIC32X4_TYPE_AIC32X4) {
+		ret = snd_soc_dapm_new_controls(dapm, aic32x4_hpr_dapm_widgets,
+						ARRAY_SIZE(aic32x4_hpr_dapm_widgets));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_add_routes(dapm, aic32x4_extra_dapm_routes,
+					      ARRAY_SIZE(aic32x4_extra_dapm_routes));
+		if (ret)
+			return ret;
+	} else {
+		ret = snd_soc_dapm_new_controls(dapm, aic32x6_hpr_dapm_widgets,
+						ARRAY_SIZE(aic32x6_hpr_dapm_widgets));
+		if (ret)
+			return ret;
+	}
+
 	aic32x4_setup_gpios(component);
 
 	clk_set_parent(codec_clkin, pll);
-- 
2.25.1

