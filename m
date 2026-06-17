Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070FD3FB07F
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692759; cv=none; b=Xf3axaN3+FV14r1kRxsE/VFJQ7ZuJGPe1jFdRZ3kKER5Cuhj/hB6MF+0B5QmPaX/WgGwQZTn6rOipQW8QoofBGO6XYZq1Dwba6XR56tj8KaEah1J+DQ26lKQv/tFR5YABfS5b0x8BeTTtHaziFaZOnan7EdTNKtmlexHfpwObhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692759; c=relaxed/simple;
	bh=jWPckIT7yObRKkib/4Fk7XwIGevaSZ223c7tQ+YT1gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFlknz3pjRz6IvJNMIxChi23Ip6VN9yS7ovKTo7VpN4NSL+H6rvucvKpakXDcVgu6CyLzyAghu8T1+yNmdTLsLeKKd/N0Il9aV7q1qHb5qvuU6dGZ9zlhHJ4XsUbKtb/K6l2yj5U1RoL7oAECwEzhsnSshGq3JAnPoELRwCyqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWU82R5o; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWU82R5o"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so152212eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692757; x=1782297557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=SWU82R5okPHD22uboaHD/9kSihbyll9eIf8FqqesycStMR1vuyAyv1A2y65pQnz3qM
         Y0vBFPSHt4CuJus0oKqbjk61bF9EeGhmHNoC8NKqVzWMboKF0glWgWowu3yJuDuSyVQl
         guktXipPF0orS3rxw9mofklDOgV6tcMavgkVDh0Jab3r6SwpShpUN7nc2ZgfoshckEtl
         MCfF1NAiYiGiBa43CHWtTnrFZXTSjrPcOzfAq4It13h1MBq2K7VnoCFy7AcKkziNkVkf
         eKtxhnmrAmiBRytJWYO1Bdv6XWFyc9DvV1O45k3tLIpSKhKARmHAQZVGAVwDsz88FXYH
         zCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692757; x=1782297557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=Vmj1Pg+Mg7RMJXsq42m4Vdn8jQeS/xsAGgfBi9TSnL7+j9zJyct/YVFxut8bywDjUg
         hXwXVwtNlc6ygV/smZrv91nMOMZciIPj0yt0FRty1vPlVlAqogPB/nQMQU8buN0Sdc8J
         0d2oajS6A9Qv1h6IYOHtvjkbisqQk+8LXQoyZCUHELK2pggUnd+n9m4Fb68JyW4hFTBv
         Ffrm4kZFwIRaloeBbgg4revCjQy34mDCwQS0HrzTcd5me86JU12W/PuYBOqsRuBNLQta
         MVYV8sLxG8CiU1GaSUeWTqP8eXIODlRNUFzsCBBXIo9FXhkeYjzrVF12uRcWgupdNPRT
         rXig==
X-Forwarded-Encrypted: i=1; AFNElJ9XokiuKRDM2mYIHTT48YMy7pQRrE2aWjrDURuND30v5tnAiU5/i7XWjqXAo1nJwOvRhpg3J48UQsM0Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy73F77JFxEyBIaM/S4Ux9hMwdFh3mgruieoK80mpGKvMW5j0y
	UOYORRIeg3fniR3KF94Ngq5xTkc4cRWf04Yq7JfJKKyeBZZlse9KPH7b
X-Gm-Gg: AfdE7ck0x0mozMuwXMqOOoyxVOZRrSdrygzpl1UJ4PichBeWfCYGm23eI4BnDGqRNaQ
	L020Hp2OpEoqo/7Jllc1LQTaUN7Yqk3JB0yUSd38ic2ZHrVgAx5+eHDnahMfjG21LUV+uurtbs7
	xhhVa80JZaSH9+rVBK2fwP4hBUB74X8Z1Nn2Ug7zRD3tvTlAHHRSsrjKHwRdbKcR0/EX8otEzqq
	ZGOA4AByGYM1C6nODjquuGetwx8wyV4kJeUrxyMLglSWNDp50nYqVMg/bwecC4RDhFCyqQzj0L5
	+hg1sXVxAM9Skgwfq+6xKYz7dz2n7n9I2mTAAZyUTiB3Z1ZFRW8euoygUU1gQiXwmLp6aZTO6Az
	bDe/pRqmLOYhjxliryiVevAd2KGHIyG9nTvElJtJn/+RbHKlzEc/kG+K1XBU1HHbdenqgqITtSJ
	smnF9yx2d+mNgcfchWhOvUctzqkSKYzppBQmwpMiUsisLdYFM=
X-Received: by 2002:a05:7300:50fa:b0:30b:bf84:18f8 with SMTP id 5a478bee46e88-30bcf08d54emr885755eec.8.1781692757235;
        Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 40/78] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:57 +0700
Message-ID: <20260617103235.449609-41-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/peb2466.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..ddbc5f34b08a 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1704,13 +1704,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
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
@@ -1718,14 +1716,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
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

