Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF4548BD52
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857881; cv=none; b=UpAdoHGziMO9iNSwSpi1ENTTCNJO+dl9vJ5a2iglpmLpomJVX/39stqdlqNOGK4an82qXByEO3aHqZsQvzKCplb+zkGt/s+PvkTShvVuHT5ZlJdT2JYw829vmkEiWHLlFkhUQ5OzxNxojmD6XM40XT8HF3dGaN/mcD0pChfk4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857881; c=relaxed/simple;
	bh=wXLRsbmPRrk2661x1UmBAXkax+7ikv0+c3YhjvlmDR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnuMOV8rNVlR5PJQ3Ygohxacq2zEaEwCbHH5m6xhXNbjTzERcjfKAA8tj1MSLHnlc1+LUlX++z6jbdaAYnS1mF+OrhLhqWoDlScvv4NVTNXf4KfatFWj3tRd4TqYhFruoSDvqM17Y2YaBGFBzgOXaLfMeQw9rYnAGMKR40YBYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=uekvryax; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="uekvryax"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d75312379so711316f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857878; x=1779462678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=;
        b=uekvryaxMsJ15SyGq97ZN+WDgyXMgKTLVPuwSMLJRl//VTFYGqqCv4iZbA7Mh5xryQ
         IHUHHurveZ3ygvFnseIpLvOe7AEUlnaasPWKMT29BCGzgsb3LDxe8jlkURundnwu+jTW
         WxuDFK0doC+1zQ/i7JYo577uGIBZ7jb59iYtjAFiSuW5e/qBrbOWLjveu3zRfFZk0x+r
         hAI2vlSwfh5roKmhB6Y1xvKfdtRG1Ri+bgL99Y0l801ClTTGfJS3xH3sVZU3YYYUc/Xs
         Zbe5WuKFV7Zotm2fL0+v8mWcPj5XTesMxTpeLMTXm+zSKr2kJL9CAHRXu8/ZGXOFDSH7
         FOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857878; x=1779462678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kImEqI0xCMuGmoIKI0CGRRt1bkclZfcyl+UtBK7F4Ss=;
        b=l1boxehiEK8DWNzOBT+0A1e44moKvM+ZscdcRATSwrz4EJPv/0tHFZTqznAQuZ3h25
         3AA+9iWZgK6Q79VzaZnF6kh86TIQU8wmjP8NRPthRsfWVUd+3IE+0va5TGzYtK5kt2St
         jtHmh+CqhQma8vz7eusjbj6k0OWCAsBBZLspRuQ8Lee56QefD7a2BISHxTGBGBR+t3+e
         zCL7F223NH1ReskOANdO9t5kqXHHLDzYp00EIDiUr58pPoe/OaO3HEo2ldXJH9mGrJXv
         pFDwvM8JVfb6yqb+jffxFjP5D7q/SPkeS4LMi54NINHta7U2prWErEcOzmv0aZXuaPUA
         Hc2A==
X-Forwarded-Encrypted: i=1; AFNElJ/8JxzNDzRWJivultQ7YVp7IlZduG0uiDx/8aDBH/PwIxdHnJFqJ1YMKB5H+gvN6RFi1pOYXyWmm9m+RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0CUG/fq3S6RwXP8yqM/cfSYmQmk2w29idaqf2/L2au04Gr/Me
	+E0lWYkMA3Fy5yrupSptMiSS8uG9ImutBK4uEqi74aDk9/fINmi0l77KCfTu85cmFns=
X-Gm-Gg: Acq92OH4kMy5Rde4K7mDbxcWnOlIg74nvi6IxBoMftdtE4O5mdco95vj+dgVrw1uXbG
	WindpIoWHulgXjEiy5nYYbRUnTCvwhHv/SqkOGd0RdBDIzeauFPBx8wsy5Yj2LKDp31saAvTY5x
	wLJfApk1aRiQRhdsM4F39s0FuJhujKdp8Q7Fti0QnLOcgxx210d21UEsZnfd1Ja6QANsRXCbBRj
	iNVUgJaDUzW2CHfvIP9+xZAgu9V0hXRBY7+z90f9FUHz8vC44tVdMMvxOAg77MIia57ADBJ9/LF
	WV/WwuaEPltPB/s0fW1FwJxgQ+bo1w1eA+kotJnz2IndpM+SYIM5M8M8dcRwQkThcs+IsARWFaz
	z5OXm414Ep6h7Pepas3dBzTJQmRrJrPa4fkhq1DIE2ECq1VLL4xdTR8LJp55C1J1SZxpqxeHqIk
	6KrZ59bY1044IHuDHfeH86edO7NPD49p0=
X-Received: by 2002:a05:600c:a41a:b0:48e:6be6:168d with SMTP id 5b1f17b1804b1-48fd6333317mr83104435e9.8.1778857877832;
        Fri, 15 May 2026 08:11:17 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19c2dsm15262062f8f.21.2026.05.15.08.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:11:17 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 15 May 2026 17:10:39 +0200
