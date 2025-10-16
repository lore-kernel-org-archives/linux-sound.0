Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2AB7263B
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627539; cv=none; b=ENFj9RL87eyozm1LYzzsimvH7gP69JHONykdPsN5sQd7vfODY0YgMw1CrFq53JKtkQskPZ35N5/X07lL+0aek7NDMjtgYe+ZMeCoqed5nMWln361DuF4a69HkaUmNcXUwDr2J/MdvTARaAdgn/T/T1nViGlHr0rFDiHfun/+nmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627539; c=relaxed/simple;
	bh=LETHfDr5xTeScBuWi7juOqVgUF8u/NiOTy6b5RnI5Xw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TT2RJQbVIcM5fAcJii5VyHCKY12O3Fnq3W6NJG3yQezMTnxeQohpTMYTH9aNygJoopTfGGzQwYusVOb/dewT5KAC8MWn3SiT2ft00DN0IIVgJ16P1Tp56TLdb7z5X1uGV5IQHhpk/kZZIs4hMaJQyxE+Uqv/hvoaTrgCPrdqypY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHYCVhux; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHYCVhux"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47109187c32so4787275e9.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760627536; x=1761232336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4PeUuUxCl2RyKiD6Q9NUerI/HgqXN/tF7gyY7Ov9Hs=;
        b=QHYCVhuxr/Gam4Ub78XVAjvDUDRnp3/dd5YRXR/e3GIbIic5RvEXLeJFr+Y31hyXNH
         qma+qCDAGTEYAC/UkGyblPRlV6Vi4joJVH3xHXbZQINdzPESN3YlBY0lX13Pasc19fxp
         J7RSOopLAAq82a0TGtWdzsjnMVx3EtKfuHOIKDsXzx/ChmEx38u2iL6Ze0aaSagSaIT8
         b1NgJQczytusFm8qz+rtCWIYEVXnKLGjiX1FON7C/vvdA5qH3cRMNpCrcvkuOqI/D2W1
         30sHKnS3npOWL0lupiQD3S87DEx2Q7a0wSY2LgPmmaHodwBpx/cpHF4X3+oRwJNdP60t
         Fxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760627536; x=1761232336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4PeUuUxCl2RyKiD6Q9NUerI/HgqXN/tF7gyY7Ov9Hs=;
        b=UHRrVhq2WVUQ0IfL0bn0iQkxB59xEhx1gjHSmJxDhSUWZB24yUT9HqbmSodpYuYC6c
         D3Ap9PY6ZtfGKe47y/lxB6POILN4g+B1F8PqUxNkKOuNWkBbbL8mR0jNhwEk4RXb0eNJ
         GwA270BhwknhadOhLILUh2WVqgB4b0yUbohNHXzgmkHi71gNI4PnEN1kppwYoeac311b
         uao9glhtv3+TNUBvNmcPsT/g+VXDWvJUyiKTID1UzjdbVHx/STePum404/TosrsIx5iC
         b8c0/eO2oWMhnMXUrpiGTKHiPal1d3+pebXnrSyhfdtUZEGnglZ2QdnBU5YX4lCdsgOc
         G6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9WGPYo11uE5Cv/UScjHAeUMDymKuThbtEpd2O1RhwPWwwxTolOoPaMDsX1TUrWgbw3zXKStaVA5mCYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCxdmgpMkMdrqdiByoT2gdawl+teTBInwUh9H2Pe168JvcvNXy
	3pJvIjEcT8MeMbLZi9u7TMgnmtOG8fcS6BgZrvE5G+gbb73mBJkoyqXA
