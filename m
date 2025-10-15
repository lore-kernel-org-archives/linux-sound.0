Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFC3148CA
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760521033; cv=none; b=JSUMOhXXHEhmph2eTfglKEFfbUbfA3vjdyfJaJkd9bj+haClHDZ7ECljU5A/ESc4SUd10tNxXV0jGu/YCkTHZaUPO+ktrqw3+LKGBp1LvJfAPVSTiGBKuCgf4UTiT7NyhEppaSSJcCwuST50HzUhcmV3JFwTWLQTWlclvCJLQ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760521033; c=relaxed/simple;
	bh=EGY0JF/UqkCc+HT1ubUX3O9x4HqCZ6zNOENmfoHjjzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NDJ1sfrxK58a1EpDNt5O9DTs7013CatXZrjIFWUXnXzOgaQaTmZWaI6L4F+vda7CzqP0gAmTTrKacbiQhHrOkAbZjmdr1ylKFODGL83VzL7B0qi6qqZGEzzeDZ1YbPr1vvXa1jADFzXHDXq7pcT0Mp4q3p/JO1vzVmSCaZ6FcPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlwRHDmf; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlwRHDmf"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b463f986f80so405836066b.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 02:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760521029; x=1761125829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxTsaLUNFN0TxuXsjNpjP91qD7hOY0gJ2VmrfPOEls0=;
        b=NlwRHDmfjV5rmA7PuGShKkfsXryltVQ/XB3/ypxI3ibNAL5DwE9L4ZwZ/BlUfHiLPv
         jx0MQ2Oz+64ZRQbZd41SUfRvlLK87pkB6KjwqvTg4rFTGPU/E0OiRKiGW8tVvMva7ZsW
         b+q+lwcoaAdVoeGEqRQukp+E/Yt5TjJKEOizJlltGPyV/aT/0sdyVNCFfQnnAyQeigDe
         eix3wnr8Vw3o74Cn8rl/l1jwUWsDWqXIyKzSQjzyc9VJ5vvilDXT86+Tjy3yWuHCgg+j
         kFw9sKL3fXKsl+w+477U9zF6kTkmJsHZF1SPRqoubD4T+UseOSJCe1MCgFq88JdSUdR8
         1QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760521029; x=1761125829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxTsaLUNFN0TxuXsjNpjP91qD7hOY0gJ2VmrfPOEls0=;
        b=kEw9Siuv8HhMrOj/cADoO9cllrKMLl/RvBDyFaH/J0IP6wEgZQGwVvN7du0G8cwXPa
         8qQg5urBWBZR6HLA523CI1+rc3nN7HaMXSPGk0HWS9qZ0JEojcJzJC26+7OiqI+dunt5
         QVM4By80G+/CH0Mq8v8XwIGIjIvJOlhx83CSoXwS9HdTgdkFXnghLjHvZRo2+E0EnSFl
         LiN87y1mNAuS5xGIIR/oMJtde4PIf5ZaTx/KWgUF/5b4P9Ok3uA1TqbDGoYeuvNXXHGA
         vvQqt8AyLB29xqw5L6KguDklGFn5DMfesvrf8vcEznmGmHR9XeAhubdOxaHqsPe/j4Rx
         LpZQ==
X-Gm-Message-State: AOJu0YzsR9H4h91NBbjH5T66GQbUuHB8YUMPRk/PpA8KzHwzfzhF7HGD
	1dlHm48w6Fvxkt/gOS1kwcSIgDZSdur3JuMHV7dhi+zIAcTFPrbMGvelAam5fGMU
X-Gm-Gg: ASbGncsBvTwSVPUcjoUXTrt1i262BEkoW+hXlAbcI2ZOnUbIgc/c0YN4x0uYiGnaUtC
	+22CH7fUhfTnZ2vgfNdwBRmfJyFve1tS/NP6JUb/1AV+FCrnk74wNvFsKhs3YiW/ztjjKRJG1Sf
	eIoAAVtgrd95xVk9wXwfi/pMxFOZHflifAvda/c48Qug3irW36/6XKunY+TU4HcMVHsesTTZk9m
	r5HmPF7GLj+c53EFr0XHe1dZYqKXGs5pyWVAmmEGFOD2bHW8wagE9+9JAi46GZp6L0+C6ne/xci
	EQjNLVQbCSQujlc019gZW5Npg45xEzur+AOouJUJzaq4yUhTDJcIg+WyfMGt7N06k4szmv2wWQm
	ev2599KjdoN3NWwlj2wGGWj04l9JeBSZYF2yp8fcboDB01NdOLZHcx+Ui4xR21Dk9FDfGj9SnHm
	LKlxnP1uwH
X-Google-Smtp-Source: AGHT+IGlAP1gGDQIB29MOx0XilyglZoXyRIwFckVdi2UIJEzYqQuz2dS4ZNxFaS8LrNzaqAyk6ZC+w==
X-Received: by 2002:a17:906:f589:b0:b41:abc9:6154 with SMTP id a640c23a62f3a-b50abaa45a1mr3104494566b.30.1760521029225;
        Wed, 15 Oct 2025 02:37:09 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd6b03f3sm179251766b.74.2025.10.15.02.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:37:08 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 1/3] ASoC: max98090/91: added new ALSA routes and widgets
Date: Wed, 15 Oct 2025 11:36:26 +0200
Message-Id: <20251015093628.659936-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The widgets and routes for max98091 were not available, although the
compatible flag has max98091 but only max98090 routes were present. So,
new routes for max98091 has been added.

