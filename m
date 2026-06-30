Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE122370A
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801404; cv=none; b=rAeSAqhulOEOtu8ixD3/8rPH7fZBkmSuDM93qr5cKqvjlZz3Z39VB+KPTyJOCBAjjr1ZO0dV7yKNW8T207BRMLDfnyfwhLeHmLiZHcFyVXvpSNQkYaBzW88o80TBzbpYzZyxoRDzb/XgRkmV+kUywqQwJ9w8sXignCILuzjLOZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801404; c=relaxed/simple;
	bh=PpZ4kh5MjGhEnrnoDkU1ccKIH7udPBUPKAQWqZafq5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9TNaCeV7NTGnSAn44dipfH+aVcB1NYgaAYWqMMCsfj++y0N/NNCHFcSzSIsPq50iITnpsDnqliD7huxwCXJC3S02QQ4uBclP/Mso5ng2HQ72DEoy8HnK9GxVEjjrqP1cbq9oGb2OpzkmeQT0xwrd2PhI8w3wSMFjlXvMY4c3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3V14lgK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3V14lgK"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9a20f70263so90214a12.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801402; x=1783406202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=s3V14lgK62lwmwxJUZmA76zCjk3xvQs6ZsvkOhJMlbOWAdZgMt5d0auIvn1zdKZZFx
         4pfbYEtUNwQOUE68frusElUbofRYYLZdWF3SSyB9ju1xfbbh8gtua4+3qseRuMbcSlZb
         +r9RmOh/aFdo5qw3TjZqtP4+3NxXcZkV7UGZko1unyDIZDYqjiAXE9yDW1VMUuPFzBo+
         Jir90703c2ifXObOguAVBDlQdXZpdF+kNl+VLqzOikJmz0xridQtt3Z4uFpRtajrfak5
         eDTU8x+weL8ptTFXh7+Vjve6f3FN0LGdrxar4Bm7JwyZQ4wtUwjq3FuMJ7+hmNnoRBpn
         n04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801402; x=1783406202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=rLp9iBlpcQyQhpkT7bPBWZ8mPn6bsuYZedBQBFP0z16hsqY13UpeFK+pOb6q7q3VrD
         h5jFsBXhVYJCSkQQkq8JAGzYd9YQys7faNsGHIl292BbIY+9AcS8apZNM5ngNXccXEQp
         blkJmTkZYMWaZRJYGNyQkTMIqHDksHR0GK24DAkqaFRTgQghun4cJUXDY95gQT4te1jJ
         EICR1maj+zP9tip7JMbwMLnUARX0P+pkWioxsJWJzAOwGSjhPOMkqh83RrpxcjbOq6p1
         W4asEIReA3InljInDpDn28VLwTn8DHdCxRWZmoM9hG3DA+xXlbhgPxhUZa1mW2euWAcs
         OhRg==
X-Forwarded-Encrypted: i=1; AFNElJ+3FJP2bmDky+tlSRqdbXSDTpb6w0MP/Oryjsr2oHSyTA02ffMTaw6+4Djgm6clKtWOJEORYT3Kq48MXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3mawD/7Q0VglfruI8PDN4rl7SJugBQ1nTRRQwexs/31uoEy0k
	XEmxaLyXxuPrP9ceZFWmfvPqA2zy4tkJTMBUSWXF4NMK06qQCV3MQixZ
X-Gm-Gg: AfdE7ck4OKUHpFiqzWtpSv1toeAARnp88F5z1MNLJMx6/Y37bVaRhaSkI9P70mVVCFJ
	hayTVQRSnqttxf/gm266fIkyuGUZH6FndLeVzgOEvNdJttjf7z0GbBpzRjcXyz/AZNGy73RcrcK
	bjPfon25OSYwSeUybtcRFjXdLp1U8SJ151iecbtQ+ZQZVUIusH0JqRFb1ght3hO+vZsBN2y0MWd
	0uZl02zg+/C6ia1HE+0AyGYMmD6Pe9TmPcnBkYZZwniJ9jp775qe9pZ+v+x+FdCaWvdhiYzpF9X
	NYOEfY2tGO5FgQBMDVJl0CKSt5fbx4+lYHGU6+/Gv6MKImtC63Z14i6GNqd9899i3ikDC0Q7mQf
	EuTiUvvaoOwNJpKiaxNOX8StMqPxqCKGkO1x+UpL4iWfe+miYNQNepeFKBoSnhFLNECBEIi2JN1
	68WA3F0TJzHPEglTW5b54T2l7lw7oTle0QiVzKW6ZECRmVaEY=
X-Received: by 2002:a05:6a21:4596:b0:3bf:aa29:1612 with SMTP id adf61e73a8af0-3bfd28b243dmr447077637.28.1782801402645;
        Mon, 29 Jun 2026 23:36:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:42 -0700 (PDT)
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
Subject: [PATCH 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:32 +0700
Message-ID: <20260630063449.503996-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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

