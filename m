Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51123ECBD7
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385278; cv=none; b=DlxlUcn9iWV1fuNfdehDS6BdYGFIyYajyeKYDeSpCmCBKE2TLv5MAzNnvxaOYz5ILcpyOKlkOeT5HBWHGPtcvOqvZt1pGhDgcCh1m01eVUc7mfRUyXjull2DalUQSsCwuBdqqYHmiCzYrY6a+gMsllPkzf5QKIsYWANMQ7zmbqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385278; c=relaxed/simple;
	bh=pNmYl4SRRlxoqTa+HBhQFonZHLfqFv5puocqMEMJFj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+EkJG3YY3CQCN/ApvbncIqPHrNLhu5xm8QxBSs/G8P8gKJNZX0lHj/Tz0UloIuUK1mIa7gMt0tlIs+/GwnVg823JOAGYXkE0U5/DQ+CBJi0alk7f3lwiZcrKMjn1TanUV+75jxlkoDv8zvUDDPDeJm8acPtzLdfHFDLfDn2E3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpkrKjFL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpkrKjFL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee07570deso6543645e9.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 05:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770385276; x=1770990076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c3KiMSbLBLSEsZOHG/N7zBYQbCkkX7NdFxJPu+HPiHo=;
        b=mpkrKjFLWlPK798p7MsBCUYBfHq29fQuEpM51w+laLP9PB1XJwAlkjeSSnwvFurN6y
         6ia7B/kW8+j715tuGe2pfo49GBRrEs4cduuRRPcgyczQL9vzHEK1J2PF6KSPXmve/EK/
         tzAIuYDDDHD7qFxI8dnlwoledmVSkj3n23yph14of4QhynVcujbylWnH+jRjLJLrnczN
         jhBMt0lQcapIwFXq8IwIo83w6Dd6Awvl64Z0872Fj6XSL2MDTygDWt6WWipBBOzJ0KVE
         NuWIqmWLf2pkhMnl25DYCez8fI/w0o0VKRRK5ywzinowFr9SjLE0oQal19shSQLmfzkJ
         LkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385276; x=1770990076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3KiMSbLBLSEsZOHG/N7zBYQbCkkX7NdFxJPu+HPiHo=;
        b=EQ+U0N0pzLnDdho70WpCXgT8tW7fstHH3GoFFGkZRsMzA/Xa50Lk7N6pzMp7mrWQPK
         hcJYgUb0q6FFRJUJkFjcH99g0ghcILRYcR0IqDlHWdF3ISbIPf9p9OWhHipEPdNPOwhH
         zCwG3boM/TE/6aAH2wsRc0g/SvgC7RoOePtMtN6XyPWbK/YpNS4pq+GD2EcySFDCNUhy
         HLV2fNdNQORhh25ifZXxctUHvWQRIM0uu1yCRXArJ/29RZnCHeMap5SrB+32o5i02udq
         qOSopv+0ANYHOVdEh/Q/tVtWD7KPH5po+aizOJv1apt6TM7/HZIbw6bPhRv7gvYoSSuv
         VEpg==
X-Forwarded-Encrypted: i=1; AJvYcCVEwhRrBQIC+j1FAGOKISJjWr5Oc/2akTBozU4DsIxBaf4/31xQHYbn7B0mnPXgRB+xUe2pPNyGvMf/+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGs8br+UbPQmm7JfCwS5gp2pqM6lMidtM7GFnn+kzIPkr/Rtg8
	U7jkiEpB8B1/f6cMK2XqkK8qvscq+fxbVN2DvyXHcXJCvnr+W1Ak/2N5
