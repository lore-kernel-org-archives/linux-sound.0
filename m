Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2C480DE3
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629662; cv=none; b=jhjYFMGsWZNRsNBb8WzicNMYc5HW5zHkQLGSRYDAm4j7JBS344rl/HlyGhCpIajJON2hznfTLi0XtnA3MwmoijmY3RtcEyKMd5Xn+gPUchtZ3m9r/XtLUAaHtm6vr84qRPlrHu0qx0OZNkyL16xoEIv063BDw3C01GE2nVdKJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629662; c=relaxed/simple;
	bh=PpZ4kh5MjGhEnrnoDkU1ccKIH7udPBUPKAQWqZafq5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwvOxwthMyvlWdZafBb8/64bS/GwaIV9a8ttASU9Fu3pAYo/sFW51T+KGUwH8Obxfqw/A3rhxLYqhqlpvwbzEGB599Hr/c4CcyjpAT3+KzDu34wTBfv98DVhcbP9JpigGLZfmG+NtcPpEOA+0FfgCY5R1Hmy/GnmssS2De+L10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3K7RTee; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3K7RTee"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf27856f9cso56695495ad.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629660; x=1785234460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=h3K7RTeehQiSuN933tealbOs0sy5JloiIuQ0mFI0jK6PRxoaJdXNsppyBZgdyZzUJv
         28VJzj8Rii3/dEuOGIvb0iwsVz0FnhTp7aYvBODHLwWhiWILY82jaCBCphd/YP9XG8np
         GbrdMZV0Jz8s07Wv2MgWzjF6rP72Ippt/K3jwGAeTBEc5tlv213LTKwQ3bEbYF7UNfCw
         kOciRJhzVARlzoCVEsm0oO9yKFTtdFc7P++rEVYdb9pYVwU8WMCANtldMzoUo8znRmvL
         IbfEwMzq0VXAk3Zpg59lz0+MALJyMyM/LdbnDVe6VE2/C7E82kb1abQGM9eD8AsVbpmv
         BqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629660; x=1785234460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=cIR33Yfv6nzmSG/nIBx81qV06h+P2OhKHti+Zj0E3iYOhqBbKei/Or6sTbiXciVFhe
         400T95CcIDfokUdaVIMaXFDgk3YCiJS8AMuXogbXVy7lR1wDS5RppH4OADSaLXyuoy3T
         9tBEds2idm64elKo5Job8qQ06eivW0ohBgAByPE2e/3mV1tb7xLCwo+BnfnPShOkRuOU
         nEZPWrX3DLhS4UN7P5ZC25gHPUTot/trIJwFS3yZmWeTzBiLXHd4fxCY/IvYT4ml8Wja
         uVELaZ8dcwmyyb5PJFdpAhBx+G6/4F7CHmoHXo++B48L/yLNS4r6bBakFDupRqXq7P+X
         cfUg==
X-Forwarded-Encrypted: i=1; AHgh+RoOB9EZJ0xGxCJYkDqOgD0bKKaKevh4wbzzZFZZIfBFQ2TA7thMiXiHgcOrFaza1U7QMZ5xcrfTAeM5OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwasIF5DWYRZjUXfTdDCMVjwVBeYrEHwhv2VUeipBaOR2b1Rt4i
	sfFeiI/+KNDOezm0Wvoe0QBo0XGnDlXnGhvJ/HUPst9eO2cEJS4xXwJy
X-Gm-Gg: AR+sD11B2Oq6D6UU5+hmo/IJvkkNT0fGtr8KwXmZSFsCGM1xquYlQKCL6qEs/r5MlVn
	kRyuUxSzIyoEj4UegRIwt9H/V24wqudyLPEMnNjDxRJGCVaqDBeHNMCVP1gGoeQvE4+AudiBqg6
	a9csPWVoMukdlelTmcaboSu9e1pKRvKIglcp7N0KtQ18ARciNfCaM+4f7iwPwrRQISA5ALbiGVS
	2lRnqX+XRHxmcM0NHG2oOs7EjPsQm1PptOXosZAegjzkViAbVYrpb4AQT2K97+b0lFRMq/bPv5X
	9f4DCD3BaI/QS4ibXnzwOgdT37USSECHCE5MfgnJCoGFBtwabTp5ZcHzcrgdgxCBH30aYkheU90
	HQAyijY5sOKLSv+WOco/SAQQB0/npye/cYnEz34RA7mrma0hR0mXdMQLPswP+UbDYWdIUAFvIwz
	q5sMdt2DgrS1UbV9z2evyeAr8QfCfLjz6UR7CN
X-Received: by 2002:a17:902:e5c8:b0:2c9:e261:95ce with SMTP id d9443c01a7336-2cf3494967emr195445995ad.30.1784629660063;
        Tue, 21 Jul 2026 03:27:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:39 -0700 (PDT)
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
Subject: [PATCH v4 10/29] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:41 +0700
Message-ID: <20260721102600.523199-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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

