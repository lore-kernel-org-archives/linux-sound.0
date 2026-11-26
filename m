Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716647;
	b=rQ7COaCKkG1uVWwOaj7GRqI9GMGrDmhiB6Q6ATz1IU1dQswyhQ4UsGkAvyHeBcHqwEQc
	 jvgja5buN34oONs0UretnwefG+UYNKIN4ccgIJ1EZPbw83EVoOcZRZDTtiG8npgm2n9Y8
	 itf1hDF3FFM9OOBoI1V7YMqS7qys50/W2PdwpkZbNwCr9FH1ZtvkwqngDoKPT2pc8LDfA
	 HDKsiDdBa88ISF3MZ+nbck9uSQUl2gbM9dXn87I+9ZLjrfRsL7rb841WgxO3OUbd3Z3iI
	 V/llW5t7lWMgb9724CSn9Sr7QsyKuQ+TpMAbd4mGQGiMEU47WoM8n8bklr/GuZKRgjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9EE7ET7ZAHDkNqGUagc4f/OGnCE/6ki6vjCKYjQxI34=;
	b=w1pTgB/E2SmOKsb3ne3GZ0BWgvKADTragmi2vSVij6n5hQsi91JGUAtOrUpnfimf1hdu
	 DuCOCdRCpZJkAS7zEgOAaK6COjzTEnz0FSp3KuqUdaemKpB3w4WXunUxLGAaXzZqfm+Ek
	 Ce4BeKgtlauDk8lXfoN4399mqNayx/LGvyy6q3ILHs4QDeaykrEhs1hiyRKFG/EZ0KSdp
	 nHMBAEhpQTEEGs6mrWcUVE3M9g/rGaUo8rJJKG+rMOejHZ6dc65qiZ9nY7ib0glwSArXN
	 ontLsmjsdK9/1McTomtVvASHOfgnY4g/RRDU8K89qTM2EoGMhu8X/RLOaeisoQR86rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4b0i9pJ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD081606A6B6
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 18:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD081606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4b0i9pJ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so74891155e9.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 10:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716645; x=1796321445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EE7ET7ZAHDkNqGUagc4f/OGnCE/6ki6vjCKYjQxI34=;
        b=n4b0i9pJfy+xA3AKsJdVS83ypg7az/x6Hn3b/cgg/jK8klv6G3wREjV5UTajHBst43
         F67AUFgmt5NLXE9QP0DywV9x3IRps3p0gne3wR0uHXdF0Tzqc5WAVpW4YfIVMUqycaMP
         3dxc/QFEN6CR5pilnRRxd9n6E/zGayGGSm8d8KVmSX9YjWip186tNSrZP8r1Tc2OKj7L
         Q341zxrSAb5yl2NHBD7Xvpzm7LIl9H6vsphgqxUiFTv6KLof9/WCAOtPX+qyp1lcX7lC
         h37EXjSUH6mH6Q/OCpv+TVeZixba/SPYELe/0YTkDLvKGIq+iOJaP629Hpux+ASuusYX
         4TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716645; x=1796321445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EE7ET7ZAHDkNqGUagc4f/OGnCE/6ki6vjCKYjQxI34=;
        b=VrvYKdEqIz50/8pgiEyve+bRz1bby1bz9nB/pxqWWlSIy5zXVhVjI/Ws9Ajl1aZ76M
         XmFemWcE1OhMilp1Uc451ZmBjDnTJvjO0f+S0m/fry28aLdu6jsRQ7RGW8VS+dUCiNhw
         ZJ1moRu6fjrveSxjkaVkd90zfpdDoDmmvICz8Ak/4mAXg4I759eH+yqgnn6+TPiZZpTn
         x4yNMJ/f8IoVX9wBVnw14R7watD+9QfOBlOybG2aNvnHFp1w90tQzICNXYiGCNf8NAnv
         b9imJKchgx6YU9HU+HRA20BqxkRsWMISye273mABjZ1KqukwqsNga5TywAfQHC9t8K5p
         pb7w==
X-Forwarded-Encrypted: i=1; AL+hErGp7dcioSJGPL81oUQmMe1Az3mhPdPaNCX55EfQvsKMoU7WmjVitIYzPv3wCHkVGiD/YQwhJUCooaSCJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+NIkXecqY4+bff+a8O0qARmKPsgRL/MWJt6jeVkhiKg4udPXE5
	5FxTz7nngkM02msiIErHcJ/aCITkVcRi+SphpWG3ZBNmYny6tbDCqnM=
X-Gm-Gg: AZFdTZdSO9rF+M9byxrX1lTmR4XXCcdy93+Y+aMOdgPeAamTzFXbrgvG33liyi8g/FT
	mwoWz5/sngkJ7ec+PoPTUWXOyMJmIxuYvsQgIANZLpZ6ja6R9GGQqoylBY8MJOcNU0udke9oyDf
	BEofhzRF8pG4wdtygIhV5gmudZ7y75uAdnzRELYTKK9vgywPZJ6rUpsQ5vX029mvUB4dkoNYfwg
	eOx7p2p6Q7hgJg0LQ0fUJ8hD0EVm5SevK5leY1y3+MI6zB8xhPuc23ndIeU7V1zHGUY6SJ4aeNJ
	8LqpurRlhqPjHYVmQtFQdIcwzvxfirrcvnUdb+TopDGdt2LJUhogLqpYSAAoYNhIVjoz1YuhQ+I
	tpzadNb4PO/NPGrHRAK6O25LHHYyE3R2sTqWCzyo1q1YA52q7IwyakW0C2hqU2e0yoIV5qJ7vl1
	XiC7AVLc4WTv0f1xlRMzmJ/Emhs63pvQ3wCTrtXbOdZjwej9nzT0NzuiKv6ykN8aKqYNgoDtd9l
	KloShTJuKM1pikOMMwr1whCQTlWRVYZjo84nA3jvvjFy8kxPvgoUHluL4NiRzduqVyrupD5CB/k
	ZAetuzhd3lXErmZJ+wGHoaPibhqZehBSuwGiZfuKeD9cNX0XzIMCGiJG+BsGW+m5h1suASoEX+j
	WdtXPCpyozZj+hQa82Twim3CNm2flhcIP1XKbhQwW+lKPLhjwDe3U9X9Qnbw=
