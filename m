Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC5932143E
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156572; cv=none; b=Gp0Gnhi/qbQouWWCZbJQfdL3uPbfZIQy8crACIXby2Vb2zXuOoEn2MPAfnFJIjIYudMrYWV4Ik2FpfR2dk7n7I9b+Rth6iqdmvXQaEfivo8L1ZcD5xDuOR9wc40NA4LGT9zABv3fxEGBWglvoLfiAenwAjwbuIOEGZ3ihscM3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156572; c=relaxed/simple;
	bh=xGWsS+NhgHopljeRfDuhkC0SpOc3NSyAXM4oSPGfawM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=KKsydd+y7ukH3hd4OYq3wASyKZgRbxI6K+bUeT8SrEy3l4SPBDGyhDHDbWRwmV9f2EyYngadYTllsTTqBI43QsbBBaJmGYiGEfqkSprdsMk4y3UmVA4GUlc7cVEm7tI+uA4qEYmsZRwaC7UA7n8E1vA+FBP9BDBj7hP4z54e96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NXs2j92s; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NXs2j92s"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b73875aa527so1059421066b.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 03:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764156568; x=1764761368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BbNaHp+xWWP2+xSdWEsjRjNinEGUkn7I7RJQG+xp7M=;
        b=NXs2j92sAvHvOrNN5wJbZM5Qs0mHtpHRfgPc3JuSD79l4zVSOQMVWhCTp4M23tXCR0
         eWuew0ROErx9LXFg+ihIduKRNtEnUT2nvTsSlp687hiDG0jwR/G00yAiIs6AvmtgX/XO
         4pl9VejK/QnsNSHK+06uMnwsbnsCk4jh5smZ8E6zFkB+99w9vWmIeK/Zz014avKC5PYU
         MLJRB25DF8AI4aqSRKWqKTQcGhMz+LsTp1osz5U7GAXone8Ct3LEBOHFTSO8ln+8rZLh
         Y5rdqitwZHSI/dTX6WRjiAp3PwvD0Pw0psaWMLl5t+A49Iqg6xTBsqayMVN4pFIVtBx4
         hBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764156568; x=1764761368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BbNaHp+xWWP2+xSdWEsjRjNinEGUkn7I7RJQG+xp7M=;
        b=ewVe1moH9hKA0DhrRUDXw2tKq5WRg087oBGCqY1g8w1MZDKOKbm3KRcp4sN9x2cCMH
         cSOGVJwpzU3yqN/9E7hQUYmtcwMgmP7Q1XA2ote2w/zP/zYQjlTlc4kBWFTiRPJ5Kv7x
         4rYMTpye9xHh8fk0+Ve5pdlKAZIDEFcsQ4+w1sV/jJ3rWk5VLl3cM+pn7+zx8a5BNUzz
         g99yRsvqrHDkBnC4TCuLL7nVIycVNZnnnKnOc/GzufyH8f9CJaaQN1YXqajOIEHSLxKr
         g40/gh/GSGLJAN6380UGbICKtA02vhHFbJ1peBdA1hHcfz3qFvYLAG1U2nLmUNQ5hK4k
         cTRA==
X-Forwarded-Encrypted: i=1; AJvYcCWTFh5cRfMQ6Z0yZvxdGq71BYKtTzMDPel2n44tN3muXLmVlAi9e87WEmpGqLaOkoxai5Rf5Sr9c2slJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTU7ANBY70wvZzYMFSt6GekAfTY2y1ni421vfv/fWb57QDe8P
	/YDDRHGzru6ptgvXTXwhHCR8B4IZpM1KmdqxiI8U3kv33+6xIB7xsrd27/z8ZqsyGUg=
