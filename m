Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6068343D8A
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467430; cv=none; b=ahav0inL+Z3gFXUPQxgZyEKSXyvwWJxCjO3BkcUBJLKa97lN82Tf75E9BW4qHfaIFaggLF8t5vrjvrPF0TW0nJvsQQweUaBmpPpZyDYfnDxAdxSu0XP/R5iBRrNeLz1q7EAmdpFS056otIntc1kujsuAldtbDJumvAtZaCThA1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467430; c=relaxed/simple;
	bh=CR/lpIz867Ge5SfVg0BgnctkBifwpEVSwmWaNcKvrvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4yY+f3tPR316ftujtvqa4WWoiBJnT9TTwR0ELpDl4pimFDUgBX3Rh52R46oG5W8tarLf7HrLyE1EOpzK029mWQ8pF/+WW9LbBu4W54X1wVEqrR+9sbGE37WzALYmWcwQOVHv0PJwmo7210gWmoarrqOiowdlUIRxknekF8SWuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkMRRr+H; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkMRRr+H"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso3858065ad.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 20:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467429; x=1786072229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=JkMRRr+HkOHhtlHm2G6Y9zXsRrCuan8og8GGeAe3DcSkpyAGxlVoPcvCEU1yTG9ON6
         ex7UoUDAtuw9LNgf8qt19qNl3HKo8TG5RLtj2IpbwkDanSWaiTZrdHnExPRXb+9z3aoj
         BZTItvA6pgza134/IJIHYl5k6q8UOSpNXwGPzzIgTkkWBa1QYSV8kdsHA5Ku6944iFpy
         wzl6onn5QAfSBAJVzvOmUPBZ1wkOTtHE7g9w4I1BxXjfiFHJWljdcnBz63E+U2KrSynl
         w00vxeJ9A/3ocAn9iIpULw0E8KuuxNMDX/T08N8HpXyD4v5liqtyI7z1iceNnwrODQyK
         P89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467429; x=1786072229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=odCl03iV1REi7t2CEO1K2rhnkw3TVV7yOfHPv3/cZEdnZKl1US4Pi5BVzhUs4v0oIj
         veBNSElv+ZP1l8v+v6O8Z9MIFp32greemnJ6lAh08i/HSI/5WbNwyV8DYCwlMlJDP2Dn
         tY/jyUImEobBv6xYFxObZxUTbEUhBYVRJA5fDabNhe/PhUG+NzAJazH5VJw9KjHF+azx
         EfbjgTRSPHXSDiKJO/EWf5TsSYU/y4ZTFfTVgjYtNlbtLFIz1teEVhGaznO+WKmSZ0Gl
         Wqz1YNn+zK4pk6AjlgufrAUAREiJVTXOoF4Tz+AWiyfpCS4aOtpfd1sG4B3/rO0+ls8N
         BbgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXpi1c0+UbVPJfts1pZPrbIXYmNZo9C1UhrH2a/7tEINDl3kHaAfDYMrX+xJEFrJDY8Jo8rF25DEuHlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1k/HBmX0Jynzfo+8Imo1bZhr/ngYhoMgIGOsNdzQPQVxTRCu
	ewtAXdwpP+2CAJRP6jgpdFaHjN0pElsSObiS3YGIVdcL1osj4ogY87oJ
X-Gm-Gg: AR+sD11a+V7MM1XsQDK9oAT+cyVPejJG84SQcPQOKeIMHxQ0sCTVrP2qIbBSWSlY52l
	QG5SqGWsbOrC3fv4c6HZXrBTahxOoDvmAFWnU2PtdGC/QbiPUVxPHn5hZ50jDbNQUnKcnWsguxO
	DNywmOV9Bm0zX8mhBoRbtV9wlBjZZ++TaxYJDRPJiG0ABdMDRSxTMLj5gSIIIR4GMZ00DUWiJxZ
	skajdMwnNE3fClalC0GA3+FCBjufdL7kJeOP1ViETtp9jVeYhM0u1dUWzQGVsNf7voleIEn01qC
	8hfdMqY/0TrF3wKR3Ba6dyTMNkb8zX112dgVCevw37DhUHHYS4OBhX1w5hhum0EALd6HDCoBFY3
	qe8XbfcdRkWUsc+Y0M9VDmVY4SPS+QqLqfyPQH4+UD2YaSYWD79bbcF2kpT63rlFMsCFDAhd4TZ
	coVeTlRqN0hRygbUv6twRH4z3a6KdOAwwzkMIy4MZErAlf93u8I5/HTSqAEFsZ2bmfy5bl0TLUJ
	ApOeQfF4YjdvD+oqxORG6m+qL8v0IQKXblFKDuq5H173g1ifTcCTnjTuwpxKaBMc/iSk+AhEGJR
	xpBZ
X-Received: by 2002:a17:903:4b03:b0:2cf:7ea3:7cf1 with SMTP id d9443c01a7336-2d047d1e554mr2198265ad.5.1785467428981;
        Thu, 30 Jul 2026 20:10:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 05/26] ASoC: codecs: tas2783: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:27 +0700
Message-ID: <20260731030648.8706-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

