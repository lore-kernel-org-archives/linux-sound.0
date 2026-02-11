Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9641352C42
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809318; cv=none; b=r+iEEuT9ZOSAQzg+mBTOsel4d7tKM1AmCT3zvVoB2/3+uNqIvoeIw5JBbrR1Puw9zqwCJL/H8BhcqOlIZ4WUdtja5ZJ7RdWrE+XYDeW0Pwz0LyUf+A+9N9G3p+kX1LRitFXi+GdZqtiZv8a06PvW+w3dBqf0ov/4qvBuEKcEsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809318; c=relaxed/simple;
	bh=PPCSMbP+aNDgHbEn3U1sydgv/QNjeHb4rhjrjaaaIm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTEH5d0jkBWMqbAvJqziYwqR6LQoF7IbgzRHI39XRQLnS2o6F/TrkGLkirXC2MNmCCYGz/uyor60nLal2le301jNrcEh0o6n2Wm+97M8NXmnJtVee6a5NliV2XUJd4HZxdhb681JufWXkOsh9Hn5As2Zcn8eQvF343M6MUYRL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB+YMScN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB+YMScN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso12086785e9.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 03:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770809315; x=1771414115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3QlirGX/dyTIFPVVVGu/2AwF4neWtk7FL/g84dGVa7c=;
        b=WB+YMScNFosOfbZZ2w04qC5UjegjdtE2yXTriOE5LdLIWfWE0YQfmnSLuTS5kX5lSv
         7iSMXXImQjA9gmLwxvuETsMmE3LU/y3naSUtQs9AwH5sdM1AB5lal16YG2RUePKuUUWn
         BnIkAoWNAcuF/OQrzwoQmMe8CLEqIY4mo+srs86hP7VrnXMKb15sfjYZrZ+gz7HtZ3xy
         IMD5nzwx2Z3TxdKt6x7jGa1VFSGGkrhbRqFskAZXQRmOENQKyVpGEBDO27SI/ZmpOjZD
         NSVEvkY1gGTkIOPNbkeXfZcA+PP7P7vzK0hsVJz6KORuwGpRu36Mt1yovVkt18VBFS52
         7BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770809315; x=1771414115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QlirGX/dyTIFPVVVGu/2AwF4neWtk7FL/g84dGVa7c=;
        b=knknubzQtxlms2wSBoLGrXAY741TkGNG2jpHWPTs5t48jA2gypss4zPr1cAe3MsChP
         A4I3wltMtJfDc9AVbM+hZb7/A1ZkuNXRMGh4eJbBsgsZ5oh3kIGR7Et83KjOWs2UYFjR
         ixvLk4y13eDjycjUwhNmCtSrPjUphajFRWuF0p4z3TbeUioa592qvvhmcPsRKh6LnBN0
         rn5PMYrtTzHDt/T9noTBuYaXz/YR9pvcCEcmth+jq28NNj2hJx0V9qqhY2YQE5cr8gId
         S5PnjMQO23qnmR67fpwj8x1KMrDs3fNqKpdMo0GSkjJI1wF6Kl1Ft+AKW5KxrlfL6XXJ
         cwpA==
X-Forwarded-Encrypted: i=1; AJvYcCVhcCZtIrdGoHjuCvC0ahGaU2WYijtDQ+vzbeS/PkWLXMFKQQhpmDI7xeo6dD3OHv6XGq5e82ANjtArAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNHzxw/6Ht85boLgsc8exlqMsG19OStUMfi7mG9u/36ECeRBHL
	qsxJEbLHL3NieAj//iTVnNLkYUv13fYIsrX0MBbXt9x+gDoJAob42Ups
X-Gm-Gg: AZuq6aJ3yfn7WCy11OVhTYB2JK7PjtX67trxn2ieEAWeu3oTg7zMEk1wpnDfkd85Pnx
	ZGgLEwm87CemQezN71ElgKV3HvKtGtKlk7urmgW4IZuyoRYDv5waG6n5EZqa0yiOc4Ldz+mlnCv
	NgejN9SjUqQIpC1vKqSUf9abDKgMQDttNBhRgacnjwT7MLazvKto4b8ituDJn2Z/Luvrg4RZj+k
	JxG241pQo3M2UgCetNiYquIitW0dOINRgmyrrUBK1P7/W1hMVRkkHgkn+s+/jdCkvfBSbMxetGQ
	reB+gNVrI6/OkJU7/uKtG1XhHuEPwNF3FLb60hjvIQ2CunBmU5EGbyQ+6UNU5AU89WZ8DyvbjYp
	zoPCwUKHxr8ZaRac5DOUookz41RRQu1i3NSQvs1CX5pDKY3xE6v7Vq9RhERZ41J2KYrDqadECzU
	P+Ew2a0qxq+G8rzwaF7a7fbZp7UWF3/beYWkzkvHpYkbG6TwaPGY0Qxt6gEvJGrlonF+CUGo+m0
	vES/A125Z6ZF++PnGKgNsF0/2sJtQYHEl8a3Zo=
X-Received: by 2002:a05:600c:3484:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-4833d42d0bdmr146233925e9.37.1770809314895;
        Wed, 11 Feb 2026 03:28:34 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a627c96sm26751315e9.2.2026.02.11.03.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 03:28:34 -0800 (PST)
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
Subject: [PATCH v3] ASoC: simple-card-utils: add sysclk ordering support
Date: Wed, 11 Feb 2026 12:28:15 +0100
Message-ID: <20260211112815.126734-1-stefano.r@variscite.com>
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
v3:
 - DT flag not applicable, not a hardware configuration
 - Introduced enum to support order configuration

v2:
 - Do not change the default sysclk ordering
 - Make the ordering selectable via DT flag
 - Add DT binding documentation
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20260210164506.161810-2-stefano.r@variscite.com/

v1:
 - Changed sysclk order, cpu first, then codec
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20260206134014.143057-1-stefano.r@variscite.com/

 include/sound/simple_card_utils.h     |  7 +++++
 sound/soc/generic/simple-card-utils.c | 44 ++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 69a9c9c4d0e9..137eb795f587 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -54,6 +54,12 @@ struct prop_nums {
 	int platforms;
 };
 
+enum simple_util_sysclk_order {
+	SIMPLE_SYSCLK_ORDER_UNSPEC = 0,
+	SIMPLE_SYSCLK_ORDER_CODEC_FIRST,
+	SIMPLE_SYSCLK_ORDER_CPU_FIRST,
+};
+
 struct simple_util_priv {
 	struct snd_soc_card snd_card;
 	struct simple_dai_props {
@@ -63,6 +69,7 @@ struct simple_util_priv {
 		struct snd_soc_codec_conf *codec_conf;
 		struct prop_nums num;
 		unsigned int mclk_fs;
+		enum simple_util_sysclk_order sysclk_order;
 	} *dai_props;
 	struct simple_util_jack hp_jack;
 	struct simple_util_jack mic_jack;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index bdc02e85b089..66030f2bdece 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -468,9 +468,13 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *sdai;
 	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = runtime_simple_priv_to_props(priv, rtd);
+	enum simple_util_sysclk_order order = props->sysclk_order;
 	unsigned int mclk, mclk_fs = 0;
 	int i, ret;
 
+	if (order == SIMPLE_SYSCLK_ORDER_UNSPEC)
+		order = SIMPLE_SYSCLK_ORDER_CODEC_FIRST;
+
 	if (props->mclk_fs)
 		mclk_fs = props->mclk_fs;
 
@@ -501,18 +505,36 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
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

