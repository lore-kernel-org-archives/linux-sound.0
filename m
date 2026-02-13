Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295F244694
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770995053; cv=none; b=A84A4das3R0O15Kadae9vnOezwQEoz0gicZHVpHjD3Nf0vjxB5/RTqbqmmo8u1SxfiFqmSUTOXWmdxCQ3m2zAdexn4um4gl40jZsim6VaG/anfnHIROQv4A/hGvmg0jNOb/O4j7aqsmymluuabWk/2kMR2M5SjO5dJ1RbIGmNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770995053; c=relaxed/simple;
	bh=rd7ftiDWeKZpxjuPpHq5ntNrtMaA2MU27hdgoilzni8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFpmgQhAkGhkKmSheP/2C1jUwgRkhlzWQGUuihJw+N6y9r81JHXKu0nOMFmn1y8bT+gMmZI2z0ZYoXm19sT+HcWKJNmhUTgNsjflqH8KbJV3/w0bkGI4DhLrUlXh1bT+NvIYqdhaqUWYuIDu2SMMDbRSXldu/23MRvIIGq3LO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmoiW3ul; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmoiW3ul"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so8203175e9.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 07:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770995050; x=1771599850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnKqcCRtDukSklHMOGY9brz+NRiecjhUSwToNuGRBho=;
        b=OmoiW3ulN3QBNmxKtLhFhzkcytDnWbHG8FueTcz8bSRTkAUwYgXLb6a9AtCqXPe5jO
         8lbfKwbobk4/DHZgTpd9QeXtff4BYF2aZu04LjjJWd0xgoLZxXM9zR6eY8u/4J1glqMA
         h4fRVV4xEyem2gVzt6sXP54GIrhiPi7ed5oXYe3BK1jTtGqiCgTl4jEJvGtZelH6cTSc
         lBwr+vmkURN+TJty7HwG1+RkJRZPVUgOFAR7DKUDJxZBBto1AqThvPyf/6WVfOC2Ivs+
         VskVHcA09NbhxBFrcZ1UajqDIhWApmz0Rnc4kN/CLml6W23npZ9Zq0hWVijW41EvDZTi
         EgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770995050; x=1771599850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnKqcCRtDukSklHMOGY9brz+NRiecjhUSwToNuGRBho=;
        b=EE3l1qZVW+i4inEatZK38xskZQgpfUpBwLDUUMr4H8xdL5+qO+7eMT7ekbx9UiLL28
         EsQfmNIx9lP54hjGGzyYWrsgk7s36TfuBTPtHLJ1SpHfkzEWpxrUsR1cT2cosDq+PZN5
         w9kC7EzfLSZy1bIV7guoUAwJTQD4ISCGCof8YxB2PLEDw+tUVLJ9r5VfOLRm/d27M9ez
         SbQB4IjDoX2V31PLSgtBHCXdm96iTSjhdmPwEhnBrSUx8QytUg6EBUwwQQxkc2Ex+Lk/
         6rpYQAp4AXAcU9I+EoDk/xH2YnbgVv6oSVmsAmK8HDYxMIwUjH/ASw9FAkLLlp0ETL2U
         +Q6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhNxI+ay56F2KuQcpoAk0Le+YwwCNgsl2ZRzGKEbQ91D0XGhf2A/MjI0+pqn7ILPgwoVCFVLzkQf0ORw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQIpQgvW3xnDTsNhZsphqV8BNz9n8MwEKsbP845mqMV1NUFsK2
	6BT/QUI7WsToJGljLKQFiFtguUHoyOJxmPKF9/v0klEIm1VStv14bDyC
X-Gm-Gg: AZuq6aJkG1gXRffqAUXUxcdrCY+migosdiRF0WvF10bVNxvLIxUcrzC/+YT8eXHZVTW
	VVbalC25OvjovGrIzO2+UxNHprBlcC922kt4Ty/k7RKEkaBYQdgGWqVkgWvXyHWgSBc3xPH6Ao+
	j0+1mjFgXKwvnfET5X5WuzB378pu+IKqvX8AtxuTnrROUgRJ6yvS6nRBzgI4FuXn4COVni8rf4s
	8JVbbLP6spAX1wsOtLmKl/aYQPZcHondsaCIh6nQngqyGTEC5/pVqIM3HlFYigX1YcsoohYw8wb
	zDVUiPONDxxMSPu55kjOjlcNQ0xvMFb1VcsWDcf9v96XclHRwxnMWdbI+0W6h6yJV7nO50KvKtE
	y0MF7r3WOXA8ze+Vo/uuoSHveZOhZlJcbsj6hraw4UCcHIDEIeClZxVgFBU34Z6lH5JeQdf3yZ0
	ISVnf0ifY9XCrpSnHrvhGjqhyaKfBmyi4RJca/hiJylD/JzNOn0lJBiYXYqTEG/BngQDZR/wNv1
	wgfEGljBgl740/E9J0JftKJmbtZ20kDNXY4Mtfw
