Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764E64534B4
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692563; cv=none; b=ZtRCZrMQIL9B27yVgyYqBckdlAqBjbIn3/Em67ZRD2MfnVrQAWvy/JRKsPEKKokR12hVlsb6cT+kdHesoPzvOTR6DuGPta3jlJv+GDbIhdoQXjcVmJDsu+VJc2VKVjFdnTQuFLGCGzDgdx/MjoI0zsBjPIkoHdapWUNGl4PEpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692563; c=relaxed/simple;
	bh=9hWHT0ST4On0+z7FkEqiiZ7FKNgKKOtsAQNxNQQLtbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZX2iU7YRU3YgnFbgJn+oumUU/QYg2dVZyEMnc7xu6pBotmu530auI14/DGukhoN8G0IkK3wvtl/gh3Xfv+nFDhqeZbO4BJrXnmFufEn0eWvlzDNGiY3Vl+VofNkBLboIzWF7cEXqAvEL0+bDN+/DOJ44+hMjjjpX6qOZEk1zcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHUvcRn+; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHUvcRn+"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1195495eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692556; x=1782297356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=;
        b=kHUvcRn+JXibekQY+tk+20XWDpI2dlR0MTTgxygRnvrGYTY8FsQcKzRKk95sD1PZhx
         xW03rjWd2UrH7uzrAvADVpMTSrrM4gBiF5BbRSm35H6Et7g+9+vXpenYR8zi10gR8+jX
         THT5RmV8hFaE4m9t6daFQBFX4VL74I3FQ2tVMVFzx8zVZSLpacXjlbgCFCcNgn3WRWJb
         GC2hHu9/oUKHXkcZlXyIOH4nDEUe2E1zQyAi8hOsnBu2K8u4+wTS8uMWNlFO2zcGc4WF
         2GxtpBoUC0MQ2ZU4f8Q46nptASOF+x7PvT5QuIpjKi335rK4BJ4iqtAA5RFaZiBfuAVH
         jyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692556; x=1782297356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=;
        b=Od/ecujspy089sMYbYkE/wt0ZBnbLWD+5LocILokLRi5ON4+RyxCvzq5QMFu9w+fui
         KUsub+zErBolDAp5JmQuybmxho2vCPPlKBKe8aDlQ0y3iVEa+W1p0jMKgQa95O0itu5Y
         gh/a0TqeVkW4N2DTyKFmOCm3LHtfEaHnn6t1TUD6ibM6HmA4KRP1k9lTeGJO6HPGiB34
         7SVWwaxbQRG+I6lUSAVpd2P+1OVL+TP7vh/1EpTAQikSwaKGKBGDAsywr2FjjKpOioJJ
         7ouaQyGNwb3dNpw/Zol+WUR+qpBCjOd+QXRntg5JqM88GlTbsgwYk2HgJHxMfxtt3M+l
         sUeA==
X-Forwarded-Encrypted: i=1; AFNElJ9mBTj8ZSJbJsCdjsb1PZYd7y4OFD7tq7dNfMpOP5fceCK9Pt2xQ69bIRGWsoLgyW+9usAD0anl4bQO/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUkpFIFDKizWzf0MIgzyidPvn3Sdr10yZtCdj36V38HVxlc0eT
	2J0butwN1FfnzQqA6KUIFMNX2x8h3T3O8u5zItgT8Y3Dq975RnKa30YV
X-Gm-Gg: AfdE7cnuvuG1HXILxjndYvYLrr79Ros3Zm5Ozhhxeb2P3IttKrS/4dHkjU0XzNOXWrX
	cL0/PGef98FpW12m9quf4ssIbPeYKrmvXIGsoP5ZjKI/mF0e9gXtAmpDOCgM69NP7CBLjsyqJ9r
	sYVAWZXJW8eIDgV5VAiDGm4c4Rkb4UiVu9i/5IGDJGnAM8dfYFKIdA+sqPda1b+fZqTYTrYJcVw
	wjrKE7u84UpbSKu3g41FFBHkzYl6aFMsAbwia09zNjmHhJoI6uMTx8mM0GM+mdUBddFU61tcC4V
	0cpZGtpgte/0pE+//JgQyGUc1IWpPg2uolPpVi9lt1KG9ZoilUVEUCIDrpJXxPcHCx7R2p2xrjQ
	W8aLwyZfyR8QLC8kyf9Jg2CbOLcTmYFGPJdk4cFDxXNEm6MiQN/MhwumA+2wLatl98bepFR6ttr
	9Qo3t3BUbDQ5/dEYjNQPEjGO8qH8ElF+6p72kJMMSMbomfJgw=
X-Received: by 2002:a05:7300:80c2:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-30bc9ab54ecmr1861524eec.11.1781692556439;
        Wed, 17 Jun 2026 03:35:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:56 -0700 (PDT)
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
Subject: [PATCH 19/78] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:36 +0700
Message-ID: <20260617103235.449609-20-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l35.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..c22de7356ce7 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1566,9 +1566,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1599,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

