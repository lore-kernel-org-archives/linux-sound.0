Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674473148CF
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 13:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227752; cv=none; b=dBd9wQywse+iIsH3n1F/mSJ2NBACsJjjW+mFjadULBr/aS4T0jUQSSqtf1qsV+gTjFaWRXlgVGau2A40XzvgQ+afzN/+SUTH1g8ya0pZPFagirr1DgzLIu0rxzLb57veA4L2Ozih39ekY8x27J63BtMF4clGTEOhyrO5R9706dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227752; c=relaxed/simple;
	bh=IpvvKMDeUVDhUPvWRXSZe9FOqh+M52LzGhFaBjsBh/g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f35qZOetjuezT9JMEmq/6xRfkC486K6mwRDISMYIuzubzHOna/ugzV9hfYXm0Mc4tVOZX3XZBs6DobsyW6pz/YlIxTswDJkY4fVrw0wL9tEU+5LRtDDlitToQpdQwSPHxfwgYOEFt9U29wuPxMN0vGLfnSmi2oZQQV2KqnWwa6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUAZArw0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUAZArw0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-427015003eeso831059f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761227749; x=1761832549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/eMMiYExXphSaV0eJ7915+DqGCkBLLJG3TnOqbWPUA=;
        b=hUAZArw0My6j3bBwXBePWetjuCW2WWKKQGVUT9OJqnZx6/aiMhytdldMx177LISTYb
         KSYQuxxfZXWfVtLFzfDn2dfxOpH1DMAzjpRrvXMZoY6bPX4KXmLVZkrpRtQAMbamxY50
         kgQV1pld1hMLeb6v4Fsfv8wcpH2QjSrscE0JX9skeILpXFO9GoOVA/MmLkRODZblpgY5
         FBu6w+kfvYqTiUdTEhBXMFDvOGR0Lp0ZRomro7FXEuRbuLXRYmskotXOFIfHuGN+vqok
         c0DRRjyPNJenYjANPm4U+Su852BKmrwtfY8+exrCuT9b4Lb27McP5DjKWrdWMh2eEEHE
         NQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227749; x=1761832549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/eMMiYExXphSaV0eJ7915+DqGCkBLLJG3TnOqbWPUA=;
        b=fj5lwYa+v9npu1z/rrTs8UwCNZ2PxMPEUVJ5f7JmNwamzVuL87x+f6i3+olctNq4Up
         AxLjoheaF1QPMdHSzBmqGh4ktO+zYhuVHLvcEmxhG4PWjCW2t860WiQFKWi+2SM54yjg
         5Gmj8E02Sj6e0YxHYTu90R0wzyW8pnkORx+0R/NMMfb03kigyUpCjeCmb8p5jBJOImkQ
         SbrcY/paaWYDNSnECIZI5H7WWCNP5sA5ZuQo6WhwidOkGvza3XG4thhWD4UY/GfMeLtm
         t2/pcXBvFDv3txxoesS5oTfPmGgqUS8pzPcB/vNwSs46DtCDRyqM5bdVfFg1WDzn3+11
         bb8g==
X-Forwarded-Encrypted: i=1; AJvYcCVtSM4mRFzCBWkebhK3QyJtTa8IjVbEDxiAHPYqywqdd17iDTZkTjzZ6c8IYE0CN/7KN4u6uI3n1JEkHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw8E1FGCFvSzEUq9cOZWwSsF6bC7d+RBJFqOIIbfNBZ6xstD02
	Xgh/ymKZdIpsAIJuDaimAU7a04LYwYnT8SDJGZnKDSNMvvnTBwh/Ttn1
X-Gm-Gg: ASbGncsisskh4vD4Iacg82hpyCHveQIMvcU0AKQ7D2Bi9cf/+9gphswi1O74R7yYKEU
	kPV5Rv2xpUaDDEb9xWgxPbt30/R77rif4ivAaWBKlLoks1Fj8LbSbjglQcGV3DZv4zzQxX7e57E
	B+U56DJ1hAMtqNeZuswVYQ1ixyNQrgBsdYto3Xcqz00heW9F9mhR2cfrPQiK1a2V2XYT6QzbvYf
	++ScGDH+wf1yQcx647qmuOySbH7OIg6mLAMW3jPbTeuSRMU1ZDOyxs9RxxHioDFC7B0Ye1+o78y
	zI99VyZ/TzOPBqP8CarEj9cf+rQ5ko1w8gh+9+Gz3UPA2NatjMtPiuf1z3eUH2w7yErRax9LAiH
	UoHs4QyHKx7xUt1ML+w7FrCKp+JGge5HJWUz3HYeVVrhZAZF7A/V9/1QVTuORcQcelq+G583oAn
	OWDB4e0DsVmYijAMXFxdqCWtIl/92lW8lnBDMDG127C8Gpt6U4NMGmWA==
X-Google-Smtp-Source: AGHT+IEFMXtBhGlwydY+8NEah9cTIdVlF37W8QggkFOe+uBfl90n+GxwvtCkgvqo+SsLBMKJaECmTA==
X-Received: by 2002:a05:6000:2887:b0:429:8a19:96cc with SMTP id ffacd0b85a97d-4298a199962mr1584427f8f.32.1761227748501;
        Thu, 23 Oct 2025 06:55:48 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ecabdsm4327126f8f.47.2025.10.23.06.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:55:48 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: broonie@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 4/4] ASoC: max98090/91: adding DAPM routing for digital output for max98091
Date: Thu, 23 Oct 2025 15:54:38 +0200
Message-Id: <20251023135438.2245693-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each route connects two widgets, so in this patch, the widget "AIFOUT2L"
audio interface output left secondary mic and "AIFOUT2R" audio interface
output right secondary mic is connected to "SHDN" and also to "SDIEN".
Route with "SHDN" as source is required because "SHDN" controls the
shutdown and must be ON for codec to operate. Therefore, "AIFOUT2L" and
"AIFOUT2R" must be active when "SHDN" is ON. Route with "SDIEN"
is required as serial interface logic must be enabled, that means
serial port must be enabled, which ensures I2S/TDM clocks and serial data
lines are running. This is also the case with audio interface outputs
"AIFOUTL" and "AIFOUTR" in primary mic.

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>

---
 sound/soc/codecs/max98090.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index ef0c4f2ce1b2..2e6ec2ac5327 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1436,6 +1436,11 @@ static const struct snd_soc_dapm_route max98091_dapm_routes[] = {
 	{"DMIC4", NULL, "DMIC4_ENA"},
 	{"DMIC3", NULL, "DMIC34_HPF"},
 	{"DMIC4", NULL, "DMIC34_HPF"},
+
+	{"AIFOUT2L", NULL, "SHDN"},
+	{"AIFOUT2R", NULL, "SHDN"},
+	{"AIFOUT2L", NULL, "SDOEN"},
+	{"AIFOUT2R", NULL, "SDOEN"},
 };
 
 static int max98090_add_widgets(struct snd_soc_component *component)
-- 
2.30.5