X-Gm-Gg: ASbGncvE6L1p1XSHjk0bYtuXV9m7BFE1pQRfZVTuevSuQsLzxL1m+vlKyTMkP1QvQfk
	fgi9WKYvh+37uIN7++TACpd79RvuF3jAx+0je/Fj+qmg3yKchLLuN3oNTaOwnCYlOOOrv6OcJbG
	aXIK0HH6+x6j4sqOLozgoJGbFv6pstHcJLoeF2oeJbKUmI7MDhvLYL7D5vwR31ShuZn0M/tQgrS
	nhvPk3GU5qXjrt+yWphTSotn0KiwVM2bjQDKsrT13nxnRwNE7oWbAIRNIFbJMTp/aTjYgq8IvDb
	p2MhqOLz2o7rk2LdhVe/KJid41Wg+v+bmokxczhauQ/DY5klqeJlsJE1gGtFl94XeCzs6CGAUzt
	03QUmyL4nFyOWP8Q99VuLo/XTVzICjemhxUdCmcB5DNEicuyEH9KkHa4g1knYjwXEQA08YZFGSN
	+CMg==
X-Google-Smtp-Source: AGHT+IETkbRuPE+vjnhWDCgT4qrXhikBQDxtkkbnceGOqlhjud/3KJJQYdZtrpEe6ZGGWyLUhzEVQg==
X-Received: by 2002:a17:906:dc89:b0:b72:a899:168d with SMTP id a640c23a62f3a-b767159ef70mr2168924566b.13.1764156567916;
        Wed, 26 Nov 2025 03:29:27 -0800 (PST)
Received: from localhost ([151.35.193.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655051625sm1857718166b.65.2025.11.26.03.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 03:29:27 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sameer Pujar <spujar@nvidia.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sound: soc: tegra: remove Kconfig dependency on TEGRA20_APB_DMA
Date: Wed, 26 Nov 2025 12:29:26 +0100
Message-Id: <20251126112926.4126757-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=flavra@baylibre.com; h=from:subject; bh=xGWsS+NhgHopljeRfDuhkC0SpOc3NSyAXM4oSPGfawM=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpJuSQFUlercMnHINANRS8h841+bGd96hcjN80V T8vVm2OpsiJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaSbkkAAKCRDt8TtzzpQ2 X4X4C/oCd5sw45WcMWYjnVc2bcF+og1bIjSexMoL8ngBE2TJAkJVCMN5JlfFrilhWcjYgeWWG/3 4Bpl11a30W5G8W8C5bX/0Oz1jnnkimhBsXMo47e6/2F0+n284SPag3FUwbQS1fQ2NS8ReWEScLx Rm78xlYgDFo4rATporJvu9w+p1MuOLoroA0uOD2Fd2rogkel1P3AsrxjIDER+behv5F+DciNYzF TOIZ/49U4vcFIzP/M6WOzZql23y8+RFgJTL49VzoVkkgG2kkSgPs+LeTZati7AY0X7gcOx2SsFK C68z6aqfIVJ4t75JA7Fg+xM0sRB5oFmEB7dAuSmoumPViQNVf2iT6F6fFxZQHW+QtX4Smh5gHwO PbiMsp0SQnd2r5AOsrAMHP9CKtnAyOb5gpbBDaOANYlqYQeYNA0gNupmOWSA9yYNhU3D4CvR/a4 +at83O1byYjbUn52TPuYVtlct9x07SiurZSSG9NvaVum78dXmeGNGuXBgVOJp1B0x6hAM=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

The ALSA SoC driver for Tegra runs also on SoCs without the Tegra20 APB DMA
controller (e.g. Tegra234).

Fixes: 09614acd87e6 ("arm64: tegra: APE sound card for Jetson AGX Orin")
Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 sound/soc/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 71203a9197ed..9dbd589879fb 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -3,7 +3,7 @@ menu "Tegra"
 
 config SND_SOC_TEGRA
 	tristate "SoC Audio for the Tegra System-on-Chip"
-	depends on (ARCH_TEGRA && TEGRA20_APB_DMA) || COMPILE_TEST
+	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on RESET_CONTROLLER
 	select REGMAP_MMIO
-- 
2.39.5