Subject: [PATCH 3/4] ASoC: meson: aiu: introduce I2S output formatter
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-reshape-aiu-as-axg-v1-3-53b457784ff3@baylibre.com>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=wXLRsbmPRrk2661x1UmBAXkax+7ikv0+c3YhjvlmDR8=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFns5hPy3xhovfLOb3TVEor+UPEoLmeizsMrXCYtob4e6
 vl7llR0lLIwiHEwyIopsrBMv/e7oFTtoXHCyQKYOaxMIEMYuDgFYCKzKxkZ3t/kCix7vmv955Uh
 65Rmz1sTe7T+/qO4uLANpgwSbHcOrmBkeB7h+O7ye+nJPlYCvD/vyCTP4xSazmuz6NSPsqYABYX
 LfAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Introduce aiu-formatter-i2s, a gx_formatter implementation for the AIU I2S
playback path. This is going to replace data formatting tasks that are
currently being implemented in aiu-encoder-i2s.

This should ideally follow the same design pattern used on the AXG
platform (see axg-tdmout), but the problem here is that all playback
features (including data formatting) so far are implemented in the AIU
component. Getting the full AXG design would mean introducing incompatible
device-tree changes. Therefore aiu-formatter-i2s is kept very simple and
it only implements the bare minimum functionalities to provide I2S
playback formatting. It's not a standalone component though because this
is still implemented by AIU.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Makefile            |   1 +
 sound/soc/meson/aiu-formatter-i2s.c | 106 ++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 146ec81526ba091a174a113ce3d8412ddbbfd9dd..f9ec0ebb01f048728b8f85fd8e58fb90df990470 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -5,6 +5,7 @@ snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
 snd-soc-meson-aiu-y += gx-formatter.o
+snd-soc-meson-aiu-y += aiu-formatter-i2s.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
new file mode 100644
index 0000000000000000000000000000000000000000..c7eff04521de3c282f7f79864143e073ff1b2f27
--- /dev/null
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "aiu.h"
+#include "gx-formatter.h"
+
+#define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
+#define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
+#define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
+#define AIU_I2S_SOURCE_DESC_MODE_SPLIT	BIT(11)
+#define AIU_RST_SOFT_I2S_FAST		BIT(0)
+
+#define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
+
+static struct snd_soc_dai *
+aiu_formatter_i2s_get_be(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+	struct snd_soc_dai *be;
+
+	snd_soc_dapm_widget_for_each_sink_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		if (p->sink->id == snd_soc_dapm_dai_in)
+			return (struct snd_soc_dai *)p->sink->priv;
+
+		be = aiu_formatter_i2s_get_be(p->sink);
+		if (be)
+			return be;
+	}
+
+	return NULL;
+}
+
+static struct gx_stream *
+aiu_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dai *be = aiu_formatter_i2s_get_be(w);
+
+	if (!be)
+		return NULL;
+
+	return snd_soc_dai_dma_data_get_playback(be);
+}
+
+static int aiu_formatter_i2s_prepare(struct regmap *map,
+				 const struct gx_formatter_hw *quirks,
+				 struct gx_stream *ts)
+{
+	/* Always operate in split (classic interleaved) mode */
+	unsigned int desc = AIU_I2S_SOURCE_DESC_MODE_SPLIT;
+	unsigned int tmp;
+
+	/* Reset required to update the pipeline */
+	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
+	regmap_read(map, AIU_I2S_SYNC, &tmp);
+
+	switch (ts->physical_width) {
+	case 16: /* Nothing to do */
+		break;
+
+	case 32:
+		desc |= (AIU_I2S_SOURCE_DESC_MODE_24BIT |
+			 AIU_I2S_SOURCE_DESC_MODE_32BIT);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	switch (ts->channels) {
+	case 2: /* Nothing to do */
+		break;
+	case 8:
+		desc |= AIU_I2S_SOURCE_DESC_MODE_8CH;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(map, AIU_I2S_SOURCE_DESC,
+				AIU_I2S_SOURCE_DESC_MODE_8CH |
+				AIU_I2S_SOURCE_DESC_MODE_24BIT |
+				AIU_I2S_SOURCE_DESC_MODE_32BIT |
+				AIU_I2S_SOURCE_DESC_MODE_SPLIT,
+				desc);
+
+	/* Send data MSB first */
+	regmap_update_bits(map, AIU_I2S_DAC_CFG,
+				AIU_I2S_DAC_CFG_MSB_FIRST,
+				AIU_I2S_DAC_CFG_MSB_FIRST);
+
+	return 0;
+}
+
+const struct gx_formatter_ops aiu_formatter_i2s_ops = {
+	.get_stream	= aiu_formatter_i2s_get_stream,
+	.prepare	= aiu_formatter_i2s_prepare,
+};

-- 
2.39.5

