Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A60E3F58FB
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692420; cv=none; b=gMb6nW45gmMkxc24CVjJGIOkwqece1nBtEerl5jUNGmHVbVZl5PEPj6SG7T7X+tKvRdeY0dqoB94B4G1xyUXFdIyClQs9ane66Z7Txdn7eLDDpezVltwuGL1Ncxc9QZUi0E8BdQB2RP7pAVXw59h+7qIBZY5SQ/LXDszTxOc5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692420; c=relaxed/simple;
	bh=GZQRr3sPIaME2wNVw97IuSX0NKDx0HvZiZq995LglkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9agdlusRQIlAu0ZqHPaJmIcZdkprUDwCQwbEhSYiEVjr/Ho4VyOobZmKVrpPm3NxUOrRnfn6jiLhRYSKbbiGQhStidYnsj6yuKxLiGtVsLNjSiGgtv7yT+WML0lLl0WiiOc7yqxHBgDxgoamWj5ACQZbcCifL7RiS/g2cbxjjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQgiFhLl; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQgiFhLl"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so149718eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692418; x=1782297218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE860yX5MeluInu/xHweWVTpSgNi/lSdv92MvT4+EVI=;
        b=DQgiFhLlfwWRLv6W96gDK5UMp2lmGEpPYadhe4L7zAKpPKC2hgOro2QQmruwtEXcRW
         MazNbBoPvPSQmCBY3GghdlokBLc5M9HjCQqb/UwQ/4yHkNh0dHfIJHghucux+9FWBbfH
         Cz9eyIh1nRghVb6jhJUri8gTo9r2M5rCl6J1h8Cbdq8I9P7Fd+63vtOS6gS2AYZOQYu+
         SOFoAhy6jlYrK6MWEu8lSRmO8YzmffSkqfdSkpmNpU3OKPwYO9XxUf/hlbS1zWOJnbEO
         zLF7eQbBiyJ2ikQjNnLJ+XrpZvp4sUFJNEXkAszDKV5eXnAfImvWyRsw3yQzzSdBSMKQ
         qXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692418; x=1782297218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yE860yX5MeluInu/xHweWVTpSgNi/lSdv92MvT4+EVI=;
        b=V0w5jpdtdwwFRakk7jSaDdZ+xvdL10ryi22kNFoDpQqROpVn81rjQsh64LuFKiucCB
         PURgzgDhna8Ct5VAi7aIW7uu8YJpO3jdeXfr+8NcpEAwBCxmJyPaQVXDWBcAEOFToG1B
         UA/AOrvYUkl4oJe9PKD0rNR92+d3JBxucUhC1Jt2S5mRzckR86/kWr3XexM+iKLZdp2g
         uBlxRycwRaAwT+g0Jljm61bjZ1siQNFijlQu4HWcZOJGLxahye5QV8ZsUPgCTbPwvXtR
         kayR9HbWMT2MUGYqbwIFczpDePBRGxjAWxWiZyaVAlpRZpXXkKM9T4lo9nTBBET1KpaN
         cICg==
X-Forwarded-Encrypted: i=1; AFNElJ8oe4004LFmgZ2MkZX9SUPoKsH3yi6yTzhCQKCRezi0jtq+ZeTPAOtUfQba6C6kW+iKFUuT/bOvsQj1rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJlsZfBPlVnUnPsihT74+/WOGRqtrydP53L7pEH8Ghuj44pSkL
	IEz4FDKmkRfJFwvPJr3b9lLyaNFYPnR5uk/yOTcD4RmLdxYVAkfuwLTO
X-Gm-Gg: AfdE7cmgrx36S0y+wq5EOWryMzZ5GvzcX/7ugFDD8OO7cYr8VsdAMDA63SOnLWxlXzK
	UEaWS/yRhEPsuK9hS9GA/rg6VA5uzPesdONa1YScLTTq85/FBWC9xXT/jUuIjGYikzN2pGex3SR
	w/SD5S2W5F9+TDzc5c9m2tkQgL4gAAUfeGbYUp7HKW5qx7oIBkW2yb5hZqn3gzU9ZPbMZQh/DmW
	yJ3uGxLhszuzyNtg1Rjx4vDTrc8vlYPABYg+3G2KLBS0FO4odfA/+xbOcJbcvg6D43dmqEsx7ff
	7vo53afP0OWAgzrrBAvuH463aibwYmHRg9JgSIYKUPeyotcaBd9xg4o6fqsrw2GCEXRcplAcPjz
	ApADMhlvMT5G307IXQzvTE/Vg5pYkUpCzUYBMmZIU9RZrajAWB84vJk2Pez+PU3z3gDJ7W8iZbQ
	WJox257Cz1m6gMmhSz0MofpOzOvJMIpOMvE0rqXUjqNH933dI=
X-Received: by 2002:a05:7300:a599:b0:307:286d:c14e with SMTP id 5a478bee46e88-30bcf72520emr1179356eec.17.1781692417477;
        Wed, 17 Jun 2026 03:33:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:37 -0700 (PDT)
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
Subject: [PATCH 04/78] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:21 +0700
Message-ID: <20260617103235.449609-5-phucduc.bui@gmail.com>
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
 sound/soc/codecs/arizona.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..77bd02def9c7 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1158,17 +1158,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	if (!priv->dvfs_cached && !priv->dvfs_reqs) {
 		ret = arizona_dvfs_enable(component);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	priv->dvfs_reqs |= flags;
-err:
-	mutex_unlock(&priv->dvfs_lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_up);
@@ -1179,7 +1178,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1186,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1197,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1220,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1654,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
 		{ 0x80, 0x0 },
 	};
 
-	mutex_lock(&arizona->dac_comp_lock);
-
-	dac_comp[1].def = arizona->dac_comp_coeff;
-	if (rate >= 176400)
-		dac_comp[2].def = arizona->dac_comp_enabled;
-
-	mutex_unlock(&arizona->dac_comp_lock);
+	scoped_guard(mutex, &arizona->dac_comp_lock) {
+		dac_comp[1].def = arizona->dac_comp_coeff;
+		if (rate >= 176400)
+			dac_comp[2].def = arizona->dac_comp_enabled;
+	}
 
 	regmap_multi_reg_write(arizona->regmap,
 			       dac_comp,
-- 
2.43.0

