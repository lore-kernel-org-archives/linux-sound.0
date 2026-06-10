Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC86E426698
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 21:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126984; cv=none; b=rjtMu3F78J5G5CKyHmU2OLwr/5c1MHHo/LwTPaTpfu5f53OLfHOcxLJwy3fmJPd/4waNW0axRoAC0gAdSpYEb6it4c3Uvyv3vgxC63oVwbnKCzIkzG82hLe5dhsIY8sUf8JMb9JLyvItASsHn5mrkN+XsAUdguO0SNcnIjQxgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126984; c=relaxed/simple;
	bh=1AVgdXapivwMhAZ343GX8lNmX+kCIj8zw6th//wHOqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVg1o92yyG0Spkk2INNWUkN7vC86xSScBCfS5DXzhIKxjRU/k+T5FH85VxX4jL93uFgFmXub1kvYJwS4oAzg1uo7f991C6Fs8hxO1X4QtNI5DPA4y3jEP+UCWaz893yGPkRnYkYC2p2txSFLE68cMTC9mdSXBzIT2ADzefUGK0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hyDIdfDc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hyDIdfDc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b9318997so53541045e9.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126981; x=1781731781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wcd9+cR2Lw/1NK825QM1reyVrOzsO3D1IfFbzXKQDk=;
        b=hyDIdfDcLVvEbW4UrtYk6CZ11cmHpbEPeX8YgemXEXUNm7B5ImejrIhCaRfNrnKA0R
         4/2KZhYIT1IEdsp2l5bhwej9UZ4QBo79ZzBxfgWWDdt2MsTCM9mYF4/0PGJakMZ0+etY
         cmfTF5P2whlmKTwdV9/k+9U44utYkrUUGW1pAiAy1Kfgh9FyAv61DHIpHbH1wHaL8zPI
         Pj/aJMuLBn7dTbwQGHFa4507/Ru1Bqw6PBU3LFvI2CXsFLePOlHzRkEKRULvmk+rqCOK
         Z7nbBioJ2ydQZy/QiRpweHjzQdQnzuju8iUR9OKJkRZGA/qSZmiomO+RAz7uVTKpP00r
         GyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126981; x=1781731781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wcd9+cR2Lw/1NK825QM1reyVrOzsO3D1IfFbzXKQDk=;
        b=KTSgLtCp67ei4vKjuk44rF3QQaFpU99Z2we+t5rlKm2+picQu0UR+LrqYr8EmlOr52
         OCb42BN06aSZtXwyxZl9P0ttz1ysk6HaX5kHK3RYYsxBD4rtc2rh+823gwtf2X45tlgI
         NEUTn1BT6k1U4PP2NT1L4vWc/QeMB2SG10uTUNML+u2bQMWjlB/g0JI8MU5LOD4EfEEc
         i6S/iUWU0aUxaDtmrUqIumdUAghX8w6889mZm0n3R8ScbA96XyIkWFxgrXzSNAPJVwdz
         jEfHXvGhEPyR1NGEpuUqmLwoVQNwU7melTboOaNvQx6m/n6HqlOoMbe3qnypWEr781U9
         5usA==
X-Forwarded-Encrypted: i=1; AFNElJ+Mbs78MfIranAg5R9Fa47oh4m14h1pMB7lSXX+0m4MWbVjVxSiYNezCjdSun0Pzg23U539x1W5p0krBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo6uj3PXmmUPl9RPRuUGzIz857uQk/l8mgVprndpahQfQyEtJH
	F7I6TYfVhgs3AWJ6aj+upATYmTKEsrKQY4isUpQFydYipmn0jq0mgi4TRPjG4FCqeFU=
X-Gm-Gg: Acq92OH/mJTi3u70kLJaz0/KIVgRGCfu0TQcsjHwmqVWw7n6pM2IkTs7/2xept8jelI
	XiIAqs78XHX1ydxRAA4GKJc8LDtzlN02BWrpS1g2JFYLiYxFjK5bMo4225QjK9XxHW9y8bfIDFP
	dT+AV8A+Uy8aUT1DFV/ojUqEKyQylxbXqqkzB77M96Er9SElOIW6iKMmu4+OCccLPtonLydtFP3
	9B9LWFSlJKrUpjXgQUBtQk7MQnsQKKSIjne6g6eegOsw9ox7MGCqz5LEd040fWY4LCq0b232gWL
	A1y0bbDs7qDSH80eiAWpAJ9yS1h9g4eoF28WhyQYXVa5KSjUQ3JhBQMIKw+9dnFY7clK0yGwyuD
	ZsxOSzYxkMOJxbPeTWtPn5aVbvr15fl/zz+mLECNdDxGQ9J0quMIyEOP4PEdBwoMfdCBI1YZic2
	FICDw4rNDULlJGjldSx4VF2aajehNACoMbmtQ5xVsFBg==
X-Received: by 2002:a05:600c:1f83:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-490c2621a5cmr438401955e9.33.1781126981257;
        Wed, 10 Jun 2026 14:29:41 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 10 Jun 2026 23:29:27 +0200
Subject: [PATCH v2 3/4] ASoC: meson: aiu: introduce I2S output formatter
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-reshape-aiu-as-axg-v2-3-cac3663a8b51@baylibre.com>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=1AVgdXapivwMhAZ343GX8lNmX+kCIj8zw6th//wHOqE=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x1ePSnd+f7CXK14q9JTSbxRaod51PSMRfyvXwktf
 vji6EvfjlIWBjEOBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkxkKG/zF6VifmBpzlkO6s
 8ijzNUq1Tgrem7vTZ5OM5hGJ6LVZjAx/eP/+0Hc0Lo466hPUnpKyXyPg0Nf83a2c1Z+uHf3/+tx
 xfgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Introduce aiu-formatter-i2s, a gx_formatter implementation for the AIU I2S
playback path. This is going to replace data formatting tasks that are
currently being implemented in aiu-encoder-i2s.

This should ideally follow the same design pattern used on the AXG
platform (see axg-tdmout), where basically the widget/formatter corresponds
to a single audio component. This is not possible in the GX platform though
because all the features are currently implemented in the AIU audio
component and changing that would require backward incompatible
device-tree changes.

Therefore aiu-formatter-i2s is kept very simple and
it only implements the bare minimum functionalities to provide I2S
playback formatting. It's not a standalone component though because this
is still belongs to AIU.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Makefile            |   1 +
 sound/soc/meson/aiu-formatter-i2s.c | 104 ++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

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
index 0000000000000000000000000000000000000000..b4604734fe88da2acd6e5c2f9f59e8ecb0a017a5
--- /dev/null
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -0,0 +1,104 @@
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
+	unsigned int desc = 0;
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
+				AIU_I2S_SOURCE_DESC_MODE_32BIT,
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

