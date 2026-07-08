Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF04A3404
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520426; cv=none; b=gAst0x1WsxXe6QyJNFCCkVzRcs2q3diZM+GLSXlOwHZ0GqRrMdws+QPKnp9RuuKhYdLLHNvJDBIQFYXA/jXIXD2xiRQr8sS8pXj/pFBwJT6rH5xxN+6B9kwTMsSwHLVhva9dpuymgrcLCgy2OPAS4lriSibk08jdFcshJamS50Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520426; c=relaxed/simple;
	bh=PpZ4kh5MjGhEnrnoDkU1ccKIH7udPBUPKAQWqZafq5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQ6jllRVTBrS+RlQk+fXzjaDIEZgcoaPSiFZDqBT0/Yi3dlGP1Ttymj1BYzNoesL8mx8i4o2A+120kfpQfNluV3tPkkY888IV/XLjrWGzekSOPYTsAsXiXEjV/Sj0dqSeJBTXRgeBstkZjFxg83BnlglSHvbaToshdFtbuI7diY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSZUZige; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSZUZige"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacd69a9c0so9505315ad.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520424; x=1784125224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=YSZUZigeMWjnsnCUAD6eRP9lzFmAEwgUxcUYiwzTriqDYy3dcFzaWFbQQz2hTkgoqg
         S3lvC4CxNDg9uWec8/khCz7OkqilnBV1kYeIhQQfR4tli4iKh8qkpiCOvzznQFiWW7Le
         6QEZrGi0rfSXlZp0MgVUN5PwOxUvBpSEw5+rZYBiBZPZjrgs+lGuyByEp9Z6Bd2IXWHM
         6TiaPNO4Fc9u8+t9sT3WslJelyyfYVGFh9Gi4T0EuUqnIqxKWwqjqSe93GdnSprfVeZ3
         9M9f/mKeHwAM1gETrecEjI/sFiG8f6D0Q3UT/t3Ei+9de7+2GPiiadxvcsxJWigR66TN
         dzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520424; x=1784125224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=rDEXj4Qz8U4LFN002g5R0QBWKLa1gWTnjSWnskOVaOXFjv/CxPOoS3Wg3z1T+e09Zl
         q2aF45/bJbqWLn4IXLK0AGqIvNLWi4DwAcyQLIdUxqKkHyf+UOHDEoBCe5K+K9QIgjjH
         VuMxL7Y7ogTxNA4CRY/GZ+IY9WRBakgiSSZJSCYnuGi1zCFZ4pv/kDOATNtGhMqv6oL+
         8qjCo/Evc5EdM/BPCSIxA+XH5wqjkn56nhAFMCLYwu1Ob06qbcA+/yfKooolTRHyapxP
         gSrmumiFW2mYkgMNhL0E6hcLSJZqnHBd7WYQkeVor+oDAWCamg1GJ1QeOoC3kfho0XMj
         7k+w==
X-Forwarded-Encrypted: i=1; AHgh+RrIkCyyFhiXqVV+rZV8oENDPKmzwSPow4bwwAeOecfzT+ByW+4IsUNSG1HLUA6N3ioF46rBO4QSAewo5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS07j2kwDT7qRjIfZ7r8AQlUmKc6mkSy+ziLIKzaJAHYBEqVEt
	dCBGH4rvdogku4VXRXext4NCbIPMzUsjhRJXSKfC2CNPZ22FDC7Z31P5
X-Gm-Gg: AfdE7cmKPXIEMyVSPmCWA27Q+BjmmqTckMjqmukLkwenBo8R9BquXFYU4i6/IIBjZrh
	179Eutwm5Qc8sizdTwzeR7i0FQ+IV/qqu+s9Jkn/Knf/NsepUqMBKQ9QCc5J4m+pmYktYBtgVCo
	GoyPuB939BVi9fUD5mQG8VVlmjnN17DGvPED44kojjyyDm4xWa+rgVVa9UZ7FBZJu8AJJGpmns7
	9WJq2lBLpYQAWeX33hC9w+obDYM+n/vfhzb1XOdXZrsx40XUTobEz7ABMFxpj1XxwKv40XluyP8
	YlaX6oovFm/0rpU6bJmFoBDWK0xv3oc3K4IeiYIiNeH+g6IXJYvyl1OChHLX9FHc7j+CtKtalQR
	PQYmJbvUgD+915u4YgmIN3dMmH0AQl3ESa+WeMq3f2ceCPMUtWu5s6nQT63WZhRqU7aCQE0uvYf
	SqOcLQrptBCvZ0qCMVzwgH73r/e3bbySP2F9ZShZzacnbI4fg=
X-Received: by 2002:a17:903:380e:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2ccea36d9demr28201655ad.17.1783520423848;
        Wed, 08 Jul 2026 07:20:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:17 +0700
Message-ID: <20260708141734.578926-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/lpass-macro-common.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..7e59616ed7bc 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2022, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -71,21 +72,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
 void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
-	mutex_lock(&lpass_codec_mutex);
+	guard(mutex)(&lpass_codec_mutex);
 	lpass_codec_version = version;
-	mutex_unlock(&lpass_codec_mutex);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
 enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	enum lpass_codec_version ver;
+	guard(mutex)(&lpass_codec_mutex);
 
-	mutex_lock(&lpass_codec_mutex);
-	ver = lpass_codec_version;
-	mutex_unlock(&lpass_codec_mutex);
-
-	return ver;
+	return lpass_codec_version;
 }
 EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
 
-- 
2.43.0

