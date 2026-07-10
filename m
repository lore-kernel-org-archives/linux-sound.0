Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC8377551
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659992; cv=none; b=PDfC0bbB37ZmVT/bb5JTd4KrIfIUmWvTEBgKyCPZ4RBwgRp3hA7/Xm/diLyP7Eq58SwvJ8BLCn4mChr4hMFV1Om1YSjq/VcogPNDP8H9MbnL1FRC8eOXVVFQdtxFXE+BAM+6hXYBfQUYt8NGXVNxrCkK9nglPtLuSL2qIGZ64zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659992; c=relaxed/simple;
	bh=PpZ4kh5MjGhEnrnoDkU1ccKIH7udPBUPKAQWqZafq5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7eqp/iuvlOepT1A2dE9mCv/3AKxUBONKCSt+nt2BLZBkFA/iB5Enxnem354XOyEaZlX94mw2Wi5iEoXYQyBsOsSiBX8WBlP5bDGMdo+81TcDkig7ZPwIupZEMgW0Iwurcg9mUeuvNiedYGrr26CmQymW1FqCDvqNSFgdfSMbyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Syd+2p9y; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Syd+2p9y"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8487088510aso518571b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 22:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659991; x=1784264791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=Syd+2p9y2w9st5EJNQ+SXa+UNEoB0vAY49+q0PggydBYEuA0j52cq7hyIfn7lJwmsc
         OxrhNhMPuCWp3PiGKs3s1rWVd7TSirOoLB3WvZCUhxuzU0A/2KN+0B7J1cB0fqY+rc9B
         xIZ+43IFGUWPBbtC9TFAilxP2qJcGp6OGP7P1HTrWFMJWlu2T7bOEXk+/9AxnEt4Afzi
         aguFutypQ+vpIiuSkhEoym4FN3cdWp6WEKE/2Ts7bXc4L0+cTlHamPR9Auo6BXSdMUoF
         kQh1LqTr4J/e6+luS7JtC9eidDMMb8dTYjGXpNtn071OX8C8+scNvszz5Hbee23m1yrp
         AfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659991; x=1784264791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=iooqK9Z1bQ4GgJIQf6QukR/BRpg4mt5Fx5R17GtCajeWh31ld9QEYJDyoShvhISC6Y
         3Qj5kBH7wqwqX33St8SQdGaOi4sjHDZGfY4AiAGuAMqNwFG+WB64bgtNcoDQ2x7XlprW
         yy4j5kqaNogGB/9+Zr4M9xKL8AAkvCiaG8jwkLnO50L+LppRh2+FmKId5/ChYyIR94QN
         JENa50l+VIufgsUguKa+aIwT9VPX+L2Lz+vVkFTCLFAXxpxH/iA4YgnQU+9jRgT7/G09
         rLUCeR0zyx3FS1L6evpChX/ycWwF5M6bRoo3/oJ/KlG5pO6lQeDW56liz3kiEz/utwY2
         XcuA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0OlotFuYOyLNWzLxHCPYzgoGsjUGKX7ZurloEK7dn5X9DhH00M2uThZZH+YWuQzaEc7wAvV+rJrlFJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDjuvSw/uITKSByv9l21gMc1eDnwLf6wsv8j16uuld0FMgtrTb
	A62MYPV2e/4VnBVrXL3mBksro9nku3y5ahjA6Hn/7QcCyuU8yCO21jkz
X-Gm-Gg: AfdE7ckQAJ416RdYsbKDqQlOEIvZ9FrDGNe1AyYJ/65E85acu+IqvSSlpMEGLQYxY8X
	NNrqs9sxHsRRkeh6Lb9d5lchC6MSTE4ChslFxukXcOsNFMR8U3PtKuWnHmlfMZEiBVqFGUMLtwB
	qgki7iUQX2ZeUwm0/cAr2jNqp1P4gm1ANCUmS81vii7lFOuGCPoXvx0KAuiPcq1vnit/Eg+NWoN
	n/NvFCq3uyqnXNaWfjhjymTKIrQ2+82O3w9dZIX52a9Ai5k1oaK+F/aUB7Oc+cobGowbrxJtpMV
	m7UE0Ql4xG38vSZrsF+MH1jdR+rSbf+/Di6j4bkHQerp4GpmXFPVECvO7qvpWiSZSEFHsqGso5O
	ieR48w1DzrNRCxLY+kgmEibrxYJHYs8NhnYk/qCLmrTPAj/9AFOJ33g+l5SDBCp4oDZq/z+jac4
	uZ0r8bfhg6YNW2nD2dHjgaKmAyMncZ/5u+CmaRi/KCRll2tPM=
X-Received: by 2002:a05:6a00:3923:b0:848:7b92:8e79 with SMTP id d2e1a72fcca58-8487b929051mr502475b3a.67.1783659990526;
        Thu, 09 Jul 2026 22:06:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:30 -0700 (PDT)
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
Subject: [PATCH v3 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:54 +0700
Message-ID: <20260710050511.14439-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
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

