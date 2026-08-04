Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6333A02B
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 04:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817853; cv=none; b=GeqxqS2zzihKogGwRnl68qI3s5tV3eIgQb36+9zMxH3/63O7brvhP0WpeN9B8tQtEY67BJxx0XW1JD2ntA3q29GY8shxdFAG+VzBMLXOKIfpVXONOz2olO9NC9m7N5y9d1IOdnDO73HxDP2zcrUHKK59JCWoxTYqJ8DmFJHahM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817853; c=relaxed/simple;
	bh=OAETXZTVcG4Rpgb01BW+Bm+y6f2gek5DmYAEnw75v6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAqbxvtMjHtq4h9iWq2PCFQDJOayVImGrLdqNRt6TbVwAKHXpqposAYTzWf3/gwuRZalI2EFGsfAvKU4j/3oEfhEdh16ZgAslXLrY1udBI2KnEQmXPE8Dagz0z/Mi0etKt57DE5alIjt7mV8FSrOTXRRJ2TapCqdKihyOIW1LRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEdA1kt/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEdA1kt/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cca0c5799eso35817605ad.0
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 21:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785817852; x=1786422652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yaXhmEwb+mJHwyLaCJwLr0hoYPttqtvD7BNNFbot6o=;
        b=QEdA1kt/hwG2JChYJypx2ps1JTOYoaFUwpLNPZLeV4KrLZxcJILXzBL7WM+UjD1f+D
         uFZJ0RvPXqHblGCRlrYjcWEq+NR79U+oQjWSitxLpm3DpT77wpOvgagudNj23zDaUOaj
         JFN2IGUWfCPahmm/AylmKJ2cTq0hk6dPzyBbAA4MIhjGdHEY9tbAlseRomH+83HXTjRp
         x3ttGYEnJeyAcCLAo9smTeviYQOofsHN7Uu8+rIQAH/Rf1/mmRg8lVkJW2a3myXqRR9w
         cAf/33q/KTVQDUi89TeD8Es+D9n807lVFpdSGJoqmiuoinPxdkg7/bYJiFEY6/bbBaxk
         tqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817852; x=1786422652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yaXhmEwb+mJHwyLaCJwLr0hoYPttqtvD7BNNFbot6o=;
        b=INEvqm//L2EZd3mpqJKTjVPcZ4DUvTpySH5FErfK80Idj5CaFp6H7eF7I/lJmKGvjj
         e6OoMu+hpRiNJzh/z2qSFije3lsTyMrgZRh485S3k5jvGxLTZc/6iQ7jDnUam1tp8th/
         m1+GD3KFle2Nu7GgohUPpFo85LPp1fyul0/eXVv092tuNHuILj+Esu9JAM89sSN1mMDk
         UPDNaden5/lZWe5CUdmnvvEGsr3IaBLekUNg3PGriIkgg/f81bVTba+6P7JF4KswMnwr
         Jc06jSvUvgUNJ9nuG2a9SH6U7XUdzoLS27IEVGMN40PDycViSOzEz+Md9FgYxFpowuUJ
         Y0xg==
X-Forwarded-Encrypted: i=1; AHgh+RqaTYLHBeApk3aldL7PYT0O7OTDsoXkiOtkXm5qc2WYIBAl99kPEPSi1N6OxvRvPQG+btUHZ7WsB1fOsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6nHGHPNoUrA7cv9ruWxUacr0ekKLlsGL19FIVO4BpyqRazzzV
	ZJad6ul3mAgxbMRMWyrKI9o/0ytj5qjN36fve1bDA9fosVOMWX8rbAZx
X-Gm-Gg: AR+sD10skdy4O/IDa0V2QHMZMoD/mqiEwhHVOAN8YNUtbmXnLBlHjqgG4KXrstzMuOB
	evaLfO1lxeiiexHFFYkjW9msN9yCJo9TjAmzQJxjWlEz+4NMLglfEiSiWRt+EzIousjXgiZgsB5
	1WcMpphKgJF1Q8Y9zDPE5qa2PbfC3jCSix1OJ/LQi5jvMf+DHwo2HC1Sf+TfG7Lf/d+0/lCRs3B
	oUhAJSyGeA+6EZLcYd/X1Jiej2PCBMYo1hgatFdC03eqWkQDE25g1n5pkBLidzygk+UP+uJOE7B
	ngpIwrLtQlLMy6k5MMBMBwmMKvF5+t1jpZ3Dzt0lI/s9T8y+WKzypU/Oc2MB721Kf1H9CRzPyT/
	ePQ+plDK7x+9PGhu9BWdRlSV8soLZ64x3cB0GbWz596MZQH+k0WCO8oAIgg3ZvKoQX/AFZq2uWx
	XtgQuPKyn3nfSi9hzt6PwFvM8stCLZLI4L0YCwBKByVvzZk/ZXu8JVoHdXiWc20/f8BFdILWBLB
	tN4jduYtGRhCV8CwXBG4vBtFhdy6wAd9Fe/R6ZS5fnlDwE4EczvqupwnbYqWrpUjxY8WxKb+Abl
	zvrw
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr118913895ad.8.1785817852050;
        Mon, 03 Aug 2026 21:30:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae58d8bsm46026045ad.26.2026.08.03.21.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:30:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: spacemit: Remove redundant DAI field initialization
Date: Tue,  4 Aug 2026 11:30:36 +0700
Message-ID: <20260804043036.22065-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

spacemit_i2s_init_dai() already initializes the playback and capture
fields after duplicating the static DAI template with devm_kmemdup().
Remove the duplicated initializers from the static template and keep
all field initialization in spacemit_i2s_init_dai().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spacemit/k1_i2s.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 2d5ea1fd5d49..28a762769253 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -354,22 +354,6 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver spacemit_i2s_dai = {
 	.ops = &spacemit_i2s_dai_ops,
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
 	.symmetric_rate = 1,
 };
 
@@ -399,6 +383,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->playback.channels_min = 1;
 		dai->playback.channels_max = 2;
 		dai->playback.rates = SPACEMIT_PCM_RATES;
+		dai->playback.rate_min = SNDRV_PCM_RATE_8000;
+		dai->playback.rate_max = SNDRV_PCM_RATE_48000;
 		dai->playback.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -411,6 +397,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->capture.channels_min = 1;
 		dai->capture.channels_max = 2;
 		dai->capture.rates = SPACEMIT_PCM_RATES;
+		dai->capture.rate_min = SNDRV_PCM_RATE_8000;
+		dai->capture.rate_max = SNDRV_PCM_RATE_48000;
 		dai->capture.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
-- 
2.43.0

