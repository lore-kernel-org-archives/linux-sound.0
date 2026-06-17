Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2273D8132
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692653; cv=none; b=UzIZdUS75IGdM8hX5nzWs8HpHsLQbTjeG/5VLDWJmJwNYzWKQgvnjLbwefGhD8kFBbWaqsmOve96TZKGVypSQAprtyTZKzmsJ+Wb7oVtQ5lO++NqR7l7iYR+OmfzGh2FjxM8qxPns0UOFaXwCJotKbrPUyHpYOFcvAbryZ8n82c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692653; c=relaxed/simple;
	bh=yMC2x0vx3J0iXo0ls0Nysns2s/4zDPY2og/b5u+3KjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IyLMWPL6Yc01CnIBGzpZWCZ7QsKoVxx6/Hq/w/pTmKJErkMAG8FYQzTelHjAZNri/STRqn6AoTULtwXx4ddfxX23zxOL9g+BMnAXxfyvrRAIXJhb0Z1gCgnrfSj689NbY+2jFgy06l+mYAynuXZoShRk8pwANHw09Wu0cFZdtr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP3JmSrh; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP3JmSrh"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30be4a661aeso104393eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692646; x=1782297446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eMqE3BBUM7YLjw0Y2Au39yLx+nag/ZXvLG1ZHdqVe8=;
        b=aP3JmSrh3ecpivpRdrnwAPRgFheRUhfHgbkx8yagzphLyndwN4e3V04eCFRf8dFq8H
         RPtg4oK/omnE28GTqpz2rwXXlYs1kVa4Y9Uhrdyh5o9rdDhsC4g1AMocK0aNHkpLU3W4
         Io8+dVqP2pMFBQy/0Ms7GNBroCynaAP+0IwoeJpZ9xqKYx0ZfbgJ7/GrqouUdS3q+udh
         dU3gpvtFFuq3LRUIQi6gYtoeqVpJWCCZ+zCekPs8j772Bq/RRlYcPvQao1YvkqZgjfl3
         5lQMXIgK+uxsVL0XsXPUJg7lx5eNzV2frEe6j1BwmR1nja6Y92ueaUjhefTgojW96g7l
         C24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692646; x=1782297446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7eMqE3BBUM7YLjw0Y2Au39yLx+nag/ZXvLG1ZHdqVe8=;
        b=DP3BGekbf32w3WUfDVWU8Y8AUp7hIj+1/0sbK9AAE4/uZJOqPKPbD2KQaIh6qGtwiu
         QLhD2VoqrEIzeCkMaHa3iRZe3IBG/DVQ6l04E5Tn2YmH/gDY2mycTFauQv/0Z9s8OFtu
         HZFhHjycspWcrXEsfBcAkgpiQ7JQEvAqEgyB4umZY9nbe8fADP3N4K9dVrbMXSBDpKrm
         lInbs5H5HlRsm0LG8nCfct4nY+f8c9+3HZJSW/kx9sI4o5I9a3ee1eaA/ScCqoMsKa4n
         s6yGFHg5fkkV3/CNnimfs+3Ny5C75q4dzOLsbMyGL1SpJ2tKldZexHlfVB/TfBtvoPwr
         y/5w==
X-Forwarded-Encrypted: i=1; AFNElJ+MII79+bIyT9fDHD8W8MtWv0AMRUWkS33RAXzQ6CDhmDkGjCeB5Y8uak7WDaFRP5pCuOlXljYRfMVxcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PARI4gD72oezC0ttEetx5aeD4pCKdNdF+OyatGf81bk0Lk80
	eKhsZAV3MKxTvNZYwGVg2nZ2DdpBNqQPJ+z7tmy/vvsACGmTGpI+YWZi
X-Gm-Gg: AfdE7cl7WNX3l2hjkYhXeFoZo82J3iPkEUz1DbXy7aCOu1aoGWi3USeiCCsiavSFeDo
	p0u4PPSnQzHWH7J+ipLdoSR4OHJzgn6oy5p/0txZOeh7iaBnidUYansri2UQUsr/nrWtf4rn7a/
	uqmJjIEjlSMrXE8+AEbVlGdWDUQ8x2dW86PuyF1yPQOH66OKNkLSG2ufVGTYZrcs1oHEhI6aMKF
	9Ncrf65RT0BO/wW1CB1qTnTpHYqejEWziC6I5F98/FG13uMLmW8PjXzoRXLIkgVdCB4zpzBxt+g
	bNVVckGde/84KegY4IDarbObkyYV4c+hFLzcrOmH/woclOOLj0XDHiXVF6z9hl6XYtkbXNwzj46
	RvrVUe3DZuCGujksCHhn/f6NPMlGxWaPV4ma4UVuP+iiFwylPJq9rt0Hkzl8J5hpJycpNssgmt9
	3YOm5swZg7U1oXFbJyz4JArbmabSGu8GFTqDeg7jH+TY2HAoQ=
X-Received: by 2002:a05:7300:5b95:b0:304:ed85:5f43 with SMTP id 5a478bee46e88-30bca068312mr1553091eec.24.1781692646184;
        Wed, 17 Jun 2026 03:37:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:25 -0700 (PDT)
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
Subject: [PATCH 29/78] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:46 +0700
Message-ID: <20260617103235.449609-30-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es9356.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 670e918b56a4..1915cce09809 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -501,16 +501,16 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				ps?ps3:ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
+		} else
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -929,7 +929,7 @@ static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
 	int count = 0, retry = 3;
 	int ret, stat, reg;
 
-	mutex_lock(&es9356->disable_irq_lock);
+	guard(mutex)(&es9356->disable_irq_lock);
 
 	ret = sdw_read_no_pm(es9356->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -982,11 +982,9 @@ static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&es9356->interrupt_handle_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&es9356->disable_irq_lock);
 	return 0;
 
 io_error:
-	mutex_unlock(&es9356->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -1092,9 +1090,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0

