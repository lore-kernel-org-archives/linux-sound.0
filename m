Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD23909B7
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782479; cv=none; b=DjeOaAWdkiQkDeeBnZEVwvpXfu9oe0ZYK/d8PPbK/M6zdijp7WWGWLlHbnJlFDKaO8aSL0kHMNowmY6PY2z4AhtDMP2MMKlFyuu+j2hlilJHJQlDFRo5twKIP/so9Te4udKjwPCW/Q4CYcnRvoOvN2iAqcJY3rIzus5OYJwJVHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782479; c=relaxed/simple;
	bh=CR/lpIz867Ge5SfVg0BgnctkBifwpEVSwmWaNcKvrvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfZUdDvhkFps5lFDhfw2PdpV8QaRV/D/WKhC/2dzt+eqBGfBTXBkqvqyN3a6bEWi3L0OuoOi0+4JuuDfo+YTAj2yT7GYATIPEf0cO3JfhFrbXaFkrtAHTV0OSaH6SHTOpjZQYrWx4H3J61/dz4iH/5XQ9ydTqsHoftyXrmoQo+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw/3XqPF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw/3XqPF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceae1ed204so2209415ad.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 21:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782463; x=1785387263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=Pw/3XqPFoTiFe4SFQBGEiZM3z8neaVT4CZQNKPK07TQpXdwZ8RuQ4+lbh2WLI8Jc1u
         +Qra2i3J3pBNWarngdIHP73tXTe8NGXp/M/WNerL4wG6ZimWvsCmchGooU/wl9zeMn/e
         l2A1VJeLhC/Wxbd35vXj31/IUaUv4jH27GmbBxcw7g1u1mn/PjP18CXvQi1Zx6i1cteh
         WIw0N8A0mwCdcDWjGPqyaXiryPlxK+hXBuPZ3hf03h1nRXIT/yB2jqloeJZllBOLgS/i
         DHE16RhuO+LasnS2FSjY9Df9bAfCGCRDqV8CT1KZW/1+5XwdwpJ5Vw70Ri7J8AfNG5hc
         pC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782463; x=1785387263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=gs38YteJEQemqxIrwXNozELOaSEgC3WAaKwCZbXUzcI2J8WokzwwBTvuduSrHOp18p
         O7k+G5c+0zNoJwLmp3ovBSjStCUCniI8imULYAdUHkfprm/H0Gnku/hXheqatCE+JbTK
         1kaWrPwD3eN4R3no++HicdB6YwF08gv0WDBqFoMilBEX0uNNgXyY8DNNAkgZgsyGF/bS
         LvozqeODOrHVNgF0MO+dtmLqJVr1dbFuuo8QFzwPdGWdYx61DQyAp2ul/05AMBrGoAaD
         tMsOTT8QInBZs6Ao7v9CiOFu9fOLm2El+s71Vi4LgWC2wqYij5ZwAqdNPDWiEnoXER4J
         Hj/g==
X-Forwarded-Encrypted: i=1; AHgh+RqUP5oAipaa+WsxWm9u0HchemzaxuPln3P1Trd8fUFaTWeKQe889/4S0CXmw9o76g2JX69D+3NlGBdyHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwE9AZ53ecZmITGdpd/o6vAa338BULvRKBI1zHQmMb8KJPkD6m
	8vaEeIAAiyp6lDisUs1hLrrZE4hgIATJ0M4ajhdfgzIQoaZdGf4NfhG1