Also, the digital microphone M1(IN1/IN2) and digital microphone
M2(IN5/IN6) could not be enabled or disabled from amixer controls. So,
widgets have been added, and now a user can from amixer controls
enable/disable the digital mics.

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>
---
 sound/soc/codecs/max98090.c | 55 +++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 22177c1ce160..77994539c3a8 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -817,6 +817,16 @@ static SOC_ENUM_SINGLE_VIRT_DECL(dmic_mux_enum, dmic_mux_text);
 static const struct snd_kcontrol_new max98090_dmic_mux =
 	SOC_DAPM_ENUM("DMIC Mux", dmic_mux_enum);
 
+static const char * const dmic_mX_mux_text[] = { "Enable", "Disable" };
+
+static SOC_ENUM_SINGLE_VIRT_DECL(dmic_m1_enum, dmic_mX_mux_text);
+static const struct snd_kcontrol_new max98090_dmic_m1_mux =
+	SOC_DAPM_ENUM("DMIC M1 Mux", dmic_m1_enum);
+
+static SOC_ENUM_SINGLE_VIRT_DECL(dmic_m2_enum, dmic_mX_mux_text);
+static const struct snd_kcontrol_new max98090_dmic_m2_mux =
+	SOC_DAPM_ENUM("DMIC M2 Mux", dmic_m2_enum);
+
 /* LINEA mixer switch */
 static const struct snd_kcontrol_new max98090_linea_mixer_controls[] = {
 	SOC_DAPM_SINGLE("IN1 Switch", M98090_REG_LINE_INPUT_CONFIG,
@@ -1106,6 +1116,9 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 
 	SND_SOC_DAPM_MUX("DMIC Mux", SND_SOC_NOPM, 0, 0, &max98090_dmic_mux),
 
+	SND_SOC_DAPM_MUX("DMIC M1 Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_dmic_m1_mux),
+
 	SND_SOC_DAPM_PGA_E("MIC1 Input", M98090_REG_MIC1_INPUT_LEVEL,
 		M98090_MIC_PA1EN_SHIFT, 0, NULL, 0, max98090_micinput_event,
 		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
@@ -1234,9 +1247,21 @@ static const struct snd_soc_dapm_widget max98091_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("DMIC4"),
 
 	SND_SOC_DAPM_SUPPLY("DMIC3_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
-		 M98090_DIGMIC3_SHIFT, 0, NULL, 0),
+		 M98090_DIGMIC3_SHIFT, 0, max98090_shdn_event,
+			SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY("DMIC4_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
-		 M98090_DIGMIC4_SHIFT, 0, NULL, 0),
+		 M98090_DIGMIC4_SHIFT, 0, max98090_shdn_event,
+			 SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_SUPPLY("DMIC34 DC Blocking", M98090_REG_FILTER_CONFIG,
+		M98090_FLT_DMIC34HPF_SHIFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX("DMIC M2 Mux", SND_SOC_NOPM, 0, 0,
+		&max98090_dmic_m2_mux),
+
+	SND_SOC_DAPM_AIF_OUT("AIFOUT2L", "HiFi Capture", 2,
+		SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIFOUT2R", "HiFi Capture", 3,
+		SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route max98090_dapm_routes[] = {
@@ -1300,10 +1325,12 @@ static const struct snd_soc_dapm_route max98090_dapm_routes[] = {
 	{"ADCL", NULL, "SHDN"},
 	{"ADCR", NULL, "SHDN"},
 
+	{"DMIC M1 Mux", "Enable", "DMICL"},
+	{"DMIC M1 Mux", "Enable", "DMICR"},
+
 	{"DMIC Mux", "ADC", "ADCL"},
 	{"DMIC Mux", "ADC", "ADCR"},
-	{"DMIC Mux", "DMIC", "DMICL"},
-	{"DMIC Mux", "DMIC", "DMICR"},
+	{"DMIC Mux", "DMIC", "DMIC M1 Mux"},
 
 	{"LBENL Mux", "Normal", "DMIC Mux"},
 	{"LBENL Mux", "Loopback", "LTENL Mux"},
@@ -1425,8 +1452,24 @@ static const struct snd_soc_dapm_route max98091_dapm_routes[] = {
 	/* DMIC inputs */
 	{"DMIC3", NULL, "DMIC3_ENA"},
 	{"DMIC4", NULL, "DMIC4_ENA"},
-	{"DMIC3", NULL, "AHPF"},
-	{"DMIC4", NULL, "AHPF"},
+
+	{"DMIC3", NULL, "DMIC3_ENA"},
+	{"DMIC3", NULL, "DMIC4_ENA"},
+	{"DMIC4", NULL, "DMIC3_ENA"},
+	{"DMIC4", NULL, "DMIC4_ENA"},
+	{"DMIC3", NULL, "DMIC34 DC Blocking"},
+	{"DMIC4", NULL, "DMIC34 DC Blocking"},
+
+	{"DMIC M2 Mux", "Enable", "DMIC3"},
+	{"DMIC M2 Mux", "Enable", "DMIC4"},
+
+	{"AIFOUT2L", NULL, "DMIC M2 Mux"},
+	{"AIFOUT2R", NULL, "DMIC M2 Mux"},
+
+	{"AIFOUT2L", NULL, "SHDN"},
+	{"AIFOUT2R", NULL, "SHDN"},
+	{"AIFOUT2L", NULL, "SDOEN"},
+	{"AIFOUT2R", NULL, "SDOEN"},
 };
 
 static int max98090_add_widgets(struct snd_soc_component *component)
-- 
2.30.5

