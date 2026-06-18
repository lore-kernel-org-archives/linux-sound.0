Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46623EBF02
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780935; cv=none; b=RzVck2gBmB7T0JVVrSnHZHWHSy/GSx19q/kxTf8XjwUyPHys2pkYIbpmgdk8M2A26tphzleJTFURSPu1leGeAzE+GiMenZqRe0npZ/gMkQymQFh2ctvQ0B744BdyjkfQDrHMG2NQBgK72H9/O7LoO2xz0eXsNTZSf3fszE+AfaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780935; c=relaxed/simple;
	bh=0yaQq+Grvu3FGJjYsD1MZsTbz1cHiqbNEJ6t3Xr8ZZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/TRFif5+roCMfwjXUBWM7L1coinHRjqi/G91Bl81K1j63PIudsyLdsmCBmuPctgxvnhovQnQs13bHZ2KCuGrxBj0b2bYDMWoUjtPP3+APVdfiLlptm9BAGSo7h8vEE3RH3v8zBw4NKsP7ewjQuCqsxjW/pOR9rvn+2q6z/davQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkXqWORH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkXqWORH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0b9328c4aso5608565ad.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780932; x=1782385732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=;
        b=XkXqWORHCkg1poTDWWkf1Tm2cXZ54ZRDRc0Usl27hIds3xaXKnr3En/96bpYZ77NBR
         +osEnqQqNYlOoe7jHfP9sMqHyaJ1KupEfCEdFZ4qMYCYzNHvp4t23/ZEUbpK0GgDCiSC
         uE9xBWV7f3bnMJ4f814pZjtuBaSnpv5RwMejppDXnOyFDOOHSpDDazzuNVd7yKtYBY5e
         iLGZ1zYX+iU8u5DkgfnLvD5/BAx89BMBi2KM4jKPBq4ndDNwCELUusEkV+wpH84Vm0Qu
         J1DhdHNI8FWQD0XA6yu7IZyUMqUjDydFD0XnmxuzsMkYhbWl3bKHCR1G8xcWWH5l2sZX
         kI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780932; x=1782385732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eeDyrRSgLV/yx9S+U/FOT1rxO1cOlIi+l6TEpJj57t4=;
        b=LvN/mjKADM4kkwdS1juU6d4dqKwsj3ftnfUBeJ32IXWg8yPsrYSV/fAG0nbqfX4clr
         6mPztFn6UhQypKbGCywu5wu9r6WOKzopJl2B6jUpg3m8Bdi+sio0hkSN74JzoHVdkjDc
         VgTUyF+bTpocv5WT4XpWMPtkOLxWGKsiha2pgDIHZO+bgtskZoEX1o4k4kPbAIHlK+Lc
         kNyY/wY/oMsjh16C3TPqKR1oyVhLGJxg7SyQfCRHcAmmhynKT3EK++Aq0dcgshkDNgma
         E/54TioKjOZQ6OhtDB4ygUJvYGNlaCEQNG3rCQTTN+3ZUJ7zRwTF7exyfmASKl1UpD2a
         Zd6A==
X-Forwarded-Encrypted: i=1; AFNElJ8XCW4ueacUAdpO8QE+ulBO2Wq6gTvVODvb/kdFzOWXd58UqloCqDsPdfaacHjcRnx360pcfjfv8H1Yig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1Tdense4jUC1RR3f5KNCs/ZFI/EHqPMWQ4vck06a6GaOCd16
	YoRNNwmZLP2w3E5eoZc9yfSd0nwxWZibaggLYkH3/iwl7MJYJbZgXhoX
X-Gm-Gg: AfdE7ck+vu8qNVyHOBI89zQA9b4W8kclSf7PMTQdHJfb/uF+BAtNkhMigsFK2js/3n7
	Psr8iL9zFbAlUVgKn1aTZ/iUIUqrjlBldMCc/mk85siSYqMNNOKCEmoO+ngAQu4JC3fQcpIsTOI
	+Zzg3OXpXUweZrVPkD28ilX0LsfTPzAMf/n07lLh47fAYpxWzLOV36BdJ6q+jjoTXhs68gCBavh
	O6gqwXcGMIf4aD8eNY5UqPq94d9vpdIBjxQqd8YYxxpsnjYTFXYmsLKULcVBNoGoNUTALCi28cv
	oFAjpqSGgVg2mJzcPhpAbt4XOs6PNZuRYug+JIJ3h3Ab1/M4cldp4bbT5ppfyEe9h5s8M7vlpem
	vh+wQBYnPXg9dBuLLVFPouwcwwRUpCroWa0inZUBWU1oYAneV7Cm0gz7phnBpdwW4J0Viygx0G0
	A2c8zLeu26nHvQq22CSmwGyVc1wRCDXXNetCBmJLojmLpliaZ/P3SvEu8MmA==
X-Received: by 2002:a17:903:2447:b0:2c0:b5c1:8e22 with SMTP id d9443c01a7336-2c6f34218aamr24583345ad.12.1781780932102;
        Thu, 18 Jun 2026 04:08:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:08:51 -0700 (PDT)
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
Subject: [PATCH 57/78] ASoC: codecs: tas5805m: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:06 +0700
Message-ID: <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas5805m.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index bcc8cab8d667..f21670dab0f4 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -230,10 +230,9 @@ static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	ucontrol->value.integer.value[0] = tas5805m->vol[0];
 	ucontrol->value.integer.value[1] = tas5805m->vol[1];
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
@@ -255,7 +254,7 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 	      volume_is_valid(ucontrol->value.integer.value[1])))
 		return -EINVAL;
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	if (tas5805m->vol[0] != ucontrol->value.integer.value[0] ||
 	    tas5805m->vol[1] != ucontrol->value.integer.value[1]) {
 		tas5805m->vol[0] = ucontrol->value.integer.value[0];
@@ -267,7 +266,6 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			tas5805m_refresh(tas5805m);
 		ret = 1;
 	}
-	mutex_unlock(&tas5805m->lock);
 
 	return ret;
 }
@@ -332,7 +330,7 @@ static void do_work(struct work_struct *work)
 
 	dev_dbg(&tas5805m->i2c->dev, "DSP startup\n");
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	/* We mustn't issue any I2C transactions until the I2S
 	 * clock is stable. Furthermore, we must allow a 5ms
 	 * delay after the first set of register writes to
@@ -345,7 +343,6 @@ static void do_work(struct work_struct *work)
 
 	tas5805m->is_powered = true;
 	tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 }
 
 static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
@@ -362,7 +359,7 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 		dev_dbg(component->dev, "DSP shutdown\n");
 		cancel_work_sync(&tas5805m->work);
 
-		mutex_lock(&tas5805m->lock);
+		guard(mutex)(&tas5805m->lock);
 		if (tas5805m->is_powered) {
 			tas5805m->is_powered = false;
 
@@ -379,7 +376,6 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 
 			regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
 		}
-		mutex_unlock(&tas5805m->lock);
 	}
 
 	return 0;
@@ -414,14 +410,13 @@ static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	dev_dbg(component->dev, "set mute=%d (is_powered=%d)\n",
 		mute, tas5805m->is_powered);
 
 	tas5805m->is_muted = mute;
 	if (tas5805m->is_powered)
 		tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
-- 
2.43.0

