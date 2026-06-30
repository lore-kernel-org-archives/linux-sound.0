Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D6E3E95BD
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801456; cv=none; b=WFWtBn8x3x4NsPN0VqgN5fDSD5X0igGMcR1CV/ZAjkHVjr2pMHSkwh5WDKSGFC1DQALtCuvxGS4M7o5a7YYLpNzg8BU2DMWKX+ixqLSKZOZSuU2MfXFzZsa0iNucqaEFgHRztBhRSyWmUooOh2m3/wDiqBgZdeIpCyj1gG+e5M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801456; c=relaxed/simple;
	bh=FkzjMsXUtOizyXpAhVhzWGEvYlKPeN0aQ4i9BCrSMH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2j4o6OfLOmhy+iQiG0OU606FwjTh66l3erY/hVgkRnyX74+Dz4YH6apeBMCyBN40jfuJ4XUZvkqFiGrAXQOjKTPGJPoJg3lVw/e7JmcnP75k8ZNlC4C47zZtMs76PvdaTlO9o0nVq2lJB8qdN5VauuA7npW7W0bB1Ak2vavXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTIGDehO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTIGDehO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1895173b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801449; x=1783406249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=;
        b=nTIGDehOdWT42RsuhufmUFnZH87XyvZVq+W8DSnaXMjsWl/qoMthVJfSWCGaoVUqEz
         iTGsA9bymPq16hEzjzOcBMjMMjN5GHAyLX4GW4hetjI8PRNusrnTwxXqEIVY+nvZVrDO
         j+/TRU2HDkxAu04t6xXGzYL/vhiK/gTUN1VJsie65SjD5aPFaxBv1MCNK+xvvVclKVa8
         fuUqydB8y5N7mQ4fdoYDtLTfRCafv23GKkZW0TjTbsHZFZm5/1hQPijdLTixX+fJQM25
         0brm7UXrSWjvYnh/dDKNKD8SnRm878js7yskjVWd9K+dhuTK0qQGgVkxqNHp93vGxyWX
         cuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801449; x=1783406249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=;
        b=GjWXanb6puhFQgtXOZAPMFZ7LbIUOyQgV8ioumT450XNW2fM058p0N8fohTn2LrLhM
         g4iBtPIH3wE8ssLSRw0S0GErOTNJsIXUG1pmGK2RWnp4U6Ss0XvCcX3nJBwS5UBpyfwy
         +aozpALFsI34OGfRk+m5AfX6MslsxxtGOJz4ZXP4IfIIgYy1eTgG6xZSw8kUb0l5rLLu
         5ixw+yrQdG8tH2V4CngdjoCa0ZUz/TsSYBYt42upwgQ0ngg+N/7vt1j1liChDBSzpex5
         mt6kLNkvaY5nLCl+Skhek1zNX24/wUP6ADLyqk0Z6Dr8SAMSk2uOZQgTIdl3UMC0F7vY
         bZbQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1lOKF3C5GnB+yhwohEAz3pyRiqEpN2I3sI2uOnz+Ny6ku81VP1aSMKoSNjwATxq4X+ncfeXV2hAA0Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFhCLlJj61tWbNF5tTlBX+JZ05odW/NnNTnhB8rvEeJcXxxuv1
	fOPk5OoRQok6Zh1NeaA60BuIk+LKpvXikkLda69nZltVG80mqilWVVal
X-Gm-Gg: AfdE7clEwBGEjM2LFDsg3d8e61LXXjkkU86RWC+NMnBwFJrjflaiTl7ErRv9Rv4ozCn
	Pev3FI91qiEsGDlHuxAyJDF01JHeuKP2/Czc+caPUaeGtxsh2aWfsS8EIHSb1ULcta+SMzGrIL+
	3cDOPk1ps7oYdiE0ZarK+5zxwHvmcC6+ixTq3QVCEL9RfKXlRdI3GK+XS9YYVZUtgmNYyz3v+ZS
	TzhADsCNX/No89oZXl9Z2aJL2OgJo58fKjMN0vaHblAtQlQLU0E2HGUocsH0RytIp2Sh9iN8+SV
	mChPdr1bPUg3UdrgwaQh9jYWI7jH/M2iVWZhSV0sKjLDuJ0lDmrXdjULB1ydD6u+Wt0VWDeR8to
	S26gZo91F/YJM+NMr62tAgmN9ldlhvT2WY0h2q2jFzZZOpYnBfmLA0UJWBSEZeUuYKR/t+nZCiQ
	FHRx1ymIr998/bRa5vdmw2zrSG1+mS9ynU6BCuQvREDV1eD8OHKoXU4JAM9w==
X-Received: by 2002:a05:6a00:4b4b:b0:847:8842:8c63 with SMTP id d2e1a72fcca58-8479f2ea745mr1734146b3a.56.1782801449017;
        Mon, 29 Jun 2026 23:37:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:28 -0700 (PDT)
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
Subject: [PATCH 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:38 +0700
Message-ID: <20260630063449.503996-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0