X-Gm-Gg: AZuq6aJ+lDVGQgm4oFE+ofAXZh8pgvfFvibZJSwFhSNa/0QTewGM2D0zEnVkAyAB7PY
	+fkE/3gu5rGAbzGbJ2CiDJEpeU3Jjaqzjygv+/wIQXX0jbEzIsJZhnQ/lhe3irsvKhFT+HfwZgK
	TnbMyxxQxs1UYnGlmaFv5UHlkayhtXBXiPHQ79y3x37Yi/+RDpHIHBEsPWv9miDfZLDLjULrZeN
	V46JJv40NJUt/GUPVDgSqx19v4Rnd/KkqHKgPOgrsOUADS3nBLhL6zMbZURAV6jee+/tU4SttXW
	tAE+l4zf07r1cZwD9fyOzd6OcC3C4PU8Dsi7Fz1WgZtc2CqILdseX6rLGnRUmpYFoQVo7Rkj4DY
	TJPofUCtkyIIGsjY15sBbAReVOFzGDMe8bi7TrbE+PxfpjtXJXRnJstbkPWocxzwanAf3FiT1J5
	UJfy0XFaY4/BD6xN3I/8EmGQAdtKJAT0BpYb5lHj0IZUJS7bkKwAC0c49+fipbjfJgnyN5m/1rO
	xyzrgS39nTje03lEIevNprr/VY=
X-Received: by 2002:a05:600c:37c8:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-4832017dcfcmr39432355e9.0.1770385275553;
        Fri, 06 Feb 2026 05:41:15 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832039d238sm33156995e9.0.2026.02.06.05.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:15 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alexander.h@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v1] ASoC: simple-card-utils: set CPU sysclk before codec for mclk-fs
Date: Fri,  6 Feb 2026 14:40:14 +0100
Message-ID: <20260206134014.143057-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

When simple-audio-card uses simple-audio-card,mclk-fs,
simple_util_hw_params() programs sysclk for codec DAIs and CPU DAIs.

Some CPU DAIs may apply the final MCLK rate as part of their .set_sysclk()
callback (e.g. by changing the underlying clock rate via clk_set_rate()).
If codec sysclk is configured before the CPU DAI applies the final
MCLK rate, the codec may configure its internal clocking based on a
non-final MCLK setting, leading to an incorrect clocking state on the
first playback after boot.

This behaviour was observed on i.MX95 systems using fsl_sai with
downstream kernels, which made the issue visible.
However, the problem is generic and can affect any setup where the
CPU DAI applies the final MCLK rate in set_sysclk() while
simple-audio-card uses mclk-fs.

A reproducible symptom is that the first playback runs at the wrong speed
("slow" audio), while subsequent playbacks work correctly.

Example setup:
  - CPU DAI: fsl_sai (i.MX95)
  - Codec: wm8904
  - simple-audio-card,mclk-fs enabled

Reproducer:
  aplay -D hw:wm8904audio /home/Front_Center_8k.wav

Debug evidence:
ftrace showed snd_soc_dai_set_sysclk() called from simple_util_hw_params
for both codec and CPU DAIs, and confirmed wm8904_set_sysclk() ran before
the CPU DAI sysclk call, and the CPU DAI then applied the final
MCLK settings.

Fix this by setting the CPU DAI sysclk before the codec sysclk
when mclk-fs is used, so that the codec always configures its internal
clocking based on the final MCLK rate.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 sound/soc/generic/simple-card-utils.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bdc02e85b089..50f60e4996a5 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -501,15 +501,21 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 				goto end;
 		}
 
-		for_each_rtd_codec_dais(rtd, i, sdai) {
-			pdai = simple_props_to_dai_codec(props, i);
+		/*
+		 * When mclk-fs is used, some CPU DAIs may change the
+		 * actual MCLK rate in set_sysclk() (e.g. via clk_set_rate()).
+		 * Configure CPU DAI first so codec clocking/FLL sees
+		 * the final MCLK rate.
+		 */
+		for_each_rtd_cpu_dais(rtd, i, sdai) {
+			pdai = simple_props_to_dai_cpu(props, i);
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
 				goto end;
 		}
 
-		for_each_rtd_cpu_dais(rtd, i, sdai) {
-			pdai = simple_props_to_dai_cpu(props, i);
+		for_each_rtd_codec_dais(rtd, i, sdai) {
+			pdai = simple_props_to_dai_codec(props, i);
 			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
 			if (ret && ret != -ENOTSUPP)
 				goto end;

base-commit: b7ff7151e653aa296ab6c5495b2c1ab7c21eb250
-- 
2.47.3

