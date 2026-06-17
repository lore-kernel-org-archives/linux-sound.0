Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B5402457
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692457; cv=none; b=Pj0p3+Ygqbe5u/JLh+l/NUySBzbPQswHAoiH1HQbgh3UFeSnmDuSbgmXPZtRneC3s6o+tk5CSam7EGn6RrGr38W8mwGcGfsdL/VqUk+6W5aPe6C+9jNzUF2D5IllbbxI+DeKPTzh3kcsSUw9rx7m68ePeZlkL1kEy5MgBO1ssPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692457; c=relaxed/simple;
	bh=HGOOU6fZkQohzFVizJkVWFZ0SqVU8bTfCS38p9GtywY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeLt03opaPMy2hDI544ImXGsxNONWej7z7fsaHEoZKD3ZRO3kiN9gpJC7OPJoaRgq8YoX0UXkeMGI3yBle+987A3dSF/v6azdVi540LG9lrCcr//7mZ7Tgqv9xX+B0Vtbj1cJcwsLCAcdeRIIg/DiY6j/fqPDgQXkqaapKUVP8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QW4UVyk2; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QW4UVyk2"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bc806fcf8so1066349eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692454; x=1782297254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqNx2vKm7fxQWOh/072hFj9tMPndm73NkR+TwTW9QAs=;
        b=QW4UVyk2bQai2bbB63Rgr7c3IbyXBQv/c2QT97Z31IL6MlaOUiQ9ZZDoW+Z9/RczUV
         xt0vPYNwqLVh546LWASbf7rJoTsgbxsH2fq35fpsB+b6cglq7t3O89ZZlMKy2z+zj/d/
         vluQDdpMK7uB7C7VrsllE4V18tJo3kHFkA6Hms/4Z0Ol4/ytvxj9TMvYqfBXYcO7WbuM
         WKSgVgExMUCU0rfKALPOz4p9DyhzIX+KdIQYzZAUTmajgI1DfhQR4NTLY9tl6pX9aAXZ
         QOboR/Zq2T5bXxaJTA5q04cZh7OU8btFWI24+m99sqnpP8p0YQ+ZyoZs6gSKw7E6VT+L
         5Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692454; x=1782297254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqNx2vKm7fxQWOh/072hFj9tMPndm73NkR+TwTW9QAs=;
        b=Xf2j0aP1Q26lkuoZ3iVan6wMC7mLYhEi49BELAZl3h2MPGCr+hp2FUEhIZCXqDsQep
         MCsmzNr60dKehEMKtE8g251kFW5EaKUn0zmMYTVuf/UETROaSo+1fM3+06H84OW7R4sh
         K2c4Kar3JKFZrq6dRkz6X3dHyD7yRz/RhFmSxPGhYmGM5BqhjFKvt5FBjkm7uaEROCWA
         ndwuMu6mMJJmr6wK24a4yPRVG1elJf39ly6wFEkaINVAbvwBqTBYzYbWDBetaWw1Cf/5
         diNOrszTelF/AlRG/mUzBL4CE860ji3m/Va0ZS65KH9yk8oPVp/hPVFPa53PeXDSemGB
         Vq9g==
X-Forwarded-Encrypted: i=1; AFNElJ+LMwGnXUSiNKldy96oZeBpNs5IR8mEhP9/72WtZFPmDHPkUMCA8ppqw1ODnn0LXmOI3fikIR68tv2RSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxxr/v/EZhmqT0tUa4ZHvwOY7FrLKCSCU8xTbI5aW9qsCwmeHh
	Vsbv2UKx9VZ1drpKbGkdhDuloHyNzYkASdvTPILZ6PvdCqNAGa+Y14tkBLUMtQ==
X-Gm-Gg: AfdE7cm8Fhj/DILG9KSkkdkKp+hqV/9KWB44kvfUB7yBWSXZM23BNZqh0WBbF7p0TEQ
	lUAQtIcwc9bA0zmJgVOJ6CWtjSzENh7J6sG0vRMGy1/oZp5gHOrNotUczzd05qIjLSSCkEB+1Pw
	eCOMaSBcqSf7egBSiU8cN5M3xqAgDu6tHZGevExRwQcmZIvX+KTAFbUAZfCDXp1rZWLFoQraaFc
	OsDu8U0eTq5pPEw+Tk+pDTHiqKDc9RZrqCZ3Q+6F88Wt3yFb8Yi0qoRRb8XyTbX/LMMVqOgS9rA
	B3Up47l8Y+EEFJ5cnMQyYgcVu30dT3BZjJITggWlt/nlLACI7aSyq1g7T0AGBaxtLVG/Z45GDNn
	OT9YNhGbfFESJ2Fx6EvGC5FcYEmYrAp//w5HMhrMhJmBiAuEc9pnO6PoyvL9SH7Vf0fMJy23OVQ
	WPM8wsGrtzHzZ72XEJ/fAkN4EI+kvB9YeZ4gHvE4W7zSLc0hQ=
X-Received: by 2002:a05:693c:3105:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-30bcae074bcmr1680486eec.17.1781692453941;
        Wed, 17 Jun 2026 03:34:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:13 -0700 (PDT)
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
Subject: [PATCH 08/78] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:25 +0700
Message-ID: <20260617103235.449609-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88261.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 549783d3e75e..1bdcbbf5e3b9 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -960,11 +960,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	ret = aw88261_dev_set_profile_index(aw88261->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88261->lock);
 		return 0;
 	}
 
@@ -973,8 +972,6 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		aw88261_start(aw88261);
 	}
 
-	mutex_unlock(&aw88261->lock);
-
 	return 1;
 }
 
@@ -1038,7 +1035,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88261_start(aw88261);
@@ -1049,7 +1046,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88261->lock);
 
 	return 0;
 }
@@ -1188,12 +1184,12 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 		return ret;
 	}
 
-	mutex_lock(&aw88261->lock);
-	/* aw device init */
-	ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
-	if (ret)
-		dev_err(aw88261->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88261->lock);
+	scoped_guard(mutex, &aw88261->lock) {
+		/* aw device init */
+		ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
+		if (ret)
+			dev_err(aw88261->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
-- 
2.43.0

