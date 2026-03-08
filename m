Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED42021257F
	for <linux-sound@vger.kernel.org>; Sun,  8 Mar 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772983141; cv=none; b=SU4bw6xxZBcOs3rK2sCPuw5iNxzLoUJVYF5IFhow+1+sm0LHSD+GHKEJHmik57N7L8AsGM7TBI8AZbDpQHR68Zj+1rc7ptdr2+4uYwGdBSiigQ1kEFGJX8awFrzJ/+cXQOgBg6sFWlrLZUl5/dxKZNG09gJBYCLr+yLWrvf1dmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772983141; c=relaxed/simple;
	bh=9VBUU4KM/vrA1+8L4OfGhv8MK6Shp1YJcKCP/RaBOus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W12BVnQTq7bN/20QxadfgWICsSuJjf2cghJTx0X2LNKgkQcsNym+axuWAd5954qJEmtCwNID9f3Gy7b3RHV+7+F4wdCZ/tFS6l/yxv1092tP0n/kBeeZ5YemjLV2XNt+fPZKgdRnxKwO8hSUoDcldBET4SdXzp1sGRDABRSMMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCQOlsMB; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCQOlsMB"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8297310ce0aso2688176b3a.2
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772983139; x=1773587939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD4NYspNQvZ7Z0XS17j1q6Nl+NkHm2f/v3xkfa00gKY=;
        b=dCQOlsMB83XFZ8sSFPwQ4fhABH2ZBqp5yNNLKCsvh/Pdjp33yJmEeTlSKYHHg1SpP8
         TAerfvXfo2JMJ7Hvww9F8KUCaGUP4AdLSJBbRtAPzD7hQnPwN8PkwmzBUoIx4T13IgbJ
         H2Gj068UuWKMQH7y/wDcVa8d84Z+r5YUZUlhSLXZFWWfvyi6LzzhyNMkHfVVtXaHFc47
         sBa0C/xGJP2wnd+fiAAzXNfCbxEqfsUHZ0GY4faeSTeJy2SuGX6ST2BZdS3ww+Nu40bD
         hKNChoYIaYZopbSIDbNzxOLb3TDoF/hUZbAv5mlU5als9vLTnUFZLargN+kn8G8iVr0J
         6dyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772983139; x=1773587939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GD4NYspNQvZ7Z0XS17j1q6Nl+NkHm2f/v3xkfa00gKY=;
        b=vp0mljZXxrGiuX50tfQOw39hjQ4TiR/XxyyDckDB5iIPsHNJ8NMioQ3BzPRyswXioq
         8pkhfwI+N7KrK9T+4djDK2a/hi1tFG5XiF1cZmUI0ZFnj83CNXgtijS9jYPb8Z2Rq6/Q
         qduLwLARuy/jUj1HoTmAIZLmlmOct7Ab5M5lGHHfbUF1aCWQM/veVTSMYEKpkBAzwSIY
         eE8uOct1irKW/1Zs+EIM00jkx+LzkuQDOp30Z4AomoHd1cnSB/Y1lwq+RPNORdtDY6ix
         CEuBKl9YuOBXQRxAP3pbs9NS2i55CUFAIsRQDh8wrZiU07asucOFu6pVj3Q0jM7jtkga
         hbWw==
X-Gm-Message-State: AOJu0YwFL8SDnuHTo7gPAKO59dOk6gAQOmOS6uIYv5mgLAX2wl2JV9YD
	GVu62v4jOzb+MABY4hZt3nNlSWHGHllqNIgC0Rml9YobAgKX2OquT7KsI0/ri368M1A=
X-Gm-Gg: ATEYQzx19FsMxVrAXKH3IyxEdXVkxTMuCPhqCRSF02ijbU4asTP/QH7XbHsjb/WlYbH
	J06iBBCeDBWm96+A1Gpyddu9CiXG8V1ed52RWdIxFGIK8fAUDqjDNfDN49JLMSPghF2R9sXA1X/
	W0e6BzfABj4DiyzeKUvZAnNMeZtO2NqVEx4nxPngSpiPGfquCKInuqPE8ou/G+yl9lQyg/oBlFI
	+ALLGgKWc6NZKerVEEFalOE/63kJLTwHbp/nb8eUyZC139z/Gv1qQptzEtnOkUvZ5koVxoCkTVp
	I+7IfoEOGHKYeEUMfBHvpmwy6gq785W3Sd3yejUoVW2rKb0hsrW4ALcFvhXwoOXfFTNCA6vNzKB
	6v44Qf9ayJapHv0nBVyMJGW0zjNUEOAFyA/wsWdswmRdg4CwRkcyQ/k63x2NYqSrS/X3EWQH+j5
	E1pOkmYaGH+EzG1mLSWtMYlde8
X-Received: by 2002:a05:6a00:4505:b0:824:36f8:346f with SMTP id d2e1a72fcca58-829a2e4ba0fmr7035262b3a.25.1772983138964;
        Sun, 08 Mar 2026 08:18:58 -0700 (PDT)
Received: from px13 ([218.155.71.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48ddd18sm7432513b3a.56.2026.03.08.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:18:58 -0700 (PDT)
From: hasunpark@gmail.com
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Hasun Park <hasunpark@gmail.com>
Subject: [PATCH 2/3] ASoC: amd: acp: add PX13 SoundWire machine link for rt721+tas2783x2
Date: Mon,  9 Mar 2026 00:16:53 +0900
Message-ID: <20260308151654.29059-3-hasunpark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308151654.29059-1-hasunpark@gmail.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hasun Park <hasunpark@gmail.com>

Add an ACP70 SoundWire machine entry for ASUS PX13
(HN7306EA/HN7306EAC) with rt721 and two TAS2783 amps on link1.

Describe rt721 with jack/DMIC endpoints on this platform and add
explicit left/right TAS2783 speaker endpoint mapping via name prefixes.

Signed-off-by: Hasun Park <hasunpark@gmail.com>
---
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
index 7a567ba02292..1ae43df5da6c 100644
--- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
@@ -69,6 +69,28 @@ static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
+	/* Jack Endpoint */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* DMIC Endpoint */
+	{
+		/*
+		 * rt721 endpoint #2 maps to AIF3 (internal DMIC capture).
+		 * Endpoint #1 is AIF2 amp path and is handled by external amps
+		 * on this platform.
+		 */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device rt712_vb_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D071201ull,
@@ -563,6 +585,40 @@ static const struct snd_soc_acpi_link_adr acp70_rt1320_l0_rt722_l1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device rt721_l1u0_tas2783x2_l1u8b_adr[] = {
+	{
+		.adr = 0x000130025D072101ull,
+		/*
+		 * On this platform speakers are provided by two TAS2783 amps.
+		 * Keep rt721 as UAJ + DMIC only.
+		 */
+		.num_endpoints = ARRAY_SIZE(jack_dmic_endpoints),
+		.endpoints = jack_dmic_endpoints,
+		.name_prefix = "rt721",
+	},
+	{
+		.adr = 0x0001380102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-1",
+	},
+	{
+		.adr = 0x00013B0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-2",
+	},
+};
+
+static const struct snd_soc_acpi_link_adr acp70_rt721_l1u0_tas2783x2_l1u8b[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt721_l1u0_tas2783x2_l1u8b_adr),
+		.adr_d = rt721_l1u0_tas2783x2_l1u8b_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 	{
 		.link_mask = BIT(0) | BIT(1),
@@ -650,6 +706,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
 		.machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(1),
+		.links = acp70_rt721_l1u0_tas2783x2_l1u8b,
+		.drv_name = "amd_sdw",
+	},
 	{},
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
-- 
2.53.0

