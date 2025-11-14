Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AE2F5A30
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 07:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105837; cv=none; b=JGdZ2vtRXfFHo9VK94gb9M8GnzIYlFds/yWo+1PoUnT/RY6qz/QZv6qwOIbFRsBNosHOwrypVUVQZDc5z8AlZBKxjKHYoGp47KW2/4vWQsG7Tn0ZKFPWRe92b9RR5qu6wowlaPWO/EDsqlMd2AgcG3xvN5DW3N24wxJwHUUTe8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105837; c=relaxed/simple;
	bh=lkh4hyq/8FMrrYfCa0/mOr7Eugc0cJPJFFjws+uija4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jT+8Pje8lEuqMEUfmBuc5gUt/GCpE9T3RT4Px+pd/9T/Zor1vApi6T/LAh8bCl78CJ7KnV7g7fS0TWqiGlMM8VF+rvyUIhtcuIoXCEmhfutSwDurAFEaGppCVWAkx6TNqfZHfQNLIr3Qjp3mlVC1/qpErNy+g77ndxbOSeDIsnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rn2iX/lM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn2iX/lM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4711810948aso11010905e9.2
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 23:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763105834; x=1763710634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoTzx6hqmV9hM+FsySQPQ7RiL9yBYXtI+clOM6FTZNo=;
        b=Rn2iX/lMjD7MZyksqzkMLtATEBWoQTh+SXDkAzrUOusBMy+pVYb2cqXE2kQ0zSoAcp
         dcLO4xmr3fHokyNSpGUav48xpce7xsdZyR9JBEaUSf+RHK9QtS+C8bQ1bD3S0undjOSM
         Jc084tvb61u45Wx2P/+DmacvhEvzmZDUYUWy9VRZd140pyxshi8nLrVAkicB7F+SQeZ2
         Xslwu2XjNFIe+52dRVF05Lz61DchKNMs4yPt5j4tdjXtSwEGdmuBZIe35cGmV0HCA7Z/
         S+rEzUPmL4l7NSq6hwa1PDKRrnWC6yjjwMyji8YJhEQU/Gy9y+R+9Ggh6xhlBEeWhs8M
         Z4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763105834; x=1763710634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eoTzx6hqmV9hM+FsySQPQ7RiL9yBYXtI+clOM6FTZNo=;
        b=q2VzZXx4eI9zMOgVWcuSx9GlcCN4MR5/Iop2ddCPELfMmFKq5iFg57g7u6HqN0tyr8
         36aFnB1lBkvY42/uVE9Df8Sux6GhJwGeuzI+TYl9c4BIJnNOvvfgYY12DF8qcJ3NNSud
         u9ScPZLTn4WuklflvYhS5LHSnSzGRNSyq1v8im+emC9yF0qtzAlzJNq34WQ/IsIoqF7c
         1kmsYxQcaYhpiXua0K20Vp5YDibhXwGdJajhs3MSTLPul4kW64nTzRMG4ZhoiqHYbKPH
         aEJyDHz3+WO7qAkQqWrHdREbdjh0r7TbOBZgQiSr+hK/XOeej8qFZLnkkrYHu0fMfHU9
         pWeg==
X-Gm-Message-State: AOJu0Yzm84os2qsIEFAWugFKfIzQ4ljfYxfM6d37nTRlQX6EHyw2JSnn
	ROS1i9xqKPodZBmrfCOtueDO8j0PR7Q5VJJtU9/vgDEyXz1Tuf4cG4jH
X-Gm-Gg: ASbGncvNpbUFUsqnz1cthzVXK2xDSW6id80woqi2bK3M2rUSVKlyzETzZLWYihwABiF
	whGYgl5vzvyrWVPDfKWFdG/L0CS9FC4hz3SbyM/tGs5qtGtUly1FEFxoyBEJckjZAHjz2dKBwFw
	10uFsBS2nPHLVVqpbAvR4Y9LGKowpdLPv30tYWd9t3PLfyMlxtneQ4sUt0P6EH93HgjGIKfXzf/
	9XpTEsebV3JNIPsNSd9GooHPihHuBhtB59zzbDvtTarNrWAvPDJzu366Z/3G7nSezQLBzv0pIj5
	QfyBM16pl6LJmnUXFQxeZnzitOUJfxOvu9uN2AdCxXpreXhAr3QRzvcGzBV/2xIE4qotZoJ9nxm
	SmtP+PpOqaCdYUGyP/acv9TxLSglrRYqIcm45w59q9MBf5tOvF3JT91Ne+PAjfg2XwLeQV8I+/M
	Si78+gWzhD+g7wuhq7bwc8zMf0cG6Zu4IBZws4ongvQkRE70loZqpofTF+y2coGrp4LMx1Dy8pH
	h4HVfutyYDjXRjd
X-Google-Smtp-Source: AGHT+IG0OwVJlx9IxqhBCdb6uEYZrrRjxlVOfg439Ybhkpn3/YZFYPYFf7yTJOzlY42p7jR2av0jbQ==
X-Received: by 2002:a05:600c:8b38:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-4778fea2de7mr14660925e9.24.1763105833870;
        Thu, 13 Nov 2025 23:37:13 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm95071825e9.11.2025.11.13.23.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:37:13 -0800 (PST)
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
Subject: [PATCH v3 2/2] ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
Date: Fri, 14 Nov 2025 07:37:06 +0000
Message-ID: <20251114073709.4376-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114073709.4376-1-biju.das.jz@bp.renesas.com>
References: <20251114073709.4376-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * No change
v1->v2:
 * Collected Rb tag from Morimoto-san
---
 sound/soc/renesas/rz-ssi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 62d3222c510f..f4dc2f68dead 100644
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
@@ -978,9 +975,9 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
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
@@ -999,16 +996,14 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 
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

