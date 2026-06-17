Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5009F477E4C
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692617; cv=none; b=SxaGemOLcsmD4RmIDpGYPf7wZ4Os3XY+YeZ9f60u+BLjIzIFL4REBSwDjX1B/0kqseZG+C319Fw5U60Xit1WCitEVfOCEg46E+NzPo3xmFn1Ksr2CI6MtEw/nNbcX9ft5QkyZFLV5kwDc/RQplWcLfMASF6tlYbIRaJHZTo0Isw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692617; c=relaxed/simple;
	bh=qnYG4ITutYzjVJqPrIAZHhjlBjgMFmBj8oHZiQsr4Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIuHh+SobG7UTBeBJTbJYyIwDGkC8iB+0XLl3be4YpdhD/cgl/nBiU8MdnFH+p9f147HjWdZ0SzXD9GBAfg/QD5sCr3y5elnKR3VochzCP2H2B4qDrVzOjmxleTu3fmgQ7kDcdHZwVZytwatedyXR7GYooNG8KMW/nyOIWk45Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhJBHyF0; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhJBHyF0"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so2336647eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692610; x=1782297410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEB/nJ+GbrXBchfLjo1ox4ZcZZOi5T3WM30Mb+CUID8=;
        b=hhJBHyF04U7sqPmEjfJFosImCrEsxDLkeVT+iE88gO5AvaTBBDDFq+3/aInByfA6ex
         haYhJVVCBdCKSSyC48O1KpgJ81VO4dFkhw5VjoE/jUyXKFnqc9TVku4zjybN4FVDzEIl
         KQWdKWs96cj3shM7krBj1BC9PgqgpVnmwjtM79yUc+0RkZ1en/8g3KdnAdC2H2orkpbD
         HP2Y5dDOhXUuexRk23gsAImzpexNQXo0VFWdq6BrIQwQxWMYfnB7BWlcdJDNwSfeSZUQ
         PF5IqaaNTZoybZMN6MOx//I/i897wXjjv54P3NBMGNdW3OXPkHj2Nh4uSTDJFLValTFC
         R4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692610; x=1782297410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEB/nJ+GbrXBchfLjo1ox4ZcZZOi5T3WM30Mb+CUID8=;
        b=eFmczvbM1DVnvogQFjB/vNhrku5RxDiVXSl/s2mKXwOqZLEqG5tQonfE++p4LweQkj
         fSypkhibplDB4k1oeaw3SeGCp/iEHISa0qDCoG7TFZX+aYsVXB9p2MCi//SkJKTbTjmi
         QhcKCYk7epFN1yqKU605at+cNlptfdAqI/71v00tqPXFZ8qYcmKqI3+P8l/VEj2DozBp
         OWlDmakZ9NZnRpvgNY5yQZkq7JhjlqJlguNmcdk1MNeYlk/KlS0n0qOaa93TTUa246K2
         bflsOuGgRH9pGKrWsZG/EeT7NPlcEKDWl43vXlyT73vdAjwOXa6uLFYzyFGOzZXPHDON
         ASPA==
X-Forwarded-Encrypted: i=1; AFNElJ/b6HgYZjco8tfU5bvC7z/DIUL9IO0NXVxvicYNyNk07X3GetVpXBD8SvZ8B76kAUuyx4BRtIyRVktKPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNkgYNcgpq5kVuOFfto0Rg9KPvAQqFk3Lt4jyS1pUWTdmYXlmn
	QJ0nmEHMBPtwyb9wAy/k+VOLe3xmkq/i8Qkhs+LUydGbokQSdlzJfZX2
X-Gm-Gg: AfdE7clIkiO7bMhNoSVBYGjPJh3Z8ahJD7e2X45MsuhzWYunVM9whzYV9eV7dLiOH2I
	L3BCx33hJYDOjl0WVYjuOs7cuw7oQzCMcR67N3V6jWrKETMLafudFHk1mRPGJzFLsjyZkg1lO26
	TCt9B3VY2i8HiZ3wWA5rtLMJvlQFKYbP2lzXHkoSMlqQOQ60d6bcFEc1JU/IBMingzuykzggZVs
	4fWBfgEYPByVzOcVqZ7myDSqQx3VMtyZTFOvhY5SPLdM86AS8eRl4SZZnHYNjNAtDMIZnQJmSaB
	zkfS7rDeI6+wMQw8TvNP05hZkxSDzJPwV6Njw5KxKSocqGEqQjuVoR/ARDFo80hS71pLllf5P4X
	XC2jmafqRTngOgq5P1G7t0FXZfCXF3IpGxRBArTP7HpNP0WRtp6wIOYhgwVWhzYYXksN9ntPSRt
	sgNQj71hyScH2DOG2km+d6uob5MwDrUE1F7lj4YuySUpHo0/0=
X-Received: by 2002:a05:7301:3c0a:b0:307:6e47:f881 with SMTP id 5a478bee46e88-30bc9f3aa8dmr1695525eec.16.1781692610135;
        Wed, 17 Jun 2026 03:36:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:49 -0700 (PDT)
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
Subject: [PATCH 25/78] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:42 +0700
Message-ID: <20260617103235.449609-26-phucduc.bui@gmail.com>
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
 sound/soc/codecs/da7213.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4bf91ab2553a..384c79c7b5c0 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -216,13 +216,10 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -230,13 +227,10 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -244,13 +238,10 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -258,13 +249,10 @@ static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -465,9 +453,8 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7213->ctrl_lock);
+	scoped_guard(mutex, &da7213->ctrl_lock)
+		ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -499,12 +486,11 @@ static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 	ret = regmap_raw_read(da7213->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7213->regmap, reg,
 				&val_new, sizeof(val_new));
-	mutex_unlock(&da7213->ctrl_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.43.0

