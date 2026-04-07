Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213B3BADB8
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568957; cv=none; b=MJ2pF8R/Z8UudpkGNE82WP9NjPAa0gqF59bq5jzzTynMdFOXyLdK1PZvi7EyaTB9kSu0/phcDwAI3GC3nhoAY8JLy5aKWFPBObG+eBkI1hkA/EAi+t0wJA/Orgm78MLDR8hqpYI9RarmMnUz6fvP2Q0HHdkT75IKPSVuuxO/htQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568957; c=relaxed/simple;
	bh=rBbNuLetMHuecYYiQdVKCfgcTJZ2MFfS+stiyk79XS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZ7vbRG7oaDSOd7DWNeqC57s6MWooH3Xk87w5dC0+0CXQA6U0I1v+/4XNSswQNzoEJrSE4rrJKeV0++lNmiARLfrhQ+Cd30NVOp1SWA+ZWERv7W0lm/WMqzK91b8zu9PM1O1L3p8dFU8O8DAkby9kq9yfAlR49FQqTDx3GeuN9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Y7tsGpto; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Y7tsGpto"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so12132735e9.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775568950; x=1776173750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR9Osv3U5Kocq80qg3AQf1FnSrs0NQ0fc/wysBCHSXo=;
        b=Y7tsGptozEVoAmu0qgh+eXPwv99E9E41+7bEAA+4av8gexervSBx9zOOKJfJysdmwQ
         7yIiIG18n7BVaV4S7FAIFj4C6AFmyuEKaRdO6eBbYtL7oWRVsszH/d5QOmp79ue3aKoA
         LT1S7jkSV+GSxyDddKXxZwUrig2HnbfVCMT279g+mmxPriJuydAQrqcYYF6M7SKr2frN
         WBhJp9a5TVivAuzQoqC3wz/fWoq7yFHM+gpoE9U4sL8nFKLokTsWnGX7EEF+ECVrOZCN
         EyoCqbygs1VPVpaJ+Ir8T9f4Nm+EprJgZoUc4LxWK9e70p7e9xG5aqMKy1YBTL1CUjYi
         QY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568950; x=1776173750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tR9Osv3U5Kocq80qg3AQf1FnSrs0NQ0fc/wysBCHSXo=;
        b=DSR+PTDcF+g5G1k58MlhaEwh2/kVxWJVzVOjQjfVB1IwxcbOzCylS5ReMYk52rP3Nd
         e3IaK0GgIggmKh9uxkxkmioTy3JhJGFDGMxrhXLDzIIQNQn5nTFdZn15Q7PnLaIvg1Hz
         b8UERmi84+etBDZQyWuWOaRtrauyoZ5gWmWqGXpd+EMCS0BtLnuxNI+JnL+OuYnt6wlr
         ptL3XV1iLgxpxTzu8OSuMczSYY08yWrOlifpVMH6XsprE++sZ7IqUgYXBqReY1ri6nCK
         nHYjdxRvJCqEUn6M+mL9a73zy5/vbvZbxEGQ4OvVcnD5swDTQJ7RksomXjJfxyeIt/jQ
         +Dfg==
X-Forwarded-Encrypted: i=1; AJvYcCWjn2VeyPYXPgsurPTQLqF6kSFQLSruiCVz1zMhmdBzEL3Mx4k3R+IW3DfT3ax2+s5d9ngph0+/3L7BTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0UTONtvlV2Fn03WovQuR06yLpr/FqHAVTm0k+08lf1qce7wSJ
	cOdtuFv4YFO6rpEE+KernlQ4ugKO1pL/8qv3nO2iwvuYp3/Uo7v2EmruIvh2HxqyOac=
X-Gm-Gg: AeBDietmUKFCd3dbt+R7mUBD5bPipNsmuCFF8p8HkoWOd+BbLYrw/556BH8qvZipKqD
	n6ooG0vLdHFn/i5StxRyZi/O/qHkuKpafDRbhw1vkC+Jf9SEu623Y3fXx6l3vjjtBiYCf/F2Qc+
	/PQd3kuk8Rj0sfdBPr/zMWThKs2r5EE40Te9jHgXpX7+xnoNyFCqZA63GIKBuUorkBEvw3o8IbJ
	OAEpsyQREhjy2N39nuPPLSeSyXoBMbH4vlcYPzTvC9NRjYTyOt8iA/MP1FxsqDwMFfqEIsodWEX
	HVs7S4q/zrgFl/v+ddLAg7G3r4I+qf9nA58FBEHPDyI8d2s6UUvgDJ1WaQHxv5QAFMwBROIiq7T
	Ooazm4e7FzPIDuZZ9dd1Prwx1JK2L0TcWcpGGPkxCl8Q3GyUH1TVld73N5kfCBxUL2XVF2Dj7Tg
	0PxHSdhcwHladCr80Rv+B16tMzdmc07gYAFCb/FPljDAgOXNnFQZ0r
X-Received: by 2002:a05:600c:638e:b0:487:575:5e1 with SMTP id 5b1f17b1804b1-488997adbbcmr239785785e9.24.1775568950101;
        Tue, 07 Apr 2026 06:35:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm285777675e9.10.2026.04.07.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:35:49 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 13/15] ASoC: renesas: rz-ssi: Add pause support
Date: Tue,  7 Apr 2026 16:35:05 +0300
Message-ID: <20260407133507.887404-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add pause support as a preparatory step to switch to PCM dmaengine APIs.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new

 sound/soc/renesas/rz-ssi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 71e434cfe07b..d4e1dded3a9c 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -847,6 +847,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = rz_ssi_trigger_resume(ssi, strm);
 		if (ret)
 			return ret;
@@ -888,6 +889,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		rz_ssi_stop(ssi, strm);
 		break;
 
@@ -1054,7 +1056,8 @@ static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
 				  SNDRV_PCM_INFO_MMAP		|
 				  SNDRV_PCM_INFO_MMAP_VALID	|
-				  SNDRV_PCM_INFO_RESUME,
+				  SNDRV_PCM_INFO_RESUME		|
+				  SNDRV_PCM_INFO_PAUSE,
 	.buffer_bytes_max	= PREALLOC_BUFFER,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
-- 
2.43.0