X-Gm-Gg: ASbGncvvKMIs7/WH7FCfvnSzDhEaXZN9Xj+KDJcYXmlNiawJ90k3gYDNu0abXBA27+i
	7z1JcvUpUFSKyrZeFJZgxrBSePaek4fiffYvhcb0ClYAiQuOUbHK2wYlLjPA+hL5ig70d0HPwNq
	IUlCYp3mr38H5aUxQwBfDaLyv7heOVuVKbYvmpOA2tZp+qWxzUbZHJo5vNF81KY9+gYKOyRSpxJ
	OfrZEdrKL9ZKLa0nPzSsZb3chhEy9kCdSz6zYbhkAacagoExpNOVqKY26NBhSXRrIEx8khZBB6y
	zzUuo/fTpuQXAXA/wn5R3DK5KdaJ/7c13Th9iRf0Ti5HtE5xZGRxSx1U6SvHN4nsuVOMcUP6RO3
	4B8TBdp/NK51/bGlaa4tyKl5nVCcSt8lNyeHxHV8e/ZcqUKz3zHHI4BJtGGXWuk4JpeYlGJA7D9
	hkyty5MacshjzI7TWTR4pZBDgGZzt0pVoOoU0NTHO2kjXWpFvfkErlMg==
X-Google-Smtp-Source: AGHT+IEONEyR3lLpZEMZmB3Zftmbosf2BVPdtC5QDPolK+jBnQhHU2Nux/pZjTfGzalpuj1O7Q/+yA==
X-Received: by 2002:adf:e19a:0:b0:427:53e:ab33 with SMTP id ffacd0b85a97d-427053ead30mr51944f8f.48.1760627536229;
        Thu, 16 Oct 2025 08:12:16 -0700 (PDT)
Received: from sharique-Precision-3640-Tower.hw.mobotix.net ([213.183.84.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf70fsm33661380f8f.27.2025.10.16.08.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:12:15 -0700 (PDT)
From: Sharique Mohammad <sharq0406@gmail.com>
To: broonie@kernel.org
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	lgirdwood@gmail.com,
	Sharique Mohammad <sharq0406@gmail.com>
Subject: [PATCH 2/2] ASOC: max98090/91: fix for filter configuration: AHPF removed DMIC2_HPF added
Date: Thu, 16 Oct 2025 17:11:52 +0200
Message-Id: <20251016151152.1107083-1-sharq0406@gmail.com>
X-Mailer: git-send-email 2.30.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The filter configuration register(0x26) has AHPF(bit6) for primary record
path, which is common in max98090 and max98091 and has been defined as
DAPM suppy widget as "AHPF" in 
"struct snd_soc_dapm_widget max98090_dapm_widget[]".
It is the DC-Blocking filter for the primary record path.
But the same functionality for secondary record path in the configuration
register(0x26) is DMIC2_HPF(bit2). It is not present as a DAPM supply
widget in the current code. With this patch adding it as a DAPM supply
widget. In the current code, the mics on secondary record path in 
code are named as "DMIC3" and "DMIC4", so accordingly naming
DMIC2_HPF(bit2) as "DMIC34_HPF", and declaring it as a DAPM supply
widget in "struct snd_soc_dapm_widget max98091_dapm_widget[]". Also it
is specific to max98091, and should be visible or working only when
max98091 codec chip is used. Therefore, written in
"max98091_dapm_widget[]". As "AHPF" is not part
of secondary record path, replacing it with "DMIC34_HPF" in the
ALSA routes to "DMIC3" and "DMIC4" in "max98091_dapm_routes[]".

Signed-off-by: Sharique Mohammad <sharq0406@gmail.com>
---
 sound/soc/codecs/max98090.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index cb1508fc99f8..5aff5a459a43 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1239,6 +1239,8 @@ static const struct snd_soc_dapm_widget max98091_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("DMIC4_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
 		 M98090_DIGMIC4_SHIFT, 0, max98090_shdn_event,
 			 SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_SUPPLY("DMIC34_HPF", M98090_REG_FILTER_CONFIG,
+		M98090_FLT_DMIC34HPF_SHIFT, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_route max98090_dapm_routes[] = {
@@ -1427,8 +1429,8 @@ static const struct snd_soc_dapm_route max98091_dapm_routes[] = {
 	/* DMIC inputs */
 	{"DMIC3", NULL, "DMIC3_ENA"},
 	{"DMIC4", NULL, "DMIC4_ENA"},
-	{"DMIC3", NULL, "AHPF"},
-	{"DMIC4", NULL, "AHPF"},
+	{"DMIC3", NULL, "DMIC34_HPF"},
+	{"DMIC4", NULL, "DMIC34_HPF"},
 };
 
 static int max98090_add_widgets(struct snd_soc_component *component)
-- 
2.30.5

