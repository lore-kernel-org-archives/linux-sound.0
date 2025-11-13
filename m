Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA83330B18
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022359; cv=none; b=tbQrFjFac+9Gu7udoBuEcii/yfq7t4+74Btjp69I/KF0cLgyrgF87WHyJWH4B7bBsMV+LwUHNcV7oKz/HKYikA88zSY0RQJr2Vw/03IyUNcaiLvPOLegmybedMqrfOvjOJlQA+XT6JpjTMlgdaL0HABN6dD+YA/pwPxDSPk62B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022359; c=relaxed/simple;
	bh=Vvo09bFq8tEaP1B5nFoGfs/9TqliMjuKbCECXkO5VIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4zUBd5iAVxwzHtnRHEf0vBPZL9nsjTfkvtKL/7bBq68eHhqySH5qj8lwXL1dHKojPkw0vohLQgPBxKrYJHWepFocxVJZ3FblE6YFc7VIzZWm3y3nk+YN6g450OQryaLPyw2h52pJTGP8nm6i2Q2Az3xvIt9e+VPflsYrBljRds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeAeo5ll; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeAeo5ll"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so5965835e9.1
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763022356; x=1763627156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEgvbUe/SG9kBJT2lT+vOW4S6Qvv1BIswGeH2rkA3IU=;
        b=BeAeo5llKhjTG1m+stMMWqFziKWB1dPYlN9uogyteIiKyz0F6ZROlZK7Dn0Bqyu/sn
         i+l+KYgeubt4SlBuZctHkaZW0cQX1Ex93vxd+3VabqWk7xNjZXx0gKCQk9twbsCBSt78
         Qve66JfBwWFaU81a755i3YyUy1XFle1fUWra6BcHEhMr1r7NFNfnVXro8wcJGY7qEtif
         f7jWDaeGfw7rmxfgzwEbqQG+D15d9kfx8XgzSkkPPSTWSBcbgcPeGBulFlc2Qh++6pyg
         ukB3vds0G468Zng+n2069IOPJbhEeOo8LhZa+XG6rwrSjzglSY3lw/VWoQL1rM48oC+1
         83ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763022356; x=1763627156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fEgvbUe/SG9kBJT2lT+vOW4S6Qvv1BIswGeH2rkA3IU=;
        b=tztCDeA/l/PB1W7yXH+XV4tcQd3w5IoJ/ha3DuXJp2BZ8qUELaHTMuMtGptGwOb2Za
         SaJOttneP7uSujw79VPDOFAAFZgT6/EAOy8XdQqhdurWPx4vo7ULe271YOCmtkHi6t5e
         cbLtP5v4n41xeWScA1emWe77vDgjAe94N8qvOYknJrupBeg03ZJhWrWyXHW6jhbxMDTP
         8JluVbmrfUK4gqtYobDpJCDUPt5p0TDBoOWcea+IeosjWIf4sa1dqobSgIY3rmUDDew+
         gA5NPVqj00NIB/zK0XcEWy1qk1DPb8eGWVWQhIw5iVApEyh7tDLN/LwB0ZVLROt/InO2
         U1wA==
X-Gm-Message-State: AOJu0YxHvKSajX59cdm/maxot8Eh3MgHOpwLl6MKsGvcpWsqIkdCC8vX
	avqDLI3DJ2ANvv5g9jPinYBpy8b6jzQMjbZhvYJJBmIsg3TFqpMrYWnq