X-Received: by 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr446022625e9.11.1795716644989;
        Thu, 26 Nov 2026 10:10:44 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm42675231f8f.16.2026.11.26.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:10:44 -0800 (PST)
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
Subject: [PATCH v2 4/4] ASoC: tlv320aic32x4: Add CM2_L and CM2_R negative MicPGA input routing
Date: Thu, 26 Nov 2026 19:10:38 +0100
Message-Id: <20261126181038.99595-5-gianfranco.mariotti94@gmail.com>
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

Bits 1:0 of AIC32X4_LMICPGANIN (Page 1, Register 54) and
AIC32X4_RMICPGANIN (Page 1, Register 57) provide a second common-mode
input resistor selection (CM2L / CM2R, Off / 10 kOhm / 20 kOhm /
40 kOhm) to the Left and Right MicPGA negative terminals, used to match
input impedance when mixing multiple positive inputs.

Add the CM2_L and CM2_R DAPM mux widgets, enum controls, and routes
sourced from CM_L and CM_R, preserving the existing CM_L and CM_R
control names for ABI compatibility.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 92f77b26b4b40..ffa879c271273 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -395,6 +395,7 @@ static SOC_ENUM_SINGLE_DECL(in1r_lpga_p_enum, AIC32X4_LMICPGAPIN, 0, resistor_te
 static SOC_ENUM_SINGLE_DECL(cml_lpga_n_enum, AIC32X4_LMICPGANIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in2r_lpga_n_enum, AIC32X4_LMICPGANIN, 4, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in3r_lpga_n_enum, AIC32X4_LMICPGANIN, 2, resistor_text);
+static SOC_ENUM_SINGLE_DECL(cm2l_lpga_n_enum, AIC32X4_LMICPGANIN, 0, resistor_text);
 
 static const struct snd_kcontrol_new in1l_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_L L+ Switch", in1l_lpga_p_enum),
@@ -424,6 +425,10 @@ static const struct snd_kcontrol_new in3r_to_lmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_R L- Switch", in3r_lpga_n_enum),
 };
 
+static const struct snd_kcontrol_new cm2l_to_lmixer_controls[] = {
+	SOC_DAPM_ENUM("CM2_L L- Switch", cm2l_lpga_n_enum),
+};
+
 /*	Right mixer pins */
 static SOC_ENUM_SINGLE_DECL(in1r_rpga_p_enum, AIC32X4_RMICPGAPIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in2r_rpga_p_enum, AIC32X4_RMICPGAPIN, 4, resistor_text);
@@ -432,6 +437,7 @@ static SOC_ENUM_SINGLE_DECL(in2l_rpga_p_enum, AIC32X4_RMICPGAPIN, 0, resistor_te
 static SOC_ENUM_SINGLE_DECL(cmr_rpga_n_enum, AIC32X4_RMICPGANIN, 6, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in1l_rpga_n_enum, AIC32X4_RMICPGANIN, 4, resistor_text);
 static SOC_ENUM_SINGLE_DECL(in3l_rpga_n_enum, AIC32X4_RMICPGANIN, 2, resistor_text);
+static SOC_ENUM_SINGLE_DECL(cm2r_rpga_n_enum, AIC32X4_RMICPGANIN, 0, resistor_text);
 
 static const struct snd_kcontrol_new in1r_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN1_R R+ Switch", in1r_rpga_p_enum),
@@ -461,6 +467,10 @@ static const struct snd_kcontrol_new in3l_to_rmixer_controls[] = {
 	SOC_DAPM_ENUM("IN3_L R- Switch", in3l_rpga_n_enum),
 };
 
+static const struct snd_kcontrol_new cm2r_to_rmixer_controls[] = {
+	SOC_DAPM_ENUM("CM2_R R- Switch", cm2r_rpga_n_enum),
+};
+
 static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 	SND_SOC_DAPM_DAC("Left DAC", "Left Playback", AIC32X4_DACSETUP, 7, 0),
 	SND_SOC_DAPM_MIXER("HPL Output Mixer", SND_SOC_NOPM, 0, 0,
@@ -498,6 +508,8 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in1l_to_rmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_L to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
 			 in3l_to_rmixer_controls),
+	SND_SOC_DAPM_MUX("CM2_R to Right Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
+			 cm2r_to_rmixer_controls),
 
 	SND_SOC_DAPM_ADC("Left ADC", "Left Capture", AIC32X4_ADCSETUP, 7, 0),
 	SND_SOC_DAPM_PGA("Left MicPGA", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -515,6 +527,8 @@ static const struct snd_soc_dapm_widget aic32x4_dapm_widgets[] = {
 			 in2r_to_lmixer_controls),
 	SND_SOC_DAPM_MUX("IN3_R to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
 			 in3r_to_lmixer_controls),
+	SND_SOC_DAPM_MUX("CM2_L to Left Mixer Negative Resistor", SND_SOC_NOPM, 0, 0,
+			 cm2l_to_lmixer_controls),
 
 	SND_SOC_DAPM_SUPPLY("Mic Bias", AIC32X4_MICBIAS, 6, 0, mic_bias_event,
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
@@ -623,6 +637,11 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
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
@@ -661,6 +680,11 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
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