X-Gm-Gg: AR+sD13JFBefVhWvnQ5YLzmxBLEMUxYLzee3KrBm+3C0fwUvuRyWfB6BHp+uwQI+M7E
	jRVQ4UtzzgsVjbgF24M8uCCg1KhUlU9HwTQSr1q0wVB30Xx0o6h5IS7x56Lztth8enrQF98ru0O
	/5nLEYi8ZkLd9fPbvdiifgYijo3Tc8UP8aDMtEs9sXtXh0IaQocpm+6BIcMifdK3yxK1i6Pd8KK
	CwFArdnLpXbdxisgMVxigiQ1PyDNSFKKB8bK/GfWcWj/VMXokTTv97QCP9F22MaT1ROY3OeQrNw
	ORBf2XXhHVG8jCvzLKkIza+z2pxCXoTa3aOD2yXsR4F9/ig6xe6mGTi2k1paTOgXQZ7n8q8BpRW
	Ro/vHc8WTzBAevftV1aAfXebkM3KkYxA4/bEOVuBNHdXxjmxd0uuotpftsxuBJeelbcW7LV9JG8
	MLdxFeYdBIZMek00eE2RGCxUAXlfUoCx9VpqSX
X-Received: by 2002:a17:902:d491:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cfa6b77547mr21765715ad.14.1784782463491;
        Wed, 22 Jul 2026 21:54:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/26] ASoC: codecs: tas2783: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:06 +0700
Message-ID: <20260723045327.28260-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas2783-sdw.c | 60 ++++++++++++++++------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index db58c50e8a83..8ebed797acb5 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -12,6 +12,7 @@
 // Author: Baojun Xu <baojun.xu@ti.com>
 // Author: Kevin Lu <kevin-lu@ti.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/crc32.h>
 #include <linux/efi.h>
@@ -693,12 +694,12 @@ static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 		return 0;
 	}
 
-	mutex_lock(&tas_dev->calib_lock);
-	ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
-					 tas_dev->cali_data.read_sz);
-	if (!ret)
-		tas2783_set_calib_params_to_device(tas_dev, tmp_val);
-	mutex_unlock(&tas_dev->calib_lock);
+	scoped_guard(mutex, &tas_dev->calib_lock) {
+		ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
+						 tas_dev->cali_data.read_sz);
+		if (!ret)
+			tas2783_set_calib_params_to_device(tas_dev, tmp_val);
+	}
 
 	return ret;
 }
@@ -927,22 +928,23 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 		dev_err(tas_dev->dev,
 			"clear latch failed, err=%d", ret);
 
-	mutex_lock(&tas_dev->pde_lock);
-	/*
-	 * Sometimes, there is error returned during power on.
-	 * So added retry logic to ensure power on so that
-	 * port prepare succeeds
-	 */
-	do {
-		ret = regmap_write(tas_dev->regmap,
-				   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-						TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-						TAS2783_SDCA_POW_STATE_ON);
-		if (!ret)
-			break;
-		usleep_range(2000, 2200);
-	} while (retry--);
-	mutex_unlock(&tas_dev->pde_lock);
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		/*
+		 * Sometimes, there is error returned during power on.
+		 * So added retry logic to ensure power on so that
+		 * port prepare succeeds
+		 */
+		do {
+			ret = regmap_write(tas_dev->regmap,
+					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+							TAS2783_SDCA_POW_STATE_ON);
+			if (!ret)
+				break;
+			usleep_range(2000, 2200);
+		} while (retry--);
+	}
+
 	if (ret)
 		return ret;
 
@@ -966,7 +968,6 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	s32 ret;
 	struct snd_soc_component *component = dai->component;
 	struct tas2783_prv *tas_dev =
 		snd_soc_component_get_drvdata(component);
@@ -975,14 +976,11 @@ static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 
 	sdw_stream_remove_slave(tas_dev->sdw_peripheral, sdw_stream);
 
-	mutex_lock(&tas_dev->pde_lock);
-	ret = regmap_write(tas_dev->regmap,
-			   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-					TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-			   TAS2783_SDCA_POW_STATE_OFF);
-	mutex_unlock(&tas_dev->pde_lock);
-
-	return ret;
+	guard(mutex)(&tas_dev->pde_lock);
+	return regmap_write(tas_dev->regmap,
+			    SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+					 TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+			    TAS2783_SDCA_POW_STATE_OFF);
 }
 
 static const struct snd_soc_dai_ops tas_dai_ops = {
-- 
2.43.0