X-Gm-Gg: ASbGnctvJHof32COU0ogUnARQ63jE8eo6OpUAGMVgl287Y3l9rLJE8nL/029Ym1/N1M
	GOWaxYUqai49zhWpPEcKxQB7P+fXqWFWYnhsvYh+E1m4wAYyFbxhvqass1xLPz8z5tmQWfQ+mWa
	/F1FnUxmPDGjkroF6YCUpwsiPCwrST5R4LJ6oKOCUlJEYkfFFbNofdCDjysxqFBgoZFJAYEPzm9
	rC3VwRluo5HFftUldZyNQHayJmJ7mKXVHFbR0vwcfdEPAB8ERwqJtU/FI4z0Ue4IetxI1RSuU0P
	6w3rtE4ahlZSGGi/O1CMgy6kuKIl7dISxiaZvfriSLtmJnT2xTOTaz9UBUQ3L95eCa80XKILREr
	MX5R5gtmmCI2r5L98gctvn4hmgnmsv8tKYC4bTyKU6JOKKe6P/kJ8Zgmsq+fHs/UtcPSuPEs67I
	FnUxsJRRAUHJ9M53NhdXfEcZ9vpWLvQjyNn/kx5/5NZhpcuDxgUWlu95ISPtJ1GN6pngfL7yc=
X-Google-Smtp-Source: AGHT+IEh987VFOInqDaiE4dQokzyddzRnJWtVtXv0/enIYKH97ZJzm5R8OJ0GWVJzZF60mkUQh0k8A==
X-Received: by 2002:a05:600c:4fc9:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-47787071649mr49869865e9.5.1763022355600;
        Thu, 13 Nov 2025 00:25:55 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb34295sm15214435e9.2.2025.11.13.00.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:25:55 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>,
	stable@kernel.org
Subject: [PATCH v2 2/2] ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
Date: Thu, 13 Nov 2025 08:25:47 +0000
Message-ID: <20251113082551.99595-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113082551.99595-1-biju.das.jz@bp.renesas.com>
References: <20251113082551.99595-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The strm->sample_width is not filled during rz_ssi_dai_hw_params(). This
wrong value is used for caching sample_width in struct hw_params_cache.
Fix this issue by replacing 'strm->sample_width'->'params_width(params)'
in rz_ssi_dai_hw_params(). After this drop the variable sample_width
from struct rz_ssi_stream as it is unused.

Cc: stable@kernel.org
Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected Rb tag from Morimoto-san
---
 sound/soc/renesas/rz-ssi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 86a6b4eff210..b5715e7318a4 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 
 /* REGISTER OFFSET */
@@ -87,7 +88,6 @@ struct rz_ssi_stream {
 	int dma_buffer_pos;	/* The address for the next DMA descriptor */
 	int completed_dma_buf_pos; /* The address of the last completed DMA descriptor. */
 	int period_counter;	/* for keeping track of periods transferred */
-	int sample_width;
 	int buffer_pos;		/* current frame position in the buffer */
 	int running;		/* 0=stopped, 1=running */
 
@@ -217,10 +217,7 @@ static inline bool rz_ssi_is_stream_running(struct rz_ssi_stream *strm)
 static void rz_ssi_stream_init(struct rz_ssi_stream *strm,
 			       struct snd_pcm_substream *substream)
 {
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
 	rz_ssi_set_substream(strm, substream);
-	strm->sample_width = samples_to_bytes(runtime, 1);
 	strm->dma_buffer_pos = 0;
 	strm->completed_dma_buf_pos = 0;
 	strm->period_counter = 0;
@@ -980,9 +977,9 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
-	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
 	unsigned int sample_bits = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min;
+	unsigned int sample_width = params_width(params);
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	int ret;
@@ -1001,16 +998,14 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 
 	if (rz_ssi_is_stream_running(&ssi->playback) ||
 	    rz_ssi_is_stream_running(&ssi->capture)) {
-		if (rz_ssi_is_valid_hw_params(ssi, rate, channels,
-					      strm->sample_width, sample_bits))
+		if (rz_ssi_is_valid_hw_params(ssi, rate, channels, sample_width, sample_bits))
 			return 0;
 
 		dev_err(ssi->dev, "Full duplex needs same HW params\n");
 		return -EINVAL;
 	}
 
-	rz_ssi_cache_hw_params(ssi, rate, channels, strm->sample_width,
-			       sample_bits);
+	rz_ssi_cache_hw_params(ssi, rate, channels, sample_width, sample_bits);
 
 	ret = rz_ssi_swreset(ssi);
 	if (ret)
-- 
2.43.0

