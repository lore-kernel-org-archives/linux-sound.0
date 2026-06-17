Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A4D42188B
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692720; cv=none; b=KhTq5Ve1if7HdVSvP8CFPeEPb9oku8uFaw2vCHC7sSg+NENBF5S4IqRgrqAuKp4FOXjA9hrW0d1MEOzwozbmRLNbuOD19Wx6rf/4kmxITGfUEMZn5SOwLYWHJSE+Zc+fwBD9Vdn4E4wuSiwruEulcVbvyRMPvBYovYQj3Tyv0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692720; c=relaxed/simple;
	bh=+Jhubp8Ad5FukANrMioxXXMIcipBw2wUqbSTsnqQwRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwkvIKGEoFnU+94hGxFa4A+P9KA2FzHJM6YYBKDSGgE6/F7ShkvgVMlvMyANW6cWIw6LSmt+MjnTDn/fiLgQR1EPvklEkCvx1/x9GYW2apJbJiEkDk1i3JS2Z3GiiAKUizMniFBecXTAl8ZaS2sVVO/d18zdS5E2iOQoJV/lX60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQyXKaAj; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQyXKaAj"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so151854eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692719; x=1782297519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=;
        b=YQyXKaAjuTIy5FgP+Ww5RO+96Uq5XKKL3nv/qat9gByrvzb3Sy1oXPI0eIUlcpigAi
         smup/TY73rGCyYzA99ZCLLeblNMK4j04FVsydj5OkDzCZC8B6OAvOr9FkTSV7Pj9NVoB
         CZhbMtoUFouROYpZ69HhCCN0rMWisunBPBsO36+NqFFkkfW02NFUEXN6/NVyGAIwnffb
         qiAb9FK6OXYarIQqV1w5qRrcDPjg+4UgAd3cnt5t+D0jefEShE49t7dyxnU/035Z5khZ
         UKJGzFQv+Gcum+PldeIJozLlqvRjJNvHCPdT37CNBye/9fgfBi1R4xirLG87xoGeZgHU
         gBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692719; x=1782297519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=;
        b=mQd/8VLMuFFbmF1Y7aJQNhjTxGTSFFZufNStzGGMKleqO+3L2JBdJEkKy5ChuZ9Pve
         n9O0h3dEoe48sOKAeMMGB7976XjWD+MtkqDMI9Q/30AX1tQKl+vMvlwC41S+5Fxx1h7S
         rDXs8o/BTI8BOZjFD+qpbeJVf7tLSvSWNuCG2SI3+7rmaVLIPtjHrEtwt7SoW6zKiQVi
         3pNX9J8Q5YvEIgwBAr7Gex7THGI02CllxiZ7wgNUGOLuAsLk6nAfxMj7SS7rgn6npqzG
         fVxRbmPBPONze7M3Nb24RV37TerHmIcHr0osBVN3PlDmsQpUGQJ0d/tDEMyScIeCVk/4
         8gag==
X-Forwarded-Encrypted: i=1; AFNElJ9XHa8B1rifKtlcIlsk8sgeQXrxpNYT8XlN3qKtzRdQW8Qu9dlh5jJTglpy8/S82Mlh3lvXr4PcXnVAwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+iLHmEhfkvo0hMf3cJAyO4Na6XTcoWbVAEWD5Ws7PdFOoY/eW
	j4FOteedheDTsXX2R+IL0nZByZdaIAhiJ1EsxrHZ4k760/mPOaEoo1ba
X-Gm-Gg: AfdE7cltcWle00stOV+K26hO2MC832NdrvgBMTH0oS90gprYzcV/FoRcqyLimv+m4Y7
	Q4W/gWq0L/IZta0w6ahrCxhmf/bS8cxo5fIGmTDKjzLJ6hzs46Y0q4mzaSmwGDX8oAv938t907B
	Dbiu4mMCYzfbj9/uz2SWBSs8Kzlvm4ZjCT8Tfn4RTbyq2UJeHEw8qKvFywIS6g9c/au+io/RsC8
	SaeTdRATzewBHXwU8Ts5NK89sRP2MurIij2s6c5EMlC1mdrQBP2O9ar+6co78xnsaa+LYbtsJtm
	PLgwKLHAw/ABk1nS+OymzCoL6SWHNHWGvuyamm/53sm2biDtfzARPYOUW1ZVRG3Tjf4OAIOuAeG
	ltrWP/hTDI7Mw858QIt6mwy6pXZ/x23gmGgYda4GYBd9FOD/rkVuEmgk44qI5EY2Q3/5Q1lRN7x
	49tWTeb+niPXUomPOB4xWy2ooWvmISFJ3GT2ugpYz11uqoMMA=
X-Received: by 2002:a05:7301:1192:b0:30b:d86b:f250 with SMTP id 5a478bee46e88-30bd86c5dcfmr429093eec.0.1781692718566;
        Wed, 17 Jun 2026 03:38:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:38 -0700 (PDT)
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
Subject: [PATCH 36/78] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:53 +0700
Message-ID: <20260617103235.449609-37-phucduc.bui@gmail.com>
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
 sound/soc/codecs/max98095.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..7cdb76f3813b 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1532,15 +1532,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1685,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0