X-Received: by 2002:a05:600c:450d:b0:482:eec4:758 with SMTP id 5b1f17b1804b1-48373a4f05bmr38130885e9.26.1770995049313;
        Fri, 13 Feb 2026 07:04:09 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d92267bsm290459385e9.0.2026.02.13.07.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 07:04:08 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alexander.h@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: [PATCH v4] ASoC: simple-card-utils: add sysclk ordering support
Date: Fri, 13 Feb 2026 16:03:55 +0100
Message-ID: <20260213150355.442609-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

When simple-audio-card programs sysclk for CPU and codec DAIs during
hw_params, the ordering of these calls may matter on some platforms.

Some CPU DAIs finalize or adjust the MCLK rate as part of their
set_sysclk() callback (for example by calling clk_set_rate()). If the
codec sysclk is configured before the CPU DAI applies the final MCLK
rate, the codec may configure its internal clocking based on a
non-final MCLK value.

Such situations can arise depending on the clock provider/consumer
relationship between the CPU DAI and the codec.

Introduce an explicit sysclk ordering enum in simple-card-utils and use
it to control the order of snd_soc_dai_set_sysclk() calls in the mclk-fs
handling path. The default behaviour remains unchanged (codec-first)
to avoid regressions.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4:
 - Removed SIMPLE_SYSCLK_ORDER_UNSPEC enum

v3:
 - DT flag not applicable, not a hardware configuration
 - Introduced enum to support order configuration
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20260211112815.126734-1-stefano.r@variscite.com/

v2:
 - Do not change the default sysclk ordering
 - Make the ordering selectable via DT flag
 - Add DT binding documentation
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20260210164506.161810-2-stefano.r@variscite.com/

v1:
 - Changed sysclk order, cpu first, then codec
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20260206134014.143057-1-stefano.r@variscite.com/

 include/sound/simple_card_utils.h     |  6 ++++
 sound/soc/generic/simple-card-utils.c | 41 ++++++++++++++++++++-------
 2 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 69a9c9c4d0e9..915e6ae5f68d 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -54,6 +54,11 @@ struct prop_nums {
 	int platforms;
 };
 
+enum simple_util_sysclk_order {
+	SIMPLE_SYSCLK_ORDER_CODEC_FIRST = 0,
+	SIMPLE_SYSCLK_ORDER_CPU_FIRST,
+};
+
 struct simple_util_priv {
 	struct snd_soc_card snd_card;
 	struct simple_dai_props {
@@ -63,6 +68,7 @@ struct simple_util_priv {
 		struct snd_soc_codec_conf *codec_conf;
 		struct prop_nums num;
 		unsigned int mclk_fs;
+		enum simple_util_sysclk_order sysclk_order;
 	} *dai_props;
 	struct simple_util_jack hp_jack;
 	struct simple_util_jack mic_jack;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bdc02e85b089..fdd8b76f2914 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -468,6 +468,7 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *sdai;
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
+	enum simple_util_sysclk_order order = props->sysclk_order;
 	unsigned int mclk, mclk_fs = 0;
 	int i, ret;
 
@@ -501,18 +502,36 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 				goto end;
 		}
 
-		for_each_rtd_codec_dais(rtd, i, sdai) {
-			pdai = simple_props_to_dai_codec(props, i);
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
-			if (ret && ret != -ENOTSUPP)
-				goto end;
-		}
+		if (order == SIMPLE_SYSCLK_ORDER_CPU_FIRST) {
+			/* CPU first */
+			for_each_rtd_cpu_dais(rtd, i, sdai) {
+				pdai = simple_props_to_dai_cpu(props, i);
+				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				if (ret && ret != -ENOTSUPP)
+					goto end;
+			}
 
-		for_each_rtd_cpu_dais(rtd, i, sdai) {
-			pdai = simple_props_to_dai_cpu(props, i);
-			ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
-			if (ret && ret != -ENOTSUPP)
-				goto end;
+			for_each_rtd_codec_dais(rtd, i, sdai) {
+				pdai = simple_props_to_dai_codec(props, i);
+				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				if (ret && ret != -ENOTSUPP)
+					goto end;
+			}
+		} else {
+			/* default: codec first */
+			for_each_rtd_codec_dais(rtd, i, sdai) {
+				pdai = simple_props_to_dai_codec(props, i);
+				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				if (ret && ret != -ENOTSUPP)
+					goto end;
+			}
+
+			for_each_rtd_cpu_dais(rtd, i, sdai) {
+				pdai = simple_props_to_dai_cpu(props, i);
+				ret = snd_soc_dai_set_sysclk(sdai, 0, mclk, pdai->clk_direction);
+				if (ret && ret != -ENOTSUPP)
+					goto end;
+			}
 		}
 	}
 

base-commit: b7ff7151e653aa296ab6c5495b2c1ab7c21eb250
-- 
2.47.3

