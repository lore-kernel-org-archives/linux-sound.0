Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5113C48A2D3
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520474; cv=none; b=ltEKAmjZLJkRAeCmGs/8GsMMn/QxNzvSPxvNsHJ/0yUXQHGvf0gVLa9DEJw5sr+UUdlQkuQuefUE4vO3bpyACaxGF78rQvZppy+15e4edHUp7fE16mZUNcui7OP3YkGojq54desROYQIJ6gwcJApVdlILTxljI9G0GDsFOfGS24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520474; c=relaxed/simple;
	bh=AI47RSj0Y1j+vIuhRVu3twL/jah5jy/cblTwRVB7e0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbOnYMwb1ZfACYcfiEOvSsqhDTwoaMwSDrUvvlWyQiOakrWwyA1leiGd2eAIpPiOWNZ2QYCKgD7PtKApsr61sLq8dj317TTSccQrmWfIRQNV0GA2vjKhfvQx7ZQFdjW+0lNKFTziTyVd24H79uV4fwcyG1vNcf35XmARcvv1w18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIhgxvM/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIhgxvM/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so7501355ad.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520473; x=1784125273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=;
        b=NIhgxvM/QbS9X0MwELs/DEcKKZTwG2XP1cHJ0Cpq6kGramDsaoXALLC22G4ct8xscF
         7Xav/OAqZ8k5ZLoKQfZw1fRnqeejEZr1nqDnzj168fmb1YP8Fgt80S41vMc0ntOfYRXV
         /A+TKag1a3uZwlRh8SzvqZWug1WCTR8SBWhTsiG6mDR7zbFikyGzOdL2XmP0w9W+Ccut
         4jm1ya09jrOJA/EfVhli9VNCeMMbPk6k41vRxgv6q8+6TKH2+1gObwIT+Ob14Zt1aTo5
         yAuDnf51QV6FXOZBtJ8/VttwevJozgCNmRiwPjb3zegFg5Hd7zOGRvFwrD836c6Y82es
         0ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520473; x=1784125273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=;
        b=Hpe3R9PiEeeOIC1yduIFAM1XIS/VHeiZZPkN2Ej95zcV/aynNKzmqafiGxN05qdSIC
         shO6BJ4QxFUelQHSMYhMooUeFDoiD6TaGghUlVWYzTof+xk5hPzV2pihzMyPzAyd57gY
         TJx9EWNtCEE4I2aPGXzK2Bx4reWVekBsPy1XM/qwG+rQP7xjKxuMtvXUGpiRRbb3Pdye
         qZtL4KMJSmTdt1v80EtSgSdZUe+mpVMKE7Zs5vvZh5phubSc0v2rcnLS73nP+VmfOaPf
         DccGDFufRXNeVxC5FvcyZVo7toN5LUwC+EeA41aBreGhutGdxUNukNShf+Rrw4VcQKc5
         EQ/A==
X-Forwarded-Encrypted: i=1; AHgh+RriG6K0bzrnuQdr+B+s4M7PA+lH4N9rv+Ob04sxnOv9jW36FCKzQzTRgZigXnN2KWSFtrVY1UqZrevNfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDsU09O5STcCTx/JDSyCFcUNAhr+1/xlgHilGmlKotZjRUmAJ
	R7SpxkKqqnQaAzXs9as4tHE/sjE0AymtlcxYgRWfleYyWB24kH0xjBUI
X-Gm-Gg: AfdE7ckB5UQNVAFMEmezbRw6B6FjjZQ/1YLPJU373IFine+dmuj89ua8PXrlGkuWiyN
	GfEbZqz7FpuZGbcKblLFJJn3AkaUDllxHJYIl9ZTDLkZxeXaUrdqbXbpSpUQaf4+yYXmMa4DOcf
	F267nUwUscXE+0BNA0JHhRF1O2PwWBSrv977UkDM4D9v5SQn6R7GTP0Yoj8trDaw8VRwS2Kt/Us
	C0tSk8SdkMM3NsGkROpuv422c583QH9xntZs453C8xlt3tqPNMRh6MNOy8M1GfRatTXb/rYF39S
	wGcEtpEZI5inGU/+dVrtaSlSKCuHr8WjIiCDs1v0BpLCmgMqEZVOmf5NbHTp59jE2MwB09iXjsp
	L9zIG3GL7UP06Jdd6QBUQNjhAsENU7uEzHJUIBcj56/y6YAZkUzuI4gHMzkR24xc9lE+vjyTgWF
	fTKdWBJ46AyXNSpwxuv5f0jRp10vbqPgPC68HRbNVA0RnJKdWk9i2deJMKCA==
X-Received: by 2002:a17:903:2307:b0:2ca:6d2a:871 with SMTP id d9443c01a7336-2ccea47c7a5mr27721945ad.37.1783520472703;
        Wed, 08 Jul 2026 07:21:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:12 -0700 (PDT)
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
Subject: [PATCH v2 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:23 +0700
Message-ID: <20260708141734.578926-17-phucduc.bui@gmail.com>
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

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Add Reviewed-by tags from Herve.

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

