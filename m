Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00928480959
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629709; cv=none; b=gbjyXC9wUAvv+Bn1COwOoNQZUAgJ02vBuq1LLIaRpKJvYvFaFkUVmblkNC0rl5Zsh0Nz4vtXW6n94dDN/LQI55Mvg34GwHQL/5mB/IgCT8ktIrBtVH+qZtxHt5vlqpb0AW6LTqbT474q+R2VLpz8jAIgOVmARZ1Pb1TFujS8yF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629709; c=relaxed/simple;
	bh=RgeSX+3zLUlisqOHX9ATQa6nqb4KePBdPHCKtWx23aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcBh5bSXkG/KHs2oHjBqy6kEHaKwKFisaousdipajcuBB/fLSKrLRuPmraaoeBKJs8TaoQoMgko1ts3lqlF5o5d8B7h5jMxZxY7LS1r/rV8M6zaLsUZ/wOCo72PLchg2CK0HL9Pka/TuaYa6DbPWNmBOsTsbYPa4JaewokAYnuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkyqZT36; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkyqZT36"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf52d15d88so27279765ad.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629707; x=1785234507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=qkyqZT36a1GGn7vvJemOTlFr37ZS0X3PfGmoyksHts5lwrTT5JK2WVcs2JO2B/HJaW
         OZymesEscFNrA9ybDh3AINyk8H7y3yF/qhFD9Ktw2zHhG6RpIegeCUtgu45OX2HamIl7
         XAi3UxSqPA4ZegVtr+HGgX4DuvhwzW9SUY7LpuereGqedw24lRrOkuXPiJGawzKryIao
         Xpx0XgSFP30/X/gz65qulCDdzDAne17gttWNSDCfj8FXmHQ+TgWQm4yAA1ty4p63a8xv
         4v8Vh31K8RIGBAL4fe5jR9w+vuVXaGKhjlqBkAqSbGBeSSOdCyqRZA71BJXGp4N6pH7I
         argg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629707; x=1785234507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=Wz8SGrB/ET3DqR2rXuxW1MIKHibu8BhQXjHR+z1Hi7r3FgVRPkmma2xuHWIR9tC5js
         vZ3QwYm1AD+6Ob03nTRpyEsvq1hC2xoiNOQqvP2bxM8zrzyQIenalsT5yMCgdobHv3JY
         iegIO+pzSpglq+0fhwtaPjmYCv8YpOqPhFzsRPYK+quWpq2YHHWLc+QEJO1rWdnyrSWY
         QqqIMtnqRmUnzYIi67UBEHqM6zxbW/MeT9/8fmKyc7Ez3nQL3J2L/QwtMvvC6YaJd9jt
         u7Xv7E1BB5GGKctYWE/W672clEwH1MBoX+T1jZPk6DVBznQW1hkwcy9sunVJEcwEyo/k
         KLFg==
X-Forwarded-Encrypted: i=1; AHgh+RqaUHIEJquFq5KkiWmRUoUbwMiN51Jr8hIKBHH37Wi/3XQZ430WmrQQS7gO2gJGNwqmARB/ZQbyaAlmsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Mjwo8mj5SoYHmkj8nrelP+uwrfdBkj/go/WxHOcKYy6GXptV
	f66KuK7SUj8/VxuybjE5eEQ9RZ6jZCloPjDQ+EATUlfCRMJ6MjwOrKcJ
X-Gm-Gg: AR+sD12ypWkHqm/pNNV1k2/bnZX2acSRoa0E0nOlkP0VMPEyQvVp7wDNmltveIEIsJB
	FbfS2ykEA4FmJKP/Uy3bHByHXNYPOVVDFLew00tfRl+i/HxrXhVGzMXD+fs0EwMKJqXoOgT13Vm
	OquCzqsh00fIgTd25EOAc11/QewSh7PKAE/3ubpR5m9FZjU9ltqTn0D1mT1+tTJ4fv6z3mjWIam
	XmVAVzqWm7/ZuShb7MFN9j+2naG1eDFQiEKf6kPNNz4QR4SOZVJ31epQ43qocsw1ZrKZBUDDSic
	quTg9rEnloITx8T4ArtQaSXm3Ed0rQUjO0K+54YFPzrFsz/11WBWnaZJIUZGG70NVhHKE0zyKPv
	J6tFffwHnuGaqE1lwcIl6QrtuqrcE1Ijuux4jicsPlehpPpEe7t1QWeiZftYwyOJCuymFZCSncR
	EMFaXcm/hkweaRgQltNGBDeZJz4JRdqx4Y0YFz
X-Received: by 2002:a17:903:1b0c:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cf3496bdf7mr187813395ad.25.1784629707513;
        Tue, 21 Jul 2026 03:28:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:27 -0700 (PDT)
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
Subject: [PATCH v4 16/29] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:47 +0700
Message-ID: <20260721102600.523199-17-phucduc.bui@gmail.com>
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

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
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

