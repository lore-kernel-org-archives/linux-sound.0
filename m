Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2363F0AB8
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145400; cv=none; b=F6Jjyrk4rJEr1PErSJTl+1EhSG08We/IjeBI/OhN98AtNiKgW65Cx+3vCe7Sv2AUVRS8tIere4bWV4K6zlz0O+flFmAqq9fAc5HFBigVxevfmajU9F8WCM34hlAO739TNqenFVidYLRSnUgiJIMgim/Uu13xyJmJ+PG6HSDKVeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145400; c=relaxed/simple;
	bh=nZGVKfdU4GqxPhxmWCUGDD6Nc/KNfAjP7JAS+KPicHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSX8xVrSSu7IVD6bKJYaeyJHrSU3kRmAIpwU2bsIraLeIJw0Zyf6g4TV0/gtA3SLfeUNXd8F5b1Nzikbdv0LEcwq5Lcjq0ywYbHBCOtEJwRraJuyv43yKlGzovznUT33hFIMXIcIwEYYftQeDypLXW41t14BJQICMrSEvrgph0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NADrJpHI; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NADrJpHI"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84a652535dcso1384515b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145396; x=1785750196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2URIyRhsqdkSXLbHXTDfJ+qkOeAaYtVPXldxW4D65fM=;
        b=NADrJpHIeN9416h3yKSfKB2xM7BaBwjN7Hj648jiWV3qVmO+lFN1TnxxQB1Dv6ftjx
         7mwv7J0+GQRdhArU0mw82scm3mjosu23VRVMrMdENzFVjY2WtMV5klA2OK/5aDRLRUjU
         Q7ZCibgegnv8pzrZXnrnc3kqJIFJz2hXoNrQttFZOS5iLlK01YVtstb4KTPi99KXA32N
         UOBkryxSEtdD2WNC79f+60251eQhS+xqXXn9fHzrsOSSFb4xHfjNJu/G8nERBoCy2yRA
         DyJheUogqODvnSHKiDn9ySdS4q1cpeJ1aSpY36mOSS+8jz6YsXeBHr6KTOS8SpJb5tli
         iTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145396; x=1785750196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2URIyRhsqdkSXLbHXTDfJ+qkOeAaYtVPXldxW4D65fM=;
        b=VNNePRFcu7Ae0bz2n7piyyxYAV3vjsKMUgnzmGTTjc60CxPcC5f0KizzXkrHfqwAdz
         UZ+lqNs9aMFkC2xiqv0rX2fLZm0QqnfcF1p82L3XILTDiB6QzcjTb1efsgpkokJX89P3
         5uQjB1pF47SVIZsKMef7POP+fZWk5iw09iayX+8UMl9n0IykzDpykIHNGy6g4M3vCxrm
         HDTauYVqaHtf6nqkZ05dYTq1iInWpBbgDe2H0lKPQ4g5n8/0rPlRTXHMHQA++Px4arJp
         Wuh+AeOS84wDCDJaqE4/sxChwIWwxl9yIoSdFoHljWI7LqntCgF+MNX26Mkt8u17E6pT
         9jBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRgDhjZMshgboSIP6xJCCX7AeaqZXGiU8R/UkQSPLJRa5cb4TBrNh5qX9t+uI/64aWfkTKj7HxnI96fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvqSgz29lJUzIm0Vp3fIwhUH18v6c2RjW6gA+TIbNgLh6Rij4S
	6uz1KoB7DS3YRLI5+wowcw5mQd5DOhvvsB7Z+eybJyt6FtF5TnxJBWiF
X-Gm-Gg: AR+sD13NsqBJwCL8EMbxIVFDmqVIAJtRZs1HO2TUISwqqjhmpB6/eT5byLJ0wP/7kgY
	LyOTfxURAvL+Rdmj6EOfzfqYbrnpv5Fb12SOyMAqMVBXxGsE+42IaQEfS44iRTZOIKG+/iKK5eG
	b/HIivaWLRbxNAgAgEr4bwcCYOE8ZPr2BQ1DNcvP0n8ILdS0qfVxtI+PLVtjzJnINf5cBUlXeih
	KjMVd05qGPaGLRopCu0YhG50vhkX21p0TAytX65gi+pg89SMVo6ItrPutQZEx1biFJ22I2Cx7UE
	zIv0rqxiGPcX4XEH5xOtce1ctvaGjSV8j7RPHapdqmV21JhC48f9Mcc1FQ9UB9z1CUQYOE40C+d
	h9WEoBSi/gteus7/4RttKuPwNFqNTKo2uwso/CyauMgVrXhq0Is05ERdfJ+M9m8D3bB1A47eezz
	0lHwUz5uTrVSQrb8x3c2HD3FoKSh7u0yVokxI7/JJ4/7H7tIMqgoRYxv+6kQoBk1fM//OA9dEbv
	E/H5tTygSeJczhw99JIT5zMj0bqFYc7
X-Received: by 2002:aa7:888a:0:b0:845:dde9:ab62 with SMTP id d2e1a72fcca58-84e5945d9acmr6134618b3a.19.1785145395610;
        Mon, 27 Jul 2026 02:43:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:15 -0700 (PDT)
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
Subject: [PATCH v2 08/26] ASoC: codecs: tscs42xx: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:28 +0700
Message-ID: <20260727094046.23001-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tscs42xx.c | 61 ++++++++++++-------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index dba581857920..02082ef790b4 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <sound/tlv.h>
 #include <sound/pcm_params.h>
@@ -210,25 +211,21 @@ static int power_up_audio_plls(struct snd_soc_component *component)
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C, mask, val);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL on (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	if (!plls_locked(component)) {
 		dev_err(component->dev, "Failed to lock plls\n");
 		ret = -ENOMSG;
-		goto exit;
+		return ret;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	return ret;
+	return 0;
 }
 
 static int power_down_audio_plls(struct snd_soc_component *component)
@@ -236,28 +233,24 @@ static int power_down_audio_plls(struct snd_soc_component *component)
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL1,
 			RV_PLLCTL1C_PDB_PLL1_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL2,
 			RV_PLLCTL1C_PDB_PLL2_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	return ret;
+	return 0;
 }
 
 static int coeff_ram_get(struct snd_kcontrol *kcontrol,
@@ -269,13 +262,11 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 		(struct coeff_ram_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	memcpy(ucontrol->value.bytes.data,
 		&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE], params->max);
 
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
 	return 0;
 }
 
@@ -290,14 +281,14 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 	unsigned int coeff_cnt = params->max / COEFF_SIZE;
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	tscs42xx->coeff_ram_synced = false;
 
 	memcpy(&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE],
 		ucontrol->value.bytes.data, params->max);
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	if (plls_locked(component)) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram,
@@ -305,18 +296,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		tscs42xx->coeff_ram_synced = true;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
-	return ret;
+	return 0;
 }
 
 /* Input L Capture Route */
@@ -385,21 +370,17 @@ static int dac_event(struct snd_soc_dapm_widget *w,
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	if (!tscs42xx->coeff_ram_synced) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram, 0x00,
 			COEFF_RAM_COEFF_COUNT);
 		if (ret < 0)
-			goto exit;
+			return ret;
 		tscs42xx->coeff_ram_synced = true;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_dapm_widget tscs42xx_dapm_widgets[] = {
@@ -926,12 +907,10 @@ static int setup_sample_rate(struct snd_soc_component *component,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->samplerate = rate;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
@@ -1253,12 +1232,10 @@ static int tscs42xx_set_dai_bclk_ratio(struct snd_soc_dai *codec_dai,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->bclk_ratio = ratio;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
-- 
2.43.0

